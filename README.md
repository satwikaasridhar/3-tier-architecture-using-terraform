# 3-tier-architecture-using-terraform

This project automates the deployment of a **3-tier architecture** on AWS using Terraform. The architecture consists of:  

### **1️⃣ Network Layer (VPC & Subnets)**
- A **custom VPC** with CIDR allocation.  
- **Public and private subnets** across multiple availability zones for high availability.  
- **Route tables** for defining public and private network communication.  
- **Internet Gateway** for public subnets and **NAT Gateway** for allowing private subnet instances to access the internet securely.  

### **2️⃣ Compute & Load Balancing Layer**  
- **EC2 instances** deployed within an **Auto Scaling Group (ASG)** to handle traffic fluctuations.  
- **Application Load Balancer (ALB)** for distributing incoming traffic across multiple EC2 instances.  
- **Security Groups** for controlling inbound and outbound traffic between layers.  

### **3️⃣ Database Layer**  
- **RDS database instance** deployed within a private subnet to ensure security.  
- **Database Subnet Group** to provide redundancy across multiple AZs.  
- **Security Group for RDS** to allow access only from application servers.  

### **4️⃣ Terraform Configuration**  
- **Provider Block:** Defines the AWS provider and required configurations.  
- **Variable Block:** Contains user-defined variables such as region, instance type, and subnet CIDRs for flexibility.  
- **State Management:** Uses an **S3 bucket for remote state storage** with **DynamoDB for state locking** to ensure consistency in deployments.  
- **Output Block:** Displays key infrastructure details like VPC ID, ALB DNS name, and RDS endpoint after deployment.  

### **5️⃣ Deployment Process**  
1. **Initialize Terraform** to set up the working directory.  
2. **Plan the infrastructure** to preview changes before applying them.  
3. **Apply the Terraform configuration** to provision the resources.  
4. **Destroy the infrastructure** when it is no longer needed.  

This project follows **best DevOps practices**, ensuring scalability, security, and automation in AWS infrastructure management. 🚀
