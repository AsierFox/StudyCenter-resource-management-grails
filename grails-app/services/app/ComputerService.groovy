package app

import grails.transaction.Transactional
import src.groovy.exceptions.ClassroomNotFoundException

@Transactional
class ComputerService {

    def getUserComputer(user) {
        // Avoid lazy inizialization
        user.attach()
        user.computer.attach()
        return user.computer
    }

}
