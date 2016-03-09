package app

class ClassroomController {

    static final String classroomViewDir = '/classroom/'

    def classroomService
    def computerService

    static defaultAction = 'index'

    def index() {
        request.classrooms = classroomService.allClassrooms()
        render(view: classroomViewDir + defaultAction)
    }

    def view() {
        if ( !params.id ) {
            redirect(action: defaultAction)
        }

        request.computers = computerService.getComputersClassroom(params.id)

        render(view: classroomViewDir + 'view')
    }

}
