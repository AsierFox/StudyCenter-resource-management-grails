package app

import grails.transaction.Transactional

import org.springframework.dao.DataIntegrityViolationException
import src.groovy.exceptions.IssueTypeException

@Transactional
class IssueTypeService {

    def createIssueType(topic) throws IssueTypeException {
        IssueType issueType = new IssueType(topic: topic)

        if (!issueType.save(flush: true)) {
            throw new IssueTypeException('The issue type ' + topic + ' already exists.')
        }
    }

    def modifyIssueType(topic, newTopic) throws IssueTypeException {
        IssueType issueType = IssueType.findByTopic(topic)

        issueType.topic = newTopic

        if (!issueType.save(flush: true)) {
            throw new IssueTypeException('The issue type ' + topic + ' already exists.')
        }
    }

    def deleteIssueType(issueTypeId) throws IssueTypeException {
        try {
            IssueType issueType = IssueType.get(issueTypeId)
            if (Issue.findByType(issueType)) {
                throw new IssueTypeException('There are already issue notifications with the issue type ' + issueType.topic)
            }
            issueType.delete(flush: true)
        } catch (DataIntegrityViolationException err) {
            throw new IssueTypeException('The issue type could not be deleted')
        }
    }
}
