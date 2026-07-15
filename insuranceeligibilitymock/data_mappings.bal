// ---- Mock Eligibility Data ----

final map<EligibilityResponse> mockEligibilityData = {
    "P001": {
        patientId: "P001",
        patientName: "Alice Johnson",
        insurerId: "INS001",
        insurerName: "BlueCross BlueShield",
        memberId: "BCB-100234",
        groupNumber: "GRP-5521",
        status: "ACTIVE",
        effectiveDate: "2025-01-01",
        terminationDate: "2025-12-31",
        planId: "PLAN-GOLD-001",
        planName: "Gold PPO Plan",
        primaryInsurance: true
    },
    "P002": {
        patientId: "P002",
        patientName: "Robert Martinez",
        insurerId: "INS002",
        insurerName: "Aetna Health",
        memberId: "AET-200456",
        groupNumber: "GRP-7743",
        status: "ACTIVE",
        effectiveDate: "2024-07-01",
        terminationDate: "2026-06-30",
        planId: "PLAN-SILVER-002",
        planName: "Silver HMO Plan",
        primaryInsurance: true
    },
    "P003": {
        patientId: "P003",
        patientName: "Sandra Lee",
        insurerId: "INS003",
        insurerName: "United Healthcare",
        memberId: "UHC-300789",
        groupNumber: "GRP-9910",
        status: "TERMINATED",
        effectiveDate: "2023-01-01",
        terminationDate: "2024-12-31",
        planId: "PLAN-BRONZE-003",
        planName: "Bronze EPO Plan",
        primaryInsurance: false
    },
    "P004": {
        patientId: "P004",
        patientName: "James Wilson",
        insurerId: "INS001",
        insurerName: "BlueCross BlueShield",
        memberId: "BCB-400112",
        groupNumber: "GRP-5521",
        status: "PENDING",
        effectiveDate: "2026-08-01",
        terminationDate: "2027-07-31",
        planId: "PLAN-GOLD-001",
        planName: "Gold PPO Plan",
        primaryInsurance: true
    }
};

// ---- Mock Plan Data ----

