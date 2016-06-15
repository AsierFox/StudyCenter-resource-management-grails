package src.groovy.exceptions

class HardwareCreateException extends Exception {

    String errorMsg

    public HardwareCreateException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
