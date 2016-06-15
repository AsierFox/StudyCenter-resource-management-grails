package src.groovy.exceptions

class ModifyUserException extends Exception {

    String errorMsg

    public ModifyUserException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