final map<PlanResponse> mockPlanData = {
    "PLAN-GOLD-001": {
        planId: "PLAN-GOLD-001",
        planName: "Gold PPO Plan",
        planType: "PPO",
        insurerId: "INS001",
        insurerName: "BlueCross BlueShield",
        networkType: "In-Network",
        effectiveDate: "2025-01-01",
        renewalDate: "2025-12-31",
        monthlyPremium: 520.00,
        coverageDetails: [
            {
                serviceType: "Primary Care",
                coinsurancePercent: 10.0,
                deductible: 500.00,
                deductibleMet: 250.00,
                outOfPocketMax: 3000.00,
                outOfPocketMet: 750.00,
                copay: 20.00,
                requiresReferral: false,
                requiresPreAuth: false
            },
            {
                serviceType: "Specialist",
                coinsurancePercent: 20.0,
                deductible: 500.00,
                deductibleMet: 250.00,
                outOfPocketMax: 3000.00,
                outOfPocketMet: 750.00,
                copay: 40.00,
                requiresReferral: false,
                requiresPreAuth: false
            },
            {
                serviceType: "Emergency Room",
                coinsurancePercent: 20.0,
                deductible: 500.00,
                deductibleMet: 250.00,
                outOfPocketMax: 3000.00,
                outOfPocketMet: 750.00,
                copay: 150.00,
                requiresReferral: false,
                requiresPreAuth: false
            },
            {
                serviceType: "Inpatient Hospital",
                coinsurancePercent: 20.0,
                deductible: 500.00,
                deductibleMet: 250.00,
                outOfPocketMax: 3000.00,
                outOfPocketMet: 750.00,
                copay: 0.00,
                requiresReferral: false,
                requiresPreAuth: true
            }
        ]
    },
    "PLAN-SILVER-002": {
        planId: "PLAN-SILVER-002",
        planName: "Silver HMO Plan",
        planType: "HMO",
        insurerId: "INS002",
        insurerName: "Aetna Health",
        networkType: "In-Network",
        effectiveDate: "2024-07-01",
        renewalDate: "2026-06-30",
        monthlyPremium: 380.00,
        coverageDetails: [
            {
                serviceType: "Primary Care",
                coinsurancePercent: 20.0,
                deductible: 1500.00,
                deductibleMet: 600.00,
                outOfPocketMax: 6000.00,
                outOfPocketMet: 1200.00,
                copay: 30.00,
                requiresReferral: true,
                requiresPreAuth: false
            },
            {
                serviceType: "Specialist",
                coinsurancePercent: 30.0,
                deductible: 1500.00,
                deductibleMet: 600.00,
                outOfPocketMax: 6000.00,
                outOfPocketMet: 1200.00,
                copay: 60.00,
                requiresReferral: true,
                requiresPreAuth: true
            },
            {
                serviceType: "Emergency Room",
                coinsurancePercent: 30.0,
                deductible: 1500.00,
                deductibleMet: 600.00,
                outOfPocketMax: 6000.00,
                outOfPocketMet: 1200.00,
                copay: 200.00,
                requiresReferral: false,
                requiresPreAuth: false
            }
        ]
    },
    "PLAN-BRONZE-003": {
        planId: "PLAN-BRONZE-003",
        planName: "Bronze EPO Plan",
        planType: "EPO",
        insurerId: "INS003",
        insurerName: "United Healthcare",
        networkType: "In-Network",
        effectiveDate: "2023-01-01",
        renewalDate: "2024-12-31",
        monthlyPremium: 210.00,
        coverageDetails: [
            {
                serviceType: "Primary Care",
                coinsurancePercent: 40.0,
                deductible: 5000.00,
                deductibleMet: 5000.00,
                outOfPocketMax: 8000.00,
                outOfPocketMet: 5500.00,
                copay: 50.00,
                requiresReferral: false,
                requiresPreAuth: false
            },
            {
                serviceType: "Emergency Room",
                coinsurancePercent: 40.0,
                deductible: 5000.00,
                deductibleMet: 5000.00,
                outOfPocketMax: 8000.00,
                outOfPocketMet: 5500.00,
                copay: 350.00,
                requiresReferral: false,
                requiresPreAuth: false
            }
        ]
    }
};

// ---- Mock Claims Data ----

