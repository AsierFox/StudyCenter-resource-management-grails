package app

import grails.transaction.Transactional

import grails.plugins.rest.client.RestBuilder

@Transactional
class ProviderService {

    def getProviders() {
        return new RestBuilder().get('http://jsonplaceholder.typicode.com/posts')
    }
}
