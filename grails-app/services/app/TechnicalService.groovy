package app

import grails.transaction.Transactional

@Transactional
class TechnicalService {

    /**
     * Gets the Technical with the less amount of Tickets.
     */
    def getLessTicket() {
        Technical.where {
            available == true
        }
        .find(sort: 'numberTickets', order: 'asc')
    }

    /**
     * Increments the number of Tickets of the Technical.
     */
    def incrementNumberTickets(Technical technical) {
        technical.numberTickets++
        technical.save(flush: true)
    }

    /**
     * Decrements the number of Tickets of the Technical.
     */
    def decrementNumberTickets(Technical technical) {
        technical.numberTickets--
        technical.save(flush: true)
    }
}