final map<ClaimDetail[]> mockClaimsData = {
    "P001": [
        {
            claimId: "CLM-2025-0001",
            patientId: "P001",
            memberId: "BCB-100234",
            providerId: "PRV-001",
            providerName: "City Medical Center",
            serviceDate: "2025-03-10",
            submittedDate: "2025-03-15",
            status: "PAID",
            diagnosisCode: "J06.9",
            totalBilled: 350.00,
            totalAllowed: 280.00,
            totalPaid: 224.00,
            patientResponsibility: 56.00,
            denialReason: "",
            claimItems: [
                {
                    procedureCode: "99213",
                    description: "Office Visit - Established Patient",
                    billedAmount: 200.00,
                    allowedAmount: 160.00,
                    paidAmount: 128.00
                },
                {
                    procedureCode: "87880",
                    description: "Strep A Test",
                    billedAmount: 150.00,
                    allowedAmount: 120.00,
                    paidAmount: 96.00
                }
            ]
        },
        {
            claimId: "CLM-2025-0042",
            patientId: "P001",
            memberId: "BCB-100234",
            providerId: "PRV-005",
            providerName: "Sunrise Radiology",
            serviceDate: "2025-05-22",
            submittedDate: "2025-05-28",
            status: "APPROVED",
            diagnosisCode: "M54.5",
            totalBilled: 1200.00,
            totalAllowed: 950.00,
            totalPaid: 760.00,
            patientResponsibility: 190.00,
            denialReason: "",
            claimItems: [
                {
                    procedureCode: "72148",
                    description: "MRI Lumbar Spine without Contrast",
                    billedAmount: 1200.00,
                    allowedAmount: 950.00,
                    paidAmount: 760.00
                }
            ]
        }
    ],
    "P002": [
        {
            claimId: "CLM-2025-0018",
            patientId: "P002",
            memberId: "AET-200456",
            providerId: "PRV-002",
            providerName: "Downtown Family Clinic",
            serviceDate: "2025-02-14",
            submittedDate: "2025-02-20",
            status: "PAID",
            diagnosisCode: "Z00.00",
            totalBilled: 250.00,
            totalAllowed: 200.00,
            totalPaid: 140.00,
            patientResponsibility: 60.00,
            denialReason: "",
            claimItems: [
                {
                    procedureCode: "99395",
                    description: "Preventive Visit - Age 18-39",
                    billedAmount: 250.00,
                    allowedAmount: 200.00,
                    paidAmount: 140.00
                }
            ]
        },
        {
            claimId: "CLM-2025-0067",
            patientId: "P002",
            memberId: "AET-200456",
            providerId: "PRV-008",
            providerName: "Metro Orthopedics",
            serviceDate: "2025-06-05",
            submittedDate: "2025-06-10",
            status: "DENIED",
            diagnosisCode: "M23.61",
            totalBilled: 4500.00,
            totalAllowed: 0.00,
            totalPaid: 0.00,
            patientResponsibility: 4500.00,
            denialReason: "Prior authorization not obtained",
            claimItems: [
                {
                    procedureCode: "29881",
                    description: "Knee Arthroscopy with Meniscectomy",
                    billedAmount: 4500.00,
                    allowedAmount: 0.00,
                    paidAmount: 0.00
                }
            ]
        },
        {
            claimId: "CLM-2025-0089",
            patientId: "P002",
            memberId: "AET-200456",
            providerId: "PRV-003",
            providerName: "Valley Emergency Hospital",
            serviceDate: "2025-07-01",
            submittedDate: "2025-07-03",
            status: "IN_REVIEW",
            diagnosisCode: "S52.501A",
            totalBilled: 8200.00,
            totalAllowed: 0.00,
            totalPaid: 0.00,
            patientResponsibility: 0.00,
            denialReason: "",
            claimItems: [
                {
                    procedureCode: "99285",
                    description: "Emergency Department Visit - High Complexity",
                    billedAmount: 1500.00,
                    allowedAmount: 0.00,
                    paidAmount: 0.00
                },
                {
                    procedureCode: "73100",
                    description: "X-Ray Wrist - 2 Views",
                    billedAmount: 300.00,
                    allowedAmount: 0.00,
                    paidAmount: 0.00
                },
                {
                    procedureCode: "25600",
                    description: "Closed Treatment Distal Radial Fracture",
                    billedAmount: 6400.00,
                    allowedAmount: 0.00,
                    paidAmount: 0.00
                }
            ]
        }
    ],
    "P003": [
        {
            claimId: "CLM-2024-0155",
            patientId: "P003",
            memberId: "UHC-300789",
            providerId: "PRV-010",
            providerName: "Northside Cardiology",
            serviceDate: "2024-09-18",
            submittedDate: "2024-09-25",
            status: "PAID",
            diagnosisCode: "I10",
            totalBilled: 600.00,
            totalAllowed: 480.00,
            totalPaid: 288.00,
            patientResponsibility: 192.00,
            denialReason: "",
            claimItems: [
                {
                    procedureCode: "99214",
                    description: "Office Visit - Moderate Complexity",
                    billedAmount: 300.00,
                    allowedAmount: 240.00,
                    paidAmount: 144.00
                },
                {
                    procedureCode: "93000",
                    description: "Electrocardiogram with Interpretation",
                    billedAmount: 300.00,
                    allowedAmount: 240.00,
                    paidAmount: 144.00
                }
            ]
        }
    ]
};
