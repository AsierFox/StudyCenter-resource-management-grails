package src.groovy.exceptions

class InstallRequestException extends Exception {

    String errorMsg

    public InstallRequestException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
