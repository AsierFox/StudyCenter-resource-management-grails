package app

class TicketHistory {

    Collection tickets

    static hasMany = [tickets: Ticket]

    static constraints = {
    }
}
