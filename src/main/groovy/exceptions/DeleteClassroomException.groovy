package src.groovy.exceptions

class DeleteClassroomException extends Exception {

    String errorMsg

    public DeleteClassroomException(String error) {
        errorMsg = error
    }

    public String getMessage() {
        return errorMsg
    }
}
