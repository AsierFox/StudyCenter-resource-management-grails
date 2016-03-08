package app

class Provider {

    String name

    ProviderOfferings offerings

    static constraints = {
        name(unique: true)
    }
}
