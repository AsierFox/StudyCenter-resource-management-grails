package app

class TicketController {

    def ticketService

    static defaultAction = 'index'

    def index() {
        request.tickets = ticketService.getAllTicketsOrderedByDate(session.user)
        render(view: '/ticket/all')
    }

    def installRequest() {
        request.tickets = ticketService.getAllInstallRequestTickets(session.user)
        render(view: '/ticket/installRequest')
    }

    def issueNotification() {
        request.tickets = ticketService.getAllIssueNotificationTickets(session.user)
        render(view: '/ticket/issueNotify')
    }
}
