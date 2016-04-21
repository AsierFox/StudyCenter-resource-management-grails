package app

class Stock {

    Collection computers
    Collection components

    static hasMany = [
        computers: Computer,
        components: Component
    ]

    static constraints = {
    }
}
