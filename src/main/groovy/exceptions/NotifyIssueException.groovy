package src.groovy.exceptions

class NotifyIssueException extends Exception {

    String errorMsg

    public NotifyIssueException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
