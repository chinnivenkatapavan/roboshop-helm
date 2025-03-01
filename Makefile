default:
    #"." is referees to current directory
    #helm install $(appName) . -f env-$(env)/$(appName)
    #upgrade -i helps to re run or re-install pods
    helm upgrade -i $(appName) . -f env-$(env)/$(appName)

dev:
    git pull
    helm upgrade -i cart . -f env-dev/cart.yml
    helm upgrade -i catalogue . -f env-dev/catalogue.yml
    helm upgrade -i user . -f env-dev/user.yml
    helm upgrade -i payment . -f env-dev/payment.yml
    helm upgrade -i shipping . -f env-dev/shipping.yml
    helm upgrade -i frontend . -f env-dev/frontend.yml