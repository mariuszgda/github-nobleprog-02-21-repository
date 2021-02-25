#####################################

# prod.tfvars:
# aws data
aws_region = "us-east-1"
aws_profile = "ncsdevops"

# general info
team = "MR"
infrastructure = "second-project"

# vpc data
vpc_cidr = "192.168.2.0/24"

subnet_1_cidr = "192.168.2.0/26"
subnet_2_cidr = "192.168.2.64/26"