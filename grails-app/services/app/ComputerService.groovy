package app

import grails.transaction.Transactional

import src.groovy.exceptions.ClassroomNotFoundException

@Transactional
class ComputerService {

    def getComputerClassroom(Computer computer) {
        Classroom.executeQuery("SELECT class.id FROM Classroom class JOIN class.computers AS c WHERE c = ?", [computer])
    }

    def getUserComputer(user) {
        user.attach()
        user.computer.attach()
        return user.computer
    }

    def getComputerByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress)
    }

    def getComputerName(ipAddress) {
        Computer.findByIpAddress(ipAddress).name
    }

    /** Returns all computer software by the computer ip address. */
    def getAllComputerSoftwareByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress).components
    }
}
