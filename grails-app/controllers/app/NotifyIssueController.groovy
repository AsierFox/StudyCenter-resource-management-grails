package app

import src.groovy.exceptions.NotifyIssueException

class NotifyIssueController {

    def notifyIssueService

    static allowedMethods = [getAllIssueTypes: 'POST', notifyIssue: 'POST']

    def getAllIssueTypes() {
        def allIssueTypes = notifyIssueService.getAllIssueTypes()
        render(contentType: 'text/json') { allIssueTypes }
    }

    def notifyIssue() {
        boolean success = true
        String errorMsg = ''
        try {
            notifyIssueService.sendIssue(session.user, params)
        } catch(NotifyIssueException | Exception err) {
            success = false
            errorMsg = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                flashError: errorMsg
            ]}
        }
    }

}
