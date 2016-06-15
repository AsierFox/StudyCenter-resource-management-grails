package app

import grails.transaction.Transactional

import src.groovy.exceptions.SignUpUserException

@Transactional
class SignUpService {

    def computerService

    /** Sign ups an User to the app. */
    def signUpUser(data) throws SignUpUserException {
        String classroomId = data.get('form-classroom')
        String computerIpAddress = data.get('form-computer')

        if (classroomId.isEmpty() || computerIpAddress.isEmpty() || computerIpAddress.equals('whatever')) {
            throw new SignUpUserException('The user must have a computer assigned.')
        }

        Computer computer = Computer.findByIpAddress(computerIpAddress)

        User user = new User(
            dni: data.get('form-dni'),
            username: data.get('form-username'),
            password: data.get('form-password'),
            email: data.get('form-email'),
            name: data.get('form-first-name'),
            surname: data.get('form-last-name'),
            computer: computer
        );

        user.save(flush: true)

        user
    }

}
