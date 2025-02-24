default:
    #"." is referees to current directory
    #helm install $(appName) . -f env-$(env)/$(appName)
    #upgrade -i helps to re run or re-install pods
    helm upgrade -i $(appName) . -f env-$(env)/$(appName)

