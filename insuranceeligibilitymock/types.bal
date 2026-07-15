// ---- Eligibility Types ----

type EligibilityStatus "ACTIVE"|"INACTIVE"|"PENDING"|"TERMINATED";

type EligibilityResponse record {
    string patientId;
    string patientName;
    string insurerId;
    string insurerName;
    string memberId;
    string groupNumber;
    EligibilityStatus status;
    string effectiveDate;
    string terminationDate;
    string planId;
    string planName;
    boolean primaryInsurance;
};

type EligibilityVerifyRequest record {
    string patientId;
    string patientName;
    string dateOfBirth;
    string insurerId;
    string memberId;
    string groupNumber;
    string serviceDate;
};

type EligibilityVerifyResponse record {
    string verificationId;
    string patientId;
    EligibilityStatus status;
    string verifiedAt;
    string message;
    string planId;
};

// ---- Plan Types ----

type CoverageDetail record {
    string serviceType;
    decimal coinsurancePercent;
    decimal deductible;
    decimal deductibleMet;
    decimal outOfPocketMax;
    decimal outOfPocketMet;
    decimal copay;
    boolean requiresReferral;
    boolean requiresPreAuth;
};

type PlanResponse record {
    string planId;
    string planName;
    string planType;
    string insurerId;
    string insurerName;
    string networkType;
    string effectiveDate;
    string renewalDate;
    decimal monthlyPremium;
    CoverageDetail[] coverageDetails;
};

// ---- Claims Types ----

type ClaimStatus "SUBMITTED"|"IN_REVIEW"|"APPROVED"|"DENIED"|"PAID"|"APPEALED";

type ClaimItem record {
    string procedureCode;
    string description;
    decimal billedAmount;
    decimal allowedAmount;
    decimal paidAmount;
};

type ClaimSummary record {
    string claimId;
    string patientId;
    string providerId;
    string providerName;
    string serviceDate;
    string submittedDate;
    ClaimStatus status;
    decimal totalBilled;
    decimal totalPaid;
};

type ClaimDetail record {
    string claimId;
    string patientId;
    string memberId;
    string providerId;
    string providerName;
    string serviceDate;
    string submittedDate;
    ClaimStatus status;
    string diagnosisCode;
    decimal totalBilled;
    decimal totalAllowed;
    decimal totalPaid;
    decimal patientResponsibility;
    string denialReason;
    ClaimItem[] claimItems;
};

type ClaimSubmitRequest record {
    string patientId;
    string memberId;
    string providerId;
    string providerName;
    string serviceDate;
    string diagnosisCode;
    ClaimItem[] claimItems;
};

type ClaimSubmitResponse record {
    string claimId;
    string patientId;
    ClaimStatus status;
    string submittedDate;
    string message;
};

// ---- Error Types ----

type ErrorResponse record {
    string code;
    string message;
};
