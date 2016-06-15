package app

import src.groovy.exceptions.ClassroomNotFoundException
import src.groovy.exceptions.CreateClassroomException
import src.groovy.exceptions.DeleteClassroomException

/**
 * This controller manages the requests for the classrooms of the study center.
 */
class ClassroomController {

    def classroomService

    static defaultAction = 'index'

    static allowedMethods = [
        getAllClassrooms: 'POST',
        getClassroomComputers: 'POST',
        createClassroom: 'POST',
        deleteClassroom: 'POST'
    ]

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
        boolean isClassroom = true

        if ( !classroomNum ) {
            isClassroom = false
        } else  {
            try {
                request.classroom = classroomService.getClassroomByNumber(classroomNum)
                request.computers = classroomService.getClassroomComputers(classroomNum)

                if (session.user.isUser()) {
                    request.isUserClassroom = false
                    String userComputerIpAddress = session.user.computer.ipAddress
                    request.classroom.computers.each {
                        if (it.ipAddress.equalsIgnoreCase(userComputerIpAddress)) {
                            request.isUserClassroom = true
                        }
                    }
                }
            } catch (ClassroomNotFoundException | Exception classNotFound) {
                isClassroom = false
            }
        }
        if (isClassroom) {
            render(view: 'view')
        } else {
            redirect(action: defaultAction)
        }
    }

    def create() {
        render(view: 'create')
    }

    /**
     * Method for creating a classroom.
     */
     def createClassroom() {
        Classroom newClassroom
        try {
            newClassroom = classroomService.createClassroom(params)
        } catch(CreateClassroomException | Exception err) {
            session.errorMsg = err.getMessage()
        }

        if (!newClassroom) {
            request.success = false
            redirect(action: 'create')
        } else if (newClassroom.hasErrors()) {
            request.success = false
            render(view: 'create', model: [newClassroom: newClassroom])
        } else {
            request.success = true
            render(view: 'create')
        }
     }

     def deleteClassroom() {
        boolean deleted = false
        try {
            classroomService.deleteClassroom(params.classroomNumber)
        } catch(DeleteClassroomException | Exception err) {
            session.errorMsg = err.getMessage()
        }

        if (deleted) {
            session.flashMsg = 'The classroom has been deleted'
        }

        redirect(view: 'index')
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
