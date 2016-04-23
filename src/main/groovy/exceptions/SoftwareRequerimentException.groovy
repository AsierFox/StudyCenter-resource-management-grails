package src.groovy.exceptions

class SoftwareRequerimentException extends Exception {

    String errorMsg

    public SoftwareRequerimentException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
