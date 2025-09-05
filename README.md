# cicd-k8s-jenkins-aws
# 🚀 A complete DevOps pipeline for deploying a React application using Jenkins, Docker, SonarQube, Trivy, and Kubernetes on AWS.

### 👩‍💻 Created by: [Khushi Mehta](https://github.com/Khushi-Mehta66)

This project demonstrates the complete DevOps lifecycle of deploying a React web application using a Jenkins CI/CD pipeline, Docker, SonarQube, Trivy, and Kubernetes on AWS.

flowchart TD
    A[Developer Push Code] --> B[Jenkins Pipeline]
    
    B --> B1[Clean Workspace]
    B --> B2[Checkout Code from GitHub]
    B2 --> B3[SonarQube Analysis]
    B3 --> B4[Quality Gate]
    B4 --> B5[Install Node Dependencies]
    B5 --> B6[Build Docker Image]
    B6 --> B7[Push Image to DockerHub]
    B7 --> B8[Trivy Scan - Vulnerability Report]
    B8 --> B9[Local Docker Run (Test)]
    B9 --> B10[Deploy to Kubernetes on AWS]
    
    B10 --> C[Kubernetes Cluster]
    C --> C1[Master Node - Deploy Pods]
    C --> C2[Worker Node - Run React Containers]
    
    C --> D[End User Access via LoadBalancer]
    
---

## 🧰 Tech Stack

- **Jenkins** – Automation server for CI/CD
- **SonarQube** – Static code analysis
- **Trivy** – Container vulnerability scanning
- **Docker** – Containerization
- **Kubernetes** – Container orchestration
- **AWS EC2** – Cloud instance hosting Jenkins, SonarQube, and K8s

---

## 🛠️ Tools & Versions Used

| Tool             | Version / Details     |
|------------------|------------------------|
| Jenkins          | LTS version            |
| Java             | OpenJDK 17 (Temurin)   |
| SonarQube        | Community Edition      |
| Trivy            | Latest (via APT repo)  |
| NodeJS           | v24                    |
| Docker           | Latest stable          |
| Kubernetes       | v1.29                  |
| OS               | Ubuntu 22.04 LTS       |

---

## 🧪 Pipeline Stages in Jenkins

1. ✅ **Clean Workspace**
2. 🧾 **Checkout Code** from GitHub
3. 🔍 **SonarQube Analysis**
4. ✅ **Quality Gate**
5. 📦 **Install Node Dependencies**
6. 🐳 **Build & Push Docker Image**
7. 🔐 **Scan Image with Trivy**
8. 🧪 **Local Docker Run (for test)**
9. ☸️ **Deploy to Kubernetes Cluster**

---

## 📂 Folder Structure

├── Jenkins-steps.txt
├── pipeline.txt
├── k8s-ubuntu-master.sh
├── k8s-ubuntu-slave.sh
├── install-docker.sh
├── trivy.sh
├── jenkins.sh
├── README.md
└── src/ https://github.com/Khushi-Mehta66/2048-React-CICD

🗂️ Jenkins Configuration

- JDK Tool: jdk17 (17.0.8.1)
- NodeJS Tool: node24
- Sonar Scanner Tool: sonar-scanner (7.1.0)
- Docker Tool Name: docker
Credentials:
- DockerHub (username/password)
- Sonar-token (secret text)
- k8s (kubeconfig or username/password)

🧪 SonarQube & Trivy Integration

SonarQube is integrated using plugin and webhook for Quality Gates.
Trivy scans the Docker image and stores output in trivy.txt.

📝 How to Run This Project

-> Configure kubernetes master and slave node
-> Clone the repo
-> Setup SonarCube
-> Setup Jenkins with required tools/plugins
-> Configure credentials
-> Add Jenkinsfile to pipeline job
-> Run the job and check deployment in Kubernetes
