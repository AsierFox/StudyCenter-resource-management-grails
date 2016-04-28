package app

class StockLine {

    Component component
    int remaining
    int total

    static constraints = {
        total(defaultValue: "0", min: 0)
    }
}
