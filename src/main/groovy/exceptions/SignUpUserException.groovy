package src.groovy.exceptions

class SignUpUserException extends Exception {

    String errorMsg

    public SignUpUserException() { }

    public SignUpUserException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
