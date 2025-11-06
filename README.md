
<a id="readme-top"></a>
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Unlicense License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<br />
<div align="center">
  <a href="https://github.com/P20000/ci-cd-provisioner">
    <img src="https://i.imgur.com/8QjN4Nl.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Multi-Cloud-Ready CI/CD Pipeline Provisioner</h3>

  <p align="center">
    Automating the entire CI/CD infrastructure setup from Cloud to Application deployment using Terraform and Ansible.
    <br />
    <a href="#about-the-project"><strong>Explore the Documentation »</strong></a>
    <br />
    <br />
    <a href="[Link to Demo Video]">View Video Demo</a>
    &middot;
    <a href="https://github.com/P20000/ci-cd-provisioner/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/P20000/ci-cd-provisioner/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#architecture">Architecture</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation & Provisioning</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage (The Pipeline Flow)</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

---

## About The Project

This project demonstrates a fully automated, **end-to-end DevOps pipeline** where the infrastructure itself is provisioned and configured using Infrastructure as Code (IaC) and Configuration Management (CM). The primary goal is to establish a repeatable, version-controlled process for deploying a containerized application to a Kubernetes environment.

This addresses the critical challenge in DevOps: reliably setting up the entire tooling ecosystem before deploying the application.

### Architecture

The system is defined by three main stages: Provisioning, Configuration, and Deployment.

1.  **Provisioning (Terraform):** Creates the base infrastructure on **AWS**, including a dedicated EC2 instance for the Jenkins server and the necessary network/security components.
2.  **Configuration (Ansible):** Connects to the new EC2 instance and uses **Ansible Roles** to install, configure, and secure **Jenkins** and **Docker**, preparing the CI/CD master.
3.  **Deployment (Jenkins Pipeline):** A `Jenkinsfile` orchestrates the build, containerization, and the final deployment step, which uses **Ansible** again to apply Kubernetes manifests.



<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

This project showcases integration and proficiency across the following key technologies:

| Category | Tool | Description |
| :--- | :--- | :--- |
| **Cloud Provider** | **AWS** | Hosting the CI/CD server (EC2) and target environment. |
| **Infrastructure as Code (IaC)** | **Terraform** | Provisioning all AWS resources. |
| **Configuration Management (CM)** | **Ansible** | Core tool for installing and configuring Jenkins/Docker. |
| **CI/CD Orchestration** | **Jenkins** | Driving the entire build and deployment process via `Jenkinsfile`. |
| **Containerization** | **Docker** | Packaging the sample Python application. |
| **Application Runtime** | **Kubernetes** | The target environment for high-availability application deployment. |
| **Code** | **Python** | Sample Flask application code. |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## Getting Started

Follow these steps to deploy the entire CI/CD infrastructure and run the sample application pipeline.

### Prerequisites

You must have the following tools installed and configured locally:

* **AWS Account** & **AWS CLI:** Configured with credentials and a default region.
* **Terraform CLI** (`v1.0.0+`): For provisioning infrastructure.
* **Ansible** (`v2.9+`): For server configuration.
* **Docker** (Local): To build and test the application container locally.
* **Kubectl** (Optional, for manual verification).

### Installation & Provisioning

The installation involves two main phases: provisioning the cloud resources and then configuring the services.

#### 1. Provision AWS Infrastructure (Terraform)

Navigate to the `terraform/` directory and run the following commands:

```sh
cd terraform/
terraform init
terraform plan
terraform apply --auto-approve
````

> **Output Note:** Terraform will output the public IP of the newly created Jenkins server and the required SSH key location.

#### 2\. Configure Jenkins Server (Ansible)

Using the IP address generated by Terraform, update the `ansible/inventory.ini` file. Then, run the main playbook:

```sh
cd ../ansible/
# Ensure the inventory.ini is updated with the Jenkins Server IP
ansible-playbook -i inventory.ini main-playbook.yml
```

> **Action:** This playbook uses the `jenkins-setup-role` to install Java, Docker, and Jenkins, and configure them to start on boot.

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## Usage (The Pipeline Flow)

Once the infrastructure is configured, the system is ready for continuous delivery.

### The CI/CD Pipeline Flow

1.  **Access Jenkins:** Open your browser to `http://<Jenkins_Server_IP>:8080` to complete the initial setup.
2.  **Configure Pipeline:** Create a new Pipeline job in Jenkins, pointing it to this GitHub repository and using the included `Jenkinsfile`.
3.  **Trigger:** Make a small code change in `app/app.py`, commit, and push it to the `main` branch of this repository.

#### Pipeline Steps:

| Stage | Tool | Description |
| :--- | :--- | :--- |
| **SCM Checkout** | Git | Retrieves the latest code from GitHub. |
| **Build & Push** | Docker | Builds the new Docker image and pushes it to Docker Hub/ECR. |
| **Deploy to K8s** | **Ansible** | Executes the final deployment using Ansible's K8s module to apply the service manifests in the `kubernetes/` directory. |

### Concrete Evidence

The successful completion of the deployment is verified by:

  * **Jenkins Console Output:** Showing the final green status and output from the Ansible deployment step.
  * **Running Application:** Accessing the service endpoint exposed by the Kubernetes cluster to see the updated application version.

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## Roadmap

Future enhancements for making the pipeline even more robust:

  - [ ] Implement **Terraform Remote State** using S3 for production readiness.
  - [ ] Replace simple K8s cluster with a managed **AWS EKS** cluster.
  - [ ] Add a **Testing Stage** to the `Jenkinsfile` (e.g., Python unit tests).
  - [ ] Convert Jenkins installation from local Ansible role to a **Docker container setup**.
  - [ ] Integrate **Nagios** monitoring setup via Ansible.

See the [open issues](https://www.google.com/search?q=https://github.com/P20000/ci-cd-provisioner/issues) for a full list of proposed features (and known issues).

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## License

Distributed under the Unlicense License. See `LICENSE.txt` for more information.

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## Contact

P20000 - [@your\_twitter](https://twitter.com/your_username) - email@example.com

Project Link: [https://github.com/P20000/ci-cd-provisioner](https://www.google.com/url?sa=E&source=gmail&q=https://github.com/P20000/ci-cd-provisioner)

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----

## Acknowledgments

  * [Best-README-Template](https://github.com/othneildrew/Best-README-Template)
  * [Ansible Galaxy](https://galaxy.ansible.com/) - For role inspiration.
  * [Img Shields](https://shields.io)

\<p align="right"\>(\<a href="\#readme-top"\>back to top\</a\>)\</p\>

-----
