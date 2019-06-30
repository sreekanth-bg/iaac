echo "########################################################"
echo "### Install kubectl#####################################"
echo "########################################################"
# Download the latest release:
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl  
# Make the kubectl binary executable.
chmod +x ./kubectl
kubectl version
