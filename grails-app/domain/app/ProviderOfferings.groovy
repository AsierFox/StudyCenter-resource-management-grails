package app

class ProviderOfferings {

    Collection offerings

    static hasMany = [offerings: ProviderOffer]

    static constraints = {
    }
}
