package app

import src.groovy.exceptions.ClassroomNotFoundException

/**
 * This controller manages the requests for the classrooms of the study center.
 */
class ClassroomController {

    def classroomService

    static defaultAction = 'index'

    static allowedMethods = [getAllClassrooms: 'POST', getClassroomComputers: 'POST']

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
        def classroomNum = params.id

        if ( !classroomNum ) {
            redirect(action: defaultAction)
        }

        try {
            request.classroom = classroomService.getClassroomByNumber(classroomNum)
            request.computers = classroomService.getClassroomComputers(classroomNum)
        }
        catch (ClassroomNotFoundException | Exception classNotFound) {
            redirect(action: defaultAction)
        }

        render(view: 'view')
    }

    def getAllClassrooms() {
        render(contentType: 'text/json') {
            classroomService.allClassrooms()
        }
    }

    def getClassroomComputers() {
        render(contentType: 'text/json') {
            classroomService.getClassroomComputers(params.id)
        }
    }

}
