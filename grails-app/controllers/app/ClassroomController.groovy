package app

import src.groovy.exceptions.ClassroomNotFoundException

/**
 * This controller manages the requests for the classrooms of the study center.
 */
class ClassroomController {

    def classroomService

    static defaultAction = 'index'

    /**
     * Shows all the classrooms of the study center.
     */
    def index() {
        request.classrooms = classroomService.allClassrooms()
        render(view: defaultAction)
    }

    /**
     * Shows all the computers of a existing classroom.
     */
    def view() {
        if ( !params.id ) {
            redirect(action: defaultAction)
        }

        try {
            request.computers = classroomService.getClassroomComputers(params.id)
        }
        catch (ClassroomNotFoundException classNotFound) {
            redirect(action: defaultAction)
        }

        render(view: 'view')
    }

}
