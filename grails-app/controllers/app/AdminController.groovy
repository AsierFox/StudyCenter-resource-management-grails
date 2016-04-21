package app

class AdminController {

    static defaultAction = 'index'

    def computerService

    def index() {
        if (session.user.isUser()) {
            request.userComputer = computerService.getUserComputer(session.user)
        }
        render(view: defaultAction)
    }

}
