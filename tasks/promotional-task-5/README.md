# Promotional Task 5

## Question

[Click Here to read the question](/tasks/promotional-task-5/question.txt)

## Solution

1. Creating a VPC ans naming it KCVPC, IPv4 CIDR block: 10.0.0.0/16
   ![kcvpc](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2021.35.10.png)
2. creating a Subnet
   1. public subnetName: PublicSubnet, IPv4 CIDR block: 10.0.1.0/24 ![public subnet](/tasks/promotional-task-5/assets/Screenshot%202024-07-10%20at%2023.50.54.png)
   2. PrivateSubnet IPv4 CIDR block: 10.0.2.0/24 ![Private subnet](/tasks/promotional-task-5/assets/Screenshot%202024-07-10%20at%2023.55.20.png)
3. Create and attach an IGW to KCVPC. ![IGW](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2021.47.08.png)
4. Route Tables
   1. Public Route Table: name:PublicRouteTable, Associate Public Subnet with this route table. Add a route to the IGW (0.0.0.0/0 -> IGW)![Route table IGW relation](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2021.54.22.png) ![public route table](/tasks/promotional-task-5/assets/Screenshot%202024-07-10%20at%2022.23.47.png)
   2. Private Route Table: Name: PrivateRouteTable, Associate PrivateSubnet with this route table.![private route table](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2021.48.10.png)![P-Route table final product](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2021.48.32.png)
5. Configure NAT Gateway:
   1. Create a NAT Gateway in the PublicSubnet and Allocate an Elastic IP for the NAT Gateway.![public nat gw](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2000.15.08.png)
   2. Update the PrivateRouteTable to route internet traffic (0.0.0.0/0) to the NAT Gateway.![parivate nat routing](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2000.20.29.png)
6. Set Up Security Groups:
   1. Create a Security Group for public instances (e.g., web servers): Allow inbound HTTP (port 80) and HTTPS (port 443) traffic from anywhere (0.0.0.0/0). Allow inbound SSH (port 22) traffic from a specific IP (e.g., your local IP). (https://www.whatismyip.com/) Allow all outbound traffic. ![1](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.06.07.png) ![2](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.05.54.png) ![3](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.05.54.png) ![4](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.05.16.png)
   2. Create a Security Group for private instances (e.g., database servers): Allow inbound traffic from the PublicSubnet on required ports (e.g., MySQL port 3306). Allow all outbound traffic. ![db1](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.11.19.png) ![db2](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.09.47.png)
7. Network ACLs:
   1. Public Subnet NACL: Allow inbound HTTP, HTTPS, and SSH traffic. Allow outbound traffic. ![NACL](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2000.53.48.png)![](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.02.03.png)![](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.02.15.png)
   2. Private Subnet NACL: Allow inbound traffic from the public subnet. Allow outbound traffic to the public subnet and internet.![](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.11.27.png)![](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.12.19.png)