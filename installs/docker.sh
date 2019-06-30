echo "########################################################"
echo "### Install Docker #####################################"
echo "########################################################"
# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  
# add the docker stable repository
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
  
apt-get update -y		
apt-get install -y docker-ce
  
echo "########################################################"
echo "### Install Docker Compose #############################"
echo "########################################################"
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f4)
echo $COMPOSE_VERSION
curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose 
docker-compose -v
