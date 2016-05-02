package app

import src.groovy.exceptions.IssueTypeException

class IssueTypeController {

    def issueTypeService

    static defaultAction = 'index'

    static allowedMethods = [
        createIssueType: "POST",
        modifyIssueType: "POST",
        deleteIssueType: "POST"
    ]

    def index() {
        request.issueTypes = IssueType.findAll()
        render(view: defaultAction)
    }

    def createIssueType() {
        boolean success = true
        String error = ''
        try {
            issueTypeService.createIssueType(params.topic)
        } catch(IssueTypeException | Exception err) {
            success = false
            error = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                error: error
            ]}
        }
    }

    def modifyIssueType() {
        boolean success = true
        String error = ''
        try {
            issueTypeService.modifyIssueType(params.topic, params.newTopic)
        } catch(IssueTypeException | Exception err) {
            success = false
            error = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                error: error
            ]}
        }
    }

    def deleteIssueType() {
        boolean success = true
        String error = ''
        try {
            issueTypeService.deleteIssueType(params.id)
        } catch(IssueTypeException | Exception err) {
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
