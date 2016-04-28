package app

import grails.transaction.Transactional

@Transactional
class StockService {

    def getStock() {
        Stock.get(1)
    }
}
