package src.groovy.exceptions

class TicketException extends Exception {

    String errorMsg

    public TicketException() { }

    public TicketException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
