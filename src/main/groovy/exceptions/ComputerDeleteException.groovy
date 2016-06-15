package src.groovy.exceptions

class ComputerDeleteException extends Exception {

    String errorMsg

    public ComputerDeleteException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
