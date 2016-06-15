package app

class ProviderController {

    def providerService

    static defaultAction = 'index'

    static allowedMethods = [
        getAllProviders: 'POST',
        getProviderOffer: 'POST'
    ]

    def index() {
        render(view: 'showProviders')
    }

    def showProviderOffers() {
        String providerName = params.id
        request.offers = providerService.getAllProviderOffers(providerName)
        render(view: 'providerOffers')
    }

    def getProviderOffer() {
        render(contentType: 'text/json') {
            providerService.getProviderOffer(params.providerName, params.offerRef)
        }
    }


    def getAllProviders() {
        render(contentType: 'text/json') {
            providerService.getProviders()
        }
    }
}
