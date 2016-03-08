package app

/**
 * This controller is going to manage the user related actions, like logins,
 * sessions...
 */
class UserController {

    final String userViewDir = '/user/'

    def loginService
    def searchService

    static defaultAction  = 'login'
    static allowedMethods = [authenticate: 'POST', logout: 'POST', search: 'POST']

    def index() {
        if ( session.user ) {
            redirect(action: 'profile')
        }
        else {
            redirect(action: 'login')
        }
    }

    /**
     * Logs an User.
     */
    def login() {
        if ( session.user ) {
            redirect(action: 'index')
        }
        else {
            render(view: userViewDir + 'login')
        }
    }

    /**
     * Authenticates the User with the passed params.
     */
    def auth() {
        def user = loginService.authenticateUser(params)

        if ( user ) {
            session.user = user
            redirect(action: 'index')
        }
        else {
            flash.errorMsg = message(code: 'error.login.access')
            redirect(action: defaultAction)
        }
    }

    /**
     * Sign ups the User.
     */
    def signUp() {
        render(view: userViewDir + 'signUp')
    }

    /**
     * Shows the user information.
     */
    def profile() {
        request.user = session.user ? session.user[0] : null
        render(view: userViewDir + 'profile')
    }

    /**
     * Displays all users of the application.
     */
    def allUsers() {
        request.users = User.findAll()
        render(view: userViewDir + 'allUsers')
    }

    /**
     * Users search for ajax feature.
     */
    def search() {
        render(contentType: 'text/json') {
            users = searchService.searchUsersByUsername(params.id)
        }
    }

    /**
     * Logouts the User finalizing the current session.
     */
    def logout() {
        session.user = null
        session.invalidate()
        redirect(action: defaultAction)
    }

    def session() {
        request.data = session
        render(view: '/test/test')
    }

}
