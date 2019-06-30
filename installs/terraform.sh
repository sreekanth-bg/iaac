echo "########################################################"
echo "### Install Terraform ##################################"
echo "########################################################"
# Download the latest release:
wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
unzip terraform_0.12.3_linux_amd64.zip -d ~
rm terraform_0.12.3_linux_amd64.zip
# Make the terraform binary executable.
sudo chmod +x terraform
export PATH="$PATH:~"
source ~/.profile 
terraform version
