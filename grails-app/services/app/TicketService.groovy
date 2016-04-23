package app

import grails.transaction.Transactional

import static app.Ticket.Status.PENDING

@Transactional
class TicketService {

    /** Returns all the tickets of a technical. */
    def getAllTickets(Technical technical) {
        Ticket.findAllByTechnicalAndByStatus(technical, PENDING)
    }

    /** Returns all the install requests tickets of a technical. */
    def getAllInstallRequestTickets(Technical technical) {
        Ticket.findAllByTechnicalAndClass(technical, InstallRequest.class)
    }

    /** Returns all the issue notification tickets of a technical. */
    def getAllIssueNotificationTickets(Technical technical) {
        Ticket.findAllByTechnicalAndClass(technical, Issue.class)
    }

    /** Returns all the tickets of a technical ordered by date. */
    def getAllTicketsOrderedByDate(Technical technical) {
        Ticket.findAllByTechnical(technical).sort { it.date }.reverse(true)
    }
}
