- Create a VPC:
  - Name: KCVPC
  - IPv4 CIDR block: 10.0.0.0/16
  ![](/tasks/promotional-task-6/assets/create_vpc.png)
- Create Subnets:
  - Public Subnet:
  - Name: PublicSubnet
  - IPv4 CIDR block: 10.0.1.0/24
  - Availability Zone: Select any one from your region
- Private Subnet:
  - Name: PrivateSubnet
  - IPv4 CIDR block: 10.0.2.0/24
  - Availability Zone: Select any one from your region (preferably the same as the Public Subnet for simplicity)
  ![](/tasks/promotional-task-6/assets/create_subnets.png)
- Configure an Internet Gateway (IGW):
  - Create and attach an IGW to KCVPC.
  ![](/tasks/promotional-task-6/assets/setup_IGW.png)
- Configure Route Tables:
  - Public Route Table:
    - Name: PublicRouteTable
    - Associate PublicSubnet with this route table.
    - Add a route to the IGW (0.0.0.0/0 -> IGW).
  ![](/tasks/promotional-task-6/assets/public_route_table.png)
  - Private Route Table:
    - Name: PrivateRouteTable
    - Associate PrivateSubnet with this route table.
    - Ensure no direct route to the internet.
    - ![](/tasks/promotional-task-6/assets/private_route_table.png)
- Configure NAT Gateway:
  - Create a NAT Gateway in the PublicSubnet.
  - Allocate an Elastic IP for the NAT Gateway.
  - Update the PrivateRouteTable to route internet traffic (0.0.0.0/0) to the NAT Gateway.
  ![](/tasks/promotional-task-6/assets/allocate_elasic_ip_to_na_gw.png)
- Set Up Security Groups:
  - Create a Security Group for public instances (e.g., web servers):
    - Allow inbound HTTP (port 80) and HTTPS (port 443) traffic from anywhere (0.0.0.0/0).
    - Allow inbound SSH (port 22) traffic from a specific IP (e.g., your local IP). (<https://www.whatismyip.com/>)
    - Allow all outbound traffic.
  ![](/tasks/promotional-task-6/assets/public_sg.png)
  - Create a Security Group for private instances (e.g., database servers):
    - Allow inbound traffic from the PublicSubnet on required ports (e.g., PostgreSQL port).
    - Allow all outbound traffic.
  ![](/tasks/promotional-task-6/assets/private_sg.png)
- Network ACLs:
  - Configure NACLs for additional security on both subnets.
  - Public Subnet NACL: Allow inbound HTTP, HTTPS, and SSH traffic. Allow outbound traffic.
  - Private Subnet NACL: Allow inbound traffic from the public subnet. Allow outbound traffic to the public subnet and internet.
- Deploy Instances:
  - Launch an EC2 instance in the PublicSubnet:
    - Use the public security group.
    - Verify that the instance can be accessed via the internet.
![](/tasks/promotional-task-6/assets/public_ec2_instance.png)
  - Launch an EC2 instance in the PrivateSubnet:
    - Use the private security group.
    - Verify that the instance can access the internet through the NAT Gateway and can communicate with the public instance.
  ![](/tasks/promotional-task-6/assets/private_ec2_instance.png)
Deliverables:

1. A detailed report with screenshots of each step.
2. Output of terraform plan [terraform plan -out tfplan.json or terraform plan -out tfplan.txt]
