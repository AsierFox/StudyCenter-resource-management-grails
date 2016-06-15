package src.groovy.exceptions

class ComputerMoveException extends Exception {

    String errorMsg

    public ComputerMoveException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
