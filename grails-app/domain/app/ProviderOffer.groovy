package app

class ProviderOffer {

    String mfrPart // Reference of the component
    Integer sku // Stock keeping unit

    static constraints = {
        mfrPart(unique: true)
    }

}
