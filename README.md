# Azure Enterprise Landing Zone (CAF) Automation with Terraform ☁️

[![Terraform](https://img.shields.io/badge/Terraform-v1.5%2B-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Microsoft_Azure-Landing_Zones-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![CI/CD](https://img.shields.io/badge/GitHub_Actions-Automated_CI-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![Zero Trust](https://img.shields.io/badge/Security-Zero_Trust_Architecture-success?style=for-the-badge&logo=securityscorecard&logoColor=white)](#)

Enterprise Infrastructure as Code (IaC) repository implementing Microsoft's **Cloud Adoption Framework (CAF)** Azure Landing Zones for 100+ application workloads.

---

## 🏛️ Architecture Highlights

```
                                 [ Microsoft Entra ID ]
                                           │
                                 [ Tenant Root Group ]
                                           │
             ┌─────────────────────────────┼─────────────────────────────┐
             ▼                             ▼                             ▼
    [ Platform MG ]              [ Landing Zones MG ]             [ Sandbox MG ]
    ├── Connectivity (Hub VNet)  ├── Production Workloads         └── Dev Experiments
    └── Management               └── Non-Prod (Dev/UAT)
```

1. **Management Group Hierarchy:** Isolated root hierarchy (`platform-mg`, `landingzones-mg`, `sandbox-mg`).
2. **Hub-and-Spoke Networking:**
   - Central Hub Virtual Network hosting Azure Firewall (Standard/Premium) & Gateway Subnet.
   - User Defined Routing (UDR) directing 100% of outbound internet traffic through Firewall inspection.
   - Low-latency bidirectional VNet peering between Hub and Workload Spokes.
3. **Enterprise Governance:** Standardized tagging, policy initiatives, and least-privilege state management.

---

## 📂 Repository Layout

```
├── modules/
│   ├── management_groups/       # CAF hierarchy & root group isolation
│   ├── hub_networking/          # Hub VNet, Azure Firewall & UDR routing table
│   └── spoke_networking/        # Spoke VNet, subnets & peering
├── main.tf                      # Root orchestrator module
├── variables.tf                 # Input specifications with defaults
├── outputs.tf                   # Shared resource identifiers
└── README.md
```

---

## 🚀 Quickstart

```bash
# Initialize and validate
terraform init
terraform fmt -check
terraform validate

# Plan and apply
terraform plan -out=tfplan
terraform apply tfplan
```

---

## 👤 Author
**Adesh Gupta**  
*Lead DevSecOps Engineer & Enterprise Cloud Architect*  
- GitHub: [@adeshgupta119-lab](https://github.com/adeshgupta119-lab)  
- Email: [adeshgupta119@gmail.com](mailto:adeshgupta119@gmail.com)

