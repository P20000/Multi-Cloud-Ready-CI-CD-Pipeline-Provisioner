# Repository structure : 

```
.
├── README.md                                 # The Grand Tome (Updated for GitHub Actions)
├── LICENSE.txt                               # The Royal Decree
├── .github/                                  # NEW! The Automated Scroll Keeper (CI/CD Orchestration)
│   └── workflows/
│       └── main.yml                          # The GitHub Actions Pipeline Definition (Replaces Jenkinsfile)
├── app/                                      # The Pipeline Sentinel Application (Flask + Visualization)
│   ├── Dockerfile                            # Blueprint for the Sentinel Vessel
│   ├── app.py                                # The Flask web server (The Sentinel)
│   ├── state_data.json                       # The source of truth for pipeline status
│   └── templates/
│       └── index.html                        # HTML/CSS for the visual pipeline flow
├── terraform/                                # I. The Great Land Grant (K8s Cluster Provisioning - e.g., EKS)
│   ├── main.tf                               # Defines AWS resources (VPC, EKS Cluster, Security Groups)
│   ├── variables.tf                          # Input variables (AWS region, cluster name)
│   └── outputs.tf                            # Outputs the Kubeconfig details for Ansible/GitHub Actions
├── ansible/                                  # II. The Enchantment of the Forge (Config & Deployment Magic)
│   ├── inventory.ini                         # Targets the K8s API endpoint
│   ├── main-deploy-playbook.yml              # The Master Deployment Chant
│   └── roles/
│       └── sentinel-update-role/             # Role for updating the app's state_data.json file (Used by GitHub Actions)
└── kubernetes/                               # III. The Garrison Strongholds
    └── deployment-service.yml                # Manifest for K8s Deployment and Service (The Garrison)

```
