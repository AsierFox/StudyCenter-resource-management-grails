package app

import src.groovy.exceptions.TicketException

class TicketController {

    def ticketService
    def technicalService
    def mailService

    static defaultAction = 'index'

    static allowedMethods = [
        solveInstallRequest: 'POST',
        solveIssue: 'POST',
        cancelInstallRequest: 'POST',
        cancelIssue: 'POST'
    ]

    def index() {
        request.tickets = ticketService.getAllPendingTicketsOrderedByDate(session.user)
        render(view: 'pendingTimeline')
    }

    def technicalRanking() {
        request.technicals = technicalService.getTechnicalRanking()
        render(view: 'technicalRanking')
    }

    def installRequest() {
        Map allTickets = ticketService.getAllInstallRequestsByStatus(session.user)
        request.title = 'Install requests'
        request.isInstallRequest = true
        request.solvedTickets = allTickets.solvedTickets
        request.pendingTickets = allTickets.pendingTickets
        request.canceledTickets = allTickets.canceledTickets
        request.notTickets = !allTickets.solvedTickets && !allTickets.pendingTickets && !allTickets.canceledTickets
        render(view: 'tickets')
    }

    def issueNotification() {
        Map allTickets = ticketService.getAllIssueNotificationsByStatus(session.user)
        request.title = 'Issue notifications'
        request.isIssue = true
        request.solvedTickets = allTickets.solvedTickets
        request.pendingTickets = allTickets.pendingTickets
        request.canceledTickets = allTickets.canceledTickets
        request.notTickets = !allTickets.solvedTickets && !allTickets.pendingTickets && !allTickets.canceledTickets
        render(view: 'tickets')
    }

    def solveTicket() {
        boolean success = true
        String error = ''
        try {
            ticketService.solveTicket(params.ticketId)

            Technical technical = Technical.get(session.user.id)
            technical.solvedTickets++
            technical.save(flush: true)

            mailService.sendMail(technical, Ticket.get(params.ticketId), 'solved')
        } catch(TicketException | Exception err) {
            success = false
            error = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                error: error
            ]}
        }
    }

    def cancelTicket() {
        boolean success = true
        String error = ''
        try {
            ticketService.cancelTicket(params.ticketId)

            Technical technical
            if (params.solveToCancel) {
                technical = Technical.get(session.user.id)
                technical.solvedTickets--
                technical.save(flush: true)
            }

            mailService.sendMail(technical, Ticket.get(params.ticketId), 'canceled')
        } catch(TicketException | Exception err) {
            success = false
            error = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                error: error
            ]}
        }
    }
}
