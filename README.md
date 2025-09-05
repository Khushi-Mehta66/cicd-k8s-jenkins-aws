# cicd-k8s-jenkins-aws
# 🚀 A complete DevOps pipeline for deploying a React application using Jenkins, Docker, SonarQube, Trivy, and Kubernetes on AWS.

### 👩‍💻 Created by: [Khushi Mehta](https://github.com/Khushi-Mehta66)

This project demonstrates the complete DevOps lifecycle of deploying a React web application using a Jenkins CI/CD pipeline, Docker, SonarQube, Trivy, and Kubernetes on AWS.

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

├── Jenkins.txt
├── pipeline
├── k8s-ubuntu-master.txt
├── k8s-ubuntu-slave.txt
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
