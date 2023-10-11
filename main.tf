# configure aws provider
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}

data "aws_vpc" "dep4-vpc" {
  id = "vpc-0f20e6dacc9facc75"
}

# create instance
resource "aws_instance" "Deployment4_EC2" {
  # input what OS ID you will use
  ami = "ami-053b0d53c279acc90"
  # input the instance type according to business needs
  instance_type = "t2.medium"
  # input which subnet the EC2 will be linked to 
  subnet_id = "subnet-04bfea6f18cfc8572"
  # input what security group the EC2 will utilize 
  vpc_security_group_ids = ["sg-0e3ae33081d9c6407"]
  # Input which keypair the EC2 will require
  key_name = "KhalilElkharbibi784key"
  # This is if the EC2 needs a public IP, by default this is false
  associate_public_ip_address = true
  # This will run "deploy.sh" when the EC2 is created
  user_data = "${file("deploy.sh")}"

  tags = {
    "Name": "Deployment4_EC2"
  }
}
# request an output of the IP address of the newly created EC2
output "instance_ip" {
  value = aws_instance.Deployment4_EC2.public_ip
}
