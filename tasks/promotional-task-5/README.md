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
   1. Create a Security Group for public instances (e.g., web servers): Allow inbound HTTP (port 80) and HTTPS (port 443) traffic from anywhere (0.0.0.0/0). Allow inbound SSH (port 22) traffic from a specific IP (e.g., your local IP). (<https://www.whatismyip.com/>) Allow all outbound traffic.  ![1](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2000.34.22.png)
   2. Create a Security Group for private instances (e.g., database servers): Allow inbound traffic from the PublicSubnet on required ports (e.g., MySQL port 3306). Allow all outbound traffic. ![db1](/tasks/promotional-task-5/assets/Screenshot%202024-07-04%20at%2022.11.19.png)
7. Network ACLs:
   1. Public Subnet NACL: Allow inbound HTTP, HTTPS, and SSH traffic. Allow outbound traffic. ![NACL](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2000.53.48.png)![Nacl](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.02.03.png)![nacl](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.02.15.png)
   2. Private Subnet NACL: Allow inbound traffic from the public subnet. Allow outbound traffic to the public subnet and internet.![private NACl](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.11.27.png)![private NACL](/tasks/promotional-task-5/assets/Screenshot%202024-07-09%20at%2001.12.19.png)
8. deploying instance in the public subnet ![public instance](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2007.09.30.png)
9. deploying instances in the private subnet ![private insyance](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2007.11.55.png)

## A diagram of the VPC architecture, showing the VPC, subnets, route tables, and security configurations. (<https://excalidraw.com/>)

![image](/tasks/promotional-task-5/assets/Screenshot%202024-07-11%20at%2007.54.24.png)

## A brief explanation of the purpose and function of each component created (VPC, subnets, IGW, NAT Gateway, route tables, security groups, NACLs)

An AWS VPC (Virtual Private Cloud) provides a logically isolated network segment within the AWS cloud.  Here's a breakdown of the key components you mentioned and how they work together:

- VPC:  Imagine a walled garden within your AWS account. This garden, the VPC, is your private network where you can securely deploy your resources.

- Subnets:  Within the VPC, you can create subnets, which are smaller, logically separated segments.  Think of these subnets as designated areas within your garden for different purposes.  You might have a public subnet for web servers accessible from the internet, and a private subnet for your database that only internal resources can access.

- Internet Gateway (IGW):  This acts as the front door to the internet for your VPC. If you need resources within your VPC to communicate with the public internet, the IGW provides the connection point.

- NAT Gateway:  Imagine a one-way gate. The NAT Gateway allows instances in private subnets to initiate outbound connections to the internet (to download updates, for example). However, it restricts inbound traffic, keeping your private resources secure from unsolicited access from the internet.

- Route Tables:  These act as traffic directors within your VPC. Each subnet is associated with a route table that defines how traffic from that subnet is routed. A public subnet's route table will point towards the IGW for internet access, while a private subnet's route table might have a route to the NAT Gateway for outbound traffic.

- Security Groups:  Think of these as security guards for your individual resources (like EC2 instances). Security groups act as firewalls, controlling the inbound and outbound traffic to your instances. You define rules within a security group to specify which ports and protocols are allowed for communication.

- Network Access Control Lists (NACLs):  While not always used, NACLs provide an additional layer of security.  These are firewall rules applied at the subnet level, offering more granular control over the type of traffic allowed in and out of your subnets.
