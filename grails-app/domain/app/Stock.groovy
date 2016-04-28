package app

class Stock {

    Collection stockLines

    static hasMany = [
        stockLines: StockLine
    ]

    static constraints = {
        stockLines(nullable: true)
    }
}
