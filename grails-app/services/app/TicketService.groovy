package app

import grails.transaction.Transactional

import src.groovy.exceptions.TicketException

import static app.Ticket.Status.PENDING
import static app.Ticket.Status.SOLVED
import static app.Ticket.Status.CANCELED

/**
 * Class for managing the general Tickets both one another,
 * Install Request and Issues.
 */
@Transactional
class TicketService {

    def solveTicket(id) throws TicketException {
        Ticket ticket = getTicketById(id)

        ticket.status = SOLVED

        if (!ticket.save(flush: true)) {
            throw new TicketException('The ticket could not been solve')
        }
    }

    def cancelTicket(id) throws TicketException {
        Ticket ticket = getTicketById(id)

        ticket.status = CANCELED

        if (!ticket.save(flush: true)) {
            throw new TicketException('The ticket could not been solve')
        }
    }

    def getAllInstallRequestsByStatus(Technical technical) {
        Collection allTickets = getAllInstallRequestTickets(technical)
        [
            solvedTickets: allTickets.findAll { it.status == SOLVED },
            pendingTickets: allTickets.findAll { it.status == PENDING },
            canceledTickets: allTickets.findAll { it.status == CANCELED }
        ]
    }

    def getAllIssueNotificationsByStatus(Technical technical) {
        Collection allTickets = getAllIssueNotificationTickets(technical)
        [
            solvedTickets: allTickets.findAll { it.status == SOLVED },
            pendingTickets: allTickets.findAll { it.status == PENDING },
            canceledTickets: allTickets.findAll { it.status == CANCELED }
        ]
    }

    def getTicketById(id) {
        Ticket.get(id)
    }

    /** Returns all the tickets. */
    def getAllTickets() {
        Ticket.findAll().sort { it.date }.reverse(true)
    }

    /** Returns all the tickets of a technical. */
    def getAllTechnicalTickets(Technical technical) {
        Ticket.findAllByTechnical(technical).sort { it.date }.reverse(true)
    }

    /** Returns all Pending Tickets of a Technical. */
    def getAllTechnicalPendingTickets(Technical technical) {
        Ticket.findAllByTechnicalAndStatus(technical, PENDING).sort { it.date }.reverse(true)
    }

    def getAllSolvedTickets(Technical technical) {
        Ticket.findAllByTechnicalAndStatus(technical, SOLVED).sort { it.date }.reverse(true)
    }

    def getAllTechnicalCanceledTickets(Technical technical) {
        Ticket.findAllByTechnicalAndStatus(technical, CANCELED).sort { it.date }.reverse(true)
    }

    /** Returns all the install requests tickets of a technical. */
    def getAllInstallRequestTickets(Technical technical) {
        Collection requests = Ticket.findAllByTechnicalAndClass(technical, InstallRequest.class)
        requests += StudyCenter.get(1).commonTickets.findAll { it.class == InstallRequest }
        requests.sort { it.date }.reverse(true)
    }

    /** Returns all the issue notification tickets of a technical. */
    def getAllIssueNotificationTickets(Technical technical) {
        Collection issues = Ticket.findAllByTechnicalAndClass(technical, Issue.class)
        issues += StudyCenter.get(1).commonTickets.findAll { it.class == Issue }
        issues.sort { it.date }.reverse(true)
    }

    /** Returns all the Pending tickets of a technical ordered by date. */
    def getAllPendingTicketsOrderedByDate(Technical technical) {
        Collection issues = Ticket.findAllByTechnicalAndStatus(technical, PENDING)
        issues += StudyCenter.get(1).commonTickets.findAll { it.class == Issue }
        issues.sort { it.date }.reverse(true)
    }
}
