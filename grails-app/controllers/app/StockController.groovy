package app

class StockController {

    def stockService

    static defaultAction = 'index'

    def index() {
        Stock stock = stockService.getStock()
        request.sock = stock
        request.stockLines = stock.stockLines
        render(view: defaultAction)
    }

}
