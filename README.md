# roboshop-helm

argocd.sh file notes
# Getting Ip address to argocd-server by using shell scripting
argocd_ip=$(kubectl get svc -n argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
# Getting Password to argocd by using shell scripting
argocd_password=$(kubectl get secret argocd-initial-admin-secret -n argocd -o=jsonpath='{.data.password}' | base64 --decode)

#login the argocd by using shell scripting
argocd login ${argocd_ip} --insecure --username admin --password ${argocd_password}