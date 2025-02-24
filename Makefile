default:
    #"." is referees to current directory
    helm install $(appName) . -f env-$(env)/$(appName)

