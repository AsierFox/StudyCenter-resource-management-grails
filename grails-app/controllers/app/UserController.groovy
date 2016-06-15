package app

import src.groovy.exceptions.SignUpUserException
import src.groovy.exceptions.ModifyUserException

/**
 * This controller is going to manage the user related actions, like logins,
 * sessions...
 */
class UserController {

    def loginService
    def signUpService
    def modifyUserService
    def searchService

    static defaultAction  = 'login'

    static allowedMethods = [
        authenticate: 'POST',
        logout: 'POST',
        getAllUsers: 'POST',
        search: 'POST',
        signUpUser: 'POST',
        modifyUser: 'POST'
    ]

    def index() {
        if ( session.user ) {
            redirect(controller: 'admin')
        } else {
            redirect(action: 'login')
        }
    }

    /**
     * Logs an User.
     */
    def login() {
        if ( session.user ) {
            redirect(action: 'index')
        } else {
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
     * Modifies the user.
     */
    def modify() {
        Long userId
        boolean error = false
        try {
            userId = Long.parseLong(params.id)
        } catch(Exception err) {
            request.userModify = null
        }
        try {
            request.userModify = User.get(userId)
        } catch(Exception err) {
            Technical.executeUpdate("UPDATE Technical SET available = 1, departament_id = 2, number_tickets = 0, solved_tickets = 0 WHERE id = ?", [userId])
            error = true
        }

        if (request.userModify) {
            request.roles = ['User', 'Profesor', 'Technical', 'Administrator']
            request.departaments = Departament.findAll()
            render(view: 'modify')
        } else {
            if (error) {
                redirect(url: 'http://' + request.getServerName() + ':' + request.getServerPort() + '/user/modify/' + userId)
            } else {
                redirect(action: 'allUsers')
            }
        }
    }

    def modifyUser() {
        User userModify
        boolean success = true
        try {
            userModify = modifyUserService.modifyUser(params)
        } catch(ModifyUserException | Exception err) {
            success = false
            session.errorMsg = err.getMessage()
        }

        if (!userModify) {
            success = false
        } else if (userModify.hasErrors()) {
            session.errorMsg = userModify.errors
            success = false
        }
        else {
            success = true
        }

        if (success) {
            session.flashMsg = 'The user ' + userModify.username + ' has been successfully modified'
        }

        redirect(url: 'http://' + request.getServerName() + ':' + request.getServerPort() + '/user/modify/' + params.userToModifyId)
    }

    /**
     * Sign ups the User.
     */
    def signUpUser() {
        User user
        boolean success = true
        try {
            user = signUpService.signUpUser(params)
        } catch(SignUpUserException | Exception err) {
            success = false
            request.errorMsg = err.getMessage()
        }

        if (success) {
            session.flashMsg = 'User ' + params.get('form-first-name') + ' registered'
        }

        if (!user) {
            render(view: 'signUp')
        } else if (user.hasErrors()) {
            render(view: 'signUp', model: [newUser: user])
        } else {
            render(view: 'signUp')
        }
    }

    def getAvailableTechnicals() {
        request.technicals = Technical.findAllByClassAndAvailable(Technical.class, true)
        render(view: 'viewTechnicals')
    }

    /**
     * Displays all users view of the application.
     */
    def allUsers() {
        render(view: 'usersTable')
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
