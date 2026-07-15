import ballerina/time;
import ballerina/uuid;

// Generate a unique claim ID
function generateClaimId() returns string {
    string uniquePart = uuid:createType4AsString().substring(0, 8).toUpperAscii();
    return string `CLM-${uniquePart}`;
}

// Generate a unique verification ID
function generateVerificationId() returns string {
    string uniquePart = uuid:createType4AsString().substring(0, 8).toUpperAscii();
    return string `VER-${uniquePart}`;
}

// Get current UTC timestamp as a string
function getCurrentTimestamp() returns string {
    time:Utc currentTime = time:utcNow();
    return time:utcToString(currentTime);
}

// Build ClaimSummary list from ClaimDetail list
function toClaimSummaries(ClaimDetail[] claimDetails) returns ClaimSummary[] {
    ClaimSummary[] summaries = [];
    foreach ClaimDetail claimDetail in claimDetails {
        ClaimSummary summary = {
            claimId: claimDetail.claimId,
            patientId: claimDetail.patientId,
            providerId: claimDetail.providerId,
            providerName: claimDetail.providerName,
            serviceDate: claimDetail.serviceDate,
            submittedDate: claimDetail.submittedDate,
            status: claimDetail.status,
            totalBilled: claimDetail.totalBilled,
            totalPaid: claimDetail.totalPaid
        };
        summaries.push(summary);
    }
    return summaries;
}

// Calculate total billed from claim items
function calculateTotalBilled(ClaimItem[] claimItems) returns decimal {
    decimal total = 0.0;
    foreach ClaimItem claimItem in claimItems {
        total += claimItem.billedAmount;
    }
    return total;
}
