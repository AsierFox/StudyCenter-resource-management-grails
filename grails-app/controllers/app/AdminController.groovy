package app

class AdminController {

    static defaultAction = 'index'

    def computerService

    def index() {
        request.userComputer = computerService.getUserComputer(session.user[0])
        render(view: defaultAction)
    }

}
