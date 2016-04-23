package app

import grails.transaction.Transactional

@Transactional
class TechnicalService {

    /**
     * Gets the Technical with the less amount of Tickets.
     */
    def getLessTicket() {
        Technical.createCriteria()
            .get {
                eq 'class', Technical.class
                min 'numberTickets'
                maxResults 1
            }
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
