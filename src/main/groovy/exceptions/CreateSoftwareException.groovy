package src.groovy.exceptions

class CreateSoftwareException extends Exception {

    String errorMsg

    public CreateSoftwareException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
