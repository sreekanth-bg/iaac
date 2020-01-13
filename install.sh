cd ~
sudo apt install unzip
echo "#######################################################"
echo "################### Install Docker ####################"
echo "#######################################################"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add the docker stable repository
sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
apt-get update -y
apt-get install -y docker-ce
echo "################### Add user to docker group ###########"
sudo usermod -aG docker $USER
newgrp docker
echo "########################################################"
echo "### Install Docker Compose #############################"
echo "########################################################"
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f4)
echo $COMPOSE_VERSION
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -v
echo "########################################################"
echo "### Install docker machine #############################"
echo "########################################################"
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
docker-machine version
echo "########################################################"
echo "### Install kubectl#####################################"
echo "########################################################"
# Download the latest release:
sudo curl --silent --location -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# Make the kubectl binary executable.
sudo chmod +x /usr/local/bin/kubectl
kubectl version
echo "########################################################"
echo "### Install Terraform ##################################"
echo "########################################################"
# Download the latest release:
wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
unzip terraform_0.12.3_linux_amd64.zip -d ~
rm terraform_0.12.3_linux_amd64.zip
# Make the terraform binary executable.
sudo chmod +x ~/./terraform
