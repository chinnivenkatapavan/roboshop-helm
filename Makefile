default:
    helm install $(appName) . -f env-$(env)/$(appName)

#"." is referees to current directory