package app

class ProviderController {

    def providerService

    static defaultAction = 'index'

    static allowedMethods = [getAllProviders: 'POST']

    def index() {
        render(view: '/provider/showProviders')
    }

    def getAllProviders() {
        render(contentType: 'text/json') {[
            'providers': providerService.getProviders().json
        ]}
    }

}
