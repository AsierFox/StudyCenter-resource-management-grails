package app

import src.groovy.exceptions.SignUpUserException

/**
 * This controller is going to manage the user related actions, like logins,
 * sessions...
 */
class UserController {

    def loginService
    def signUpService
    def searchService

    static defaultAction  = 'login'

    static allowedMethods = [
        authenticate: 'POST',
        logout: 'POST',
        getAllUsers: 'POST',
        search: 'POST',
        signUpUser: 'POST'
    ]

    def index() {
        if ( session.user ) {
            redirect(controller: 'admin')
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
            render(view: 'login')
        }
    }

    /**
     * Authenticates the User with the passed params.
     */
    def auth() {
        def user = loginService.authenticateUser(params)

        if ( user ) {
            session.user = user[0]
            redirect(action: 'index')
        }
        else {
            flash.errorMsg = message(code: 'error.login.access')
            redirect(action: defaultAction)
        }
    }

    /**
     * Renders the view to Sign up the User.
     */
    def signUp() { }

    /**
     * Sign ups the User.
     */
     def signUpUser() {
        boolean success = true
        try {
            signUpService.signUpUser(params)
        }
        catch(SignUpUserException | Exception err) {
            success = false
        }

        if (success) {
            request.successMsg = 'User ' + params.get('form-first-name') + ' registered'
        } else {
            request.errorMsg = 'The user could not be registered'
        }

        render(view: 'signUp')
     }

    /**
     * Shows the user information.
     */
    def profile() {
        request.user = session.user ? session.user : null
        render(view: 'profile')
    }

    /**
     * Displays all users view of the application.
     */
    def allUsers() {
        render(view: 'allUsers')
    }

    /**
     * Returns all users in a JSON.
     */
    def getAllUsers() {
        render(contentType: 'text/json') {
            users = User.findAll()
        }
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
}
