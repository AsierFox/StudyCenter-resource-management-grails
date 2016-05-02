package src.groovy.exceptions

class IssueTypeException extends Exception {

    String errorMsg

    public IssueTypeException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
