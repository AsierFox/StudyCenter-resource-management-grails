package app

import grails.transaction.Transactional

import src.groovy.exceptions.ClassroomNotFoundException

@Transactional
class ComputerService {

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

}
