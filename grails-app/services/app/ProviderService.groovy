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
    private static final String host = 'sanluisnet.redirectme.net'
    private static final int port = 57019
    private static final String databaseName = 'compufox'
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
                    if (it.name.equals(provider)) {
                        it.offers.each { offers.add(it) }
                    }
                }
            }
        })
        offers
    }

    def getProviderOffer(providerName, offerRef) {
        MongoDatabase db = createConnection().getDatabase(databaseName)
        FindIterable<Document> it = db.getCollection(providersCollectionName).find()
        Collection offer = []

        it.forEach(new Block<Document>() {
            @Override
            public void apply(final Document document) {
                document.providers.each {
                    if (it.name.equals(providerName)) {
                        it.offers.each {
                            if (it.ref.equals(offerRef)) {
                                offer.add(it)
                                return offer
                            }
                        }
                    }
                }
            }
        })
        return offer
    }

    def getProviders() {
        MongoDatabase db = createConnection().getDatabase(databaseName)
        FindIterable<Document> it = db.getCollection(providersCollectionName).find()
        Document result

        it.forEach(new Block<Document>() {
            @Override
            public void apply(final Document document) {
                result = document
            }
        })
        result
    }
}
