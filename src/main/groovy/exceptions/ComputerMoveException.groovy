package src.groovy.exceptions

class ComputerBuildException extends Exception {

    String errorMsg

    public ComputerBuildException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
