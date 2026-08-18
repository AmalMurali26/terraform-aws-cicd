# 1. Fetch Ubuntu 22.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 2. EC2 Instance for Jenkins
resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.jenkins_sg_id]
  iam_instance_profile   = var.jenkins_instance_profile
  key_name               = var.key_name

  user_data = <<EOF
#!/bin/bash

# 1. Create and enable a 2 GB Swap file to increase available virtual memory
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Wait for automatic background APT processes to release locks
while pgrep -f "apt|dpkg" >/dev/null 2>&1; do
  echo "Waiting for background APT process to finish..."
  sleep 5
done

set -e

# 2. Add OpenJDK PPA & install OpenJDK 21
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update -y
sudo apt-get install -y openjdk-21-jre fontconfig docker.io unzip awscli jq git curl

# 3. Set default Java version to Java 21
sudo update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java

# 4. Enable & start Docker service
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ubuntu

# 5. Create keyrings directory & import current Jenkins GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key | sudo tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# 6. Install Jenkins
sudo apt-get update -y
sudo apt-get install -y jenkins

# 7. Configure Docker group permissions & restart Jenkins
sudo usermod -aG docker jenkins
sudo systemctl enable jenkins
sudo systemctl restart jenkins
EOF

  tags = {
    Name = var.jenkins_instance_name
  }
}
