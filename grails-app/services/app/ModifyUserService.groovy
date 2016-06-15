package app

import grails.transaction.Transactional

import src.groovy.exceptions.ModifyUserException

@Transactional
class ModifyUserService {

    def modifyUser(data) throws ModifyUserException {
        User userToModify = User.get(data.userToModifyId)

        if (userToModify.isUser()) {

            // Role change
            if (!data.newRol.equals('app.User')) {
                userToModify.computer = null
            } else {
                String classroomId = data.get('form-classroom')
                String computerIpAddress = data.get('form-computer')

                if (classroomId.isEmpty() || computerIpAddress.isEmpty() || computerIpAddress.equals('whatever')) {
                    throw new ModifyUserException('The user must have a computer assigned.')
                }

                Computer computer = Computer.findByIpAddress(computerIpAddress)
                userToModify.computer = computer
            }
        }


        if (userToModify.isTechnical()) {
            userToModify.departament = Departament.get(data.newDepartament)
            userToModify.available = data.newAvailable == "1" ? true : false

            if (!data.newRol.equals('app.Technical')) {
                if (Ticket.findByTechnical(userToModify)) {
                    throw new ModifyUserException('This technical has tickets associated')
                }
                if (isLastTechnical(userToModify)) {
                    throw new ModifyUserException('This is the last technical of the application, and can not be deleted')
                }
            }
        }

        if (userToModify.isAdmin() && !data.newRol.equals('app.Administrator')) {
            if (isLastAdmin(userToModify)) {
                throw new ModifyUserException('This is the last administrator of the application, and can not be deleted')
            }
        }

        // Update basic user information
        userToModify.dni = data.newDni
        userToModify.username = data.newUsername
        userToModify.email = data.newEmail
        userToModify.name = data.newFirstName
        userToModify.surname = data.newLastName

        // Cast to another class
        User.executeUpdate("UPDATE User u SET u.class = :newRol WHERE u.username = :username",
            [newRol: data.newRol, username: userToModify.username])

        userToModify.save(flush: true)

        userToModify
    }

    def isLastTechnicalAvailable(User user) {
        User.findAllByClassAndAvailable(Technical.class, true).size() <= 1
    }

    def isLastTechnical(User user) {
        User.findAllByClass(Technical.class).size() <= 1
    }

    def isLastAdmin(User user) {
        User.findAllByClass(Administrator.class).size() <= 1
    }
}
