# Repository structure : 

```
.
├── README.md                                 # The Grand Tome
├── Jenkinsfile                               # The Pipeline Master Plan
├── app/                                      # The Pipeline Sentinel Application (Flask + Visualization)
│   ├── Dockerfile                            # Blueprint for the Sentinel Vessel
│   ├── app.py                                # The Flask web server for the visualization
│   ├── state_data.json                       # NEW! The source of truth for pipeline status
│   └── templates/                            # HTML/CSS for the visual pipeline flow
│       └── index.html
├── terraform/                                # I. The Great Land Grant
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── ansible/                                  # II. The Enchantment of the Forge (Configuration Magic)
│   ├── inventory.ini
│   ├── main-playbook.yml                     # Master chant: Installs Jenkins/Docker, then runs the 'sentinel-update' task.
│   └── roles/
│       ├── jenkins-setup-role/               # Role for installing Jenkins/Docker
│       └── sentinel-update-role/             # NEW! Role for updating app state files
└── kubernetes/                               # III. The Garrison Strongholds
    └── deployment-service.yml

```