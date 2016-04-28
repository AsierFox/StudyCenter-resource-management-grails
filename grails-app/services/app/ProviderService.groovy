package app

import grails.transaction.Transactional

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase

import org.bson.Document
import com.mongodb.Block
import com.mongodb.client.FindIterable

@Transactional
class ProviderService {
    private static MongoClient sMongoClient
    private static final String host = 'localhost'
    private static final int port = 27017
    private static final String databaseName = 'test'
    private static final String providersCollectionName = 'providers'

    def createConnection() {
        if(sMongoClient == null){
            sMongoClient = new MongoClient(host, port)
        }
        return sMongoClient
    }

    def getAllProviderOffers(provider) {
        MongoDatabase db = createConnection().getDatabase(databaseName)
        FindIterable<Document> it = db.getCollection(providersCollectionName).find()
        Collection offers = []

        it.forEach(new Block<Document>() {
            @Override
            public void apply(final Document document) {
                document.providers.each {
                    it.offers.each { offers.add(it) }
                }
            }
        })
        offers
    }

    def getProviders() {
        MongoDatabase db = createConnection().getDatabase(databaseName)
        FindIterable<Document> it = db.getCollection(providersCollectionName).find()
        Collection providers = []

        it.forEach(new Block<Document>() {
            @Override
            public void apply(final Document document) {
                document.providers.each { providers.add(it) }
            }
        })
        providers
    }
}
