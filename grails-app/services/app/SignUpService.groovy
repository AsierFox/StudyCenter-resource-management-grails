package app

import grails.transaction.Transactional

import src.groovy.exceptions.SignUpUserException

@Transactional
class SignUpService {

    def computerService

    /** Sign ups an User to the app. */
    def signUpUser(data) throws SignUpUserException {
        Computer computer = computerService.getComputerByIpAddress(data.get('form-computer'))

        String avatar = data.get('form-avatar')
        if (!avatar) {
            avatar = User.DEFAULT_AVATAR
        }

        User user = new User(
            dni: data.get('form-dni'),
            username: data.get('form-username'),
            password: data.get('form-password'),
            email: data.get('form-email'),
            name: data.get('form-first-name'),
            surname: data.get('form-last-name'),
            avatar: avatar,
            computer: computer
        );

        if (!user.validate()) {
            user.errors.allErrors.each {
                System.out.println(it)
            }
            throw new SignUpUserException()
        }

        if (!user.save(flush: true)) {
            throw new SignUpUserException()
        }
    }

}
