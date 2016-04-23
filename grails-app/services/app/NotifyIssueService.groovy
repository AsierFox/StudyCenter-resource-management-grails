package app

import grails.transaction.Transactional

import src.groovy.exceptions.NotifyIssueException

import static app.Ticket.Status.PENDING

@Transactional
class NotifyIssueService {

    def computerService
    def technicalService

    def sendIssue(data) throws NotifyIssueException {
        // Get the computer
        Computer computer = computerService.getComputerByIpAddress(data.get('computer[ipAddress]'))
        if (!computer) {
            throw new NotifyIssueException("The computer does not exist")
        }

        IssueType issueType = getIssueById(data.get('issue[topic]'))

        // Check if there is already a pending ticket for that type in the computer
        Issue repeatedIssue = Issue.findByComputerAndTypeAndStatus(computer, issueType, PENDING)
        if (repeatedIssue) {
            throw new NotifyIssueException('There is already a issue notification of type ' + repeatedIssue.type.topic  + ' for this computer')
        }

        // Get technical with the less amount of Tickets
        Technical technical = technicalService.getLessTicket()
        if (!technical) {
            throw new NotifyIssueException('Could not find any technical')
        }

        // Create the Issue
        Issue issue = new Issue(
            subject: data.get('issue[subject]'),
            description: data.get('issue[description]'),
            date: new Date(),
            status: PENDING,
            computer: computer,
            technical: technical,
            remarks: data.get('issue[remarks]'),
            type: issueType
        );

        if (!issue.save(flush: true)) {
            throw new NotifyIssueException('The issue notification could not be sent')
        }

        // Increment the number of Tickets of the chose Technical
        technicalService.incrementNumberTickets(technical)
    }

    def getAllIssueTypes() {
        IssueType.findAll()
    }

    def getIssueById(id) {
        IssueType.get(id)
    }

}
