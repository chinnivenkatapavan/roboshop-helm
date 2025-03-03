app_name=$1
env=$2

if [ -z "$app_name" -o -z "$env" ]; then
  echo Input AppName or env is missing
  exit 1
fi

# If not logged in we will login
argocd account list &>/dev/null
if [ $? -ne 0 ]; then
# Getting Ip address to argocd-server by using shell scripting
argocd_ip=$(kubectl get svc -n argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
# Getting Password to argocd by using shell scripting
argocd_password=$(kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 --decode)
#login the argocd by using shell scripting
argocd login ${argocd_ip} --insecure --username admin --password ${argocd_password}
fi

argocd app create ${app_name} --repo https://github.com/raghudevopsb82/roboshop-helm.git --dest-namespace default --dest-server https://kubernetes.default.svc --values env-${env}/${app_name}.yaml  --path . --helm-set appImage=$appImage
argocd app sync ${app_name}