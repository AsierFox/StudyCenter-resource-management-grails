package app

import grails.transaction.Transactional

@Transactional
class LoginService {

    def authenticateUser(data) {
        return User.findAllByUsernameAndPassword(data.username, data.password)
    }
}
