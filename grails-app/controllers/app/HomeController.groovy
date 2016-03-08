package app

class HomeController {

    static boolean isSeed = false

    def seedService

    static defaultAction = 'index'

    def index() {
        if ( !isSeed ) {
            seedService.seed()
            isSeed = true
            redirect(action: defaultAction)
        }
    }

    def info() {
        render(view: '/index')
    }

}
