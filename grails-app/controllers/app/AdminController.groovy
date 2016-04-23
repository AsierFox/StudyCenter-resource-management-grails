package app

class AdminController {

    static defaultAction = 'index'

    def computerService

    def index() {
        if (session.user.isUser()) {
            //System.out.println(computerService.getComputerClassroom(computerService.getUserComputer(session.user)))
            request.userComputer = computerService.getUserComputer(session.user)
        }
        render(view: defaultAction)
    }

}
