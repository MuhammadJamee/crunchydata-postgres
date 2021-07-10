#!/bin/bash

#Crunchydata Deployment
kubectl create namespace pgo
kubectl apply -f https://raw.githubusercontent.com/CrunchyData/postgres-operator/v4.6.2/installers/kubectl/postgres-operator.yml
read -p "Wait till Pods get ready" -t 3000
kubectl get all -n pgo
echo "Make Sure Everything Is Deployed ...."
#Installing Client In Local System
curl https://raw.githubusercontent.com/CrunchyData/postgres-operator/v4.6.2/installers/kubectl/client-setup.sh > client-setup.sh
chmod +x client-setup.sh
./client-setup.sh
read -n 1 -s -r -p "pgo client files have been generated, please add the following to your bashrc"
#for Terminal usage

# export PGOUSER="${HOME?}/.pgo/pgo/pgouser"
# export PGO_CA_CERT="${HOME?}/.pgo/pgo/client.crt"
# export PGO_CLIENT_CERT="${HOME?}/.pgo/pgo/client.crt"
# export PGO_CLIENT_KEY="${HOME?}/.pgo/pgo/client.key"
export PGO_APISERVER_URL='https://127.0.0.1:8443'
export PGO_NAMESPACE=pgo
#Check deployments
kubectl -n pgo get deployments
read -n 1 -s -r -p "Press any key to continue"
kubectl -n pgo get pods
read -n 1 -s -r -p "Press any key to continue"
#Forward the port
echo "Please port-forward in another terminal"
read -p "kubectl -n pgo port-forward svc/postgres-operator 8443:8443" -t 300 
read -n 1 -s -r -p "Verify the installation, use command pgo version"
