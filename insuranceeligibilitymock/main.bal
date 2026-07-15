import ballerina/http;
import ballerina/log;

listener http:Listener insuranceListener = check new http:Listener(8290);

service /insurance on insuranceListener {

    // Get eligibility status for a patient
    resource function get eligibility/[string patientId]() returns EligibilityResponse|http:NotFound {
        log:printInfo("Eligibility check requested", patientId = patientId);
        EligibilityResponse? eligibilityRecord = mockEligibilityData[patientId];
        if eligibilityRecord is () {
            return <http:NotFound>{body: <ErrorResponse>{code: "PATIENT_NOT_FOUND", message: string `No eligibility record found for patient: ${patientId}`}};
        }
        return eligibilityRecord;
    }

    // Submit a new eligibility verification request
    resource function post eligibility/verify(@http:Payload EligibilityVerifyRequest verifyRequest) returns EligibilityVerifyResponse|http:BadRequest {
        log:printInfo("Eligibility verification requested", patientId = verifyRequest.patientId);
        string patientId = verifyRequest.patientId;
        EligibilityResponse? existingRecord = mockEligibilityData[patientId];

        EligibilityStatus verifiedStatus = "ACTIVE";
        string planId = "";
        string message = "";

        if existingRecord is EligibilityResponse {
            verifiedStatus = existingRecord.status;
            planId = existingRecord.planId;
            message = string `Eligibility verified. Patient is ${verifiedStatus} under plan ${existingRecord.planName}.`;
        } else {
            verifiedStatus = "INACTIVE";
            message = "No active insurance record found for the provided member details.";
        }

        EligibilityVerifyResponse verifyResponse = {
            verificationId: generateVerificationId(),
            patientId: patientId,
            status: verifiedStatus,
            verifiedAt: getCurrentTimestamp(),
            message: message,
            planId: planId
        };
        return verifyResponse;
    }

    // Get insurance plan details by plan ID
    resource function get plans/[string planId]() returns PlanResponse|http:NotFound {
        log:printInfo("Plan details requested", planId = planId);
        PlanResponse? planRecord = mockPlanData[planId];
        if planRecord is () {
            return <http:NotFound>{body: <ErrorResponse>{code: "PLAN_NOT_FOUND", message: string `No plan found with ID: ${planId}`}};
        }
        return planRecord;
    }

    // Get all claims for a patient
    resource function get claims/[string patientId]() returns ClaimSummary[]|http:NotFound {
        log:printInfo("Claims list requested", patientId = patientId);
        ClaimDetail[]? patientClaims = mockClaimsData[patientId];
        if patientClaims is () {
            return <http:NotFound>{body: <ErrorResponse>{code: "NO_CLAIMS_FOUND", message: string `No claims found for patient: ${patientId}`}};
        }
        return toClaimSummaries(patientClaims);
    }

    // Get a specific claim detail by claim ID
    resource function get claims/detail/[string claimId]() returns ClaimDetail|http:NotFound {
        log:printInfo("Claim detail requested", claimId = claimId);
        foreach string patientId in mockClaimsData.keys() {
            ClaimDetail[]? patientClaims = mockClaimsData[patientId];
            if patientClaims is ClaimDetail[] {
                foreach ClaimDetail claimDetail in patientClaims {
                    if claimDetail.claimId == claimId {
                        return claimDetail;
                    }
                }
            }
        }
        return <http:NotFound>{body: <ErrorResponse>{code: "CLAIM_NOT_FOUND", message: string `No claim found with ID: ${claimId}`}};
    }

    // Submit a new insurance claim
    resource function post claims(@http:Payload ClaimSubmitRequest claimRequest) returns ClaimSubmitResponse|http:BadRequest {
        log:printInfo("New claim submission", patientId = claimRequest.patientId);
        string patientId = claimRequest.patientId;
        ClaimItem[] claimItems = claimRequest.claimItems;

        if claimItems.length() == 0 {
            return <http:BadRequest>{body: <ErrorResponse>{code: "INVALID_REQUEST", message: "Claim must contain at least one claim item."}};
        }

        decimal totalBilled = calculateTotalBilled(claimItems);
        string newClaimId = generateClaimId();
        string submittedDate = getCurrentTimestamp();

        ClaimDetail newClaim = {
            claimId: newClaimId,
            patientId: patientId,
            memberId: claimRequest.memberId,
            providerId: claimRequest.providerId,
            providerName: claimRequest.providerName,
            serviceDate: claimRequest.serviceDate,
            submittedDate: submittedDate,
            status: "SUBMITTED",
            diagnosisCode: claimRequest.diagnosisCode,
            totalBilled: totalBilled,
            totalAllowed: 0.00,
            totalPaid: 0.00,
            patientResponsibility: 0.00,
            denialReason: "",
            claimItems: claimItems
        };

        ClaimDetail[]? existingClaims = mockClaimsData[patientId];
        if existingClaims is ClaimDetail[] {
            existingClaims.push(newClaim);
        } else {
            mockClaimsData[patientId] = [newClaim];
        }

        return <ClaimSubmitResponse>{
            claimId: newClaimId,
            patientId: patientId,
            status: "SUBMITTED",
            submittedDate: submittedDate,
            message: string `Claim ${newClaimId} submitted successfully and is pending review.`
        };
    }
}
