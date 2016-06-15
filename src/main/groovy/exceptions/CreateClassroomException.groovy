package src.groovy.exceptions

class CreateClassroomException extends Exception {

    String errorMsg

    public CreateClassroomException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
