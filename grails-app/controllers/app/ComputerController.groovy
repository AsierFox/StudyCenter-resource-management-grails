package app

import src.groovy.exceptions.ComputerBuildException
import src.groovy.exceptions.ComputerMoveException
import src.groovy.exceptions.ComputerDeleteException

class ComputerController {

    def computerService
    def softwareService

    static allowedMethods = [
        getComputerByIpAddress: 'POST',
        getComputerNameByIpAddress: 'POST',
        getAllSoftware: 'POST',
        getAllSoftwareWithinOSFS: 'POST',
        getComputerComponentsByIpAddress: 'POST',
        getUsersOfComputer: 'POST',
        getComputerSoftwareByIpAddress: 'POST',
        getComputerHardwareByIpAddress: 'POST',
        formatComputer: 'POST'
    ]

    def createComputer() {
        render(view: 'createComputer')
    }

    def formatComputer() {
        computerService.formatComputer(params)
        render(contentType: 'text/json') {[
            success: true
        ]}
    }

    def createNewComputer() {
        boolean success = true
        String error = ''
        try {
            computerService.createNewComputer(params.classroomNumber, params.computerIPAddress, params.computerName, params.osId, params.fsId)
        } catch (ComputerBuildException err) {
            success = false
            error = err.getMessage()
        }
        render(contentType: 'text/json') {[
            success: success,
            error: error
        ]}
    }

    def moveComputer() {
        boolean success = true
        String error = ''
        try {
            computerService.moveComputer(params.ipAddress, params.oldClassroomNumber, params.classroomNumber)
        } catch (ComputerMoveException err) {
            success = false
            error = err.getMessage()
        }
        render(contentType: 'text/json') {[
            success: success,
            error: error
        ]}
    }

    def deleteComputer() {
        boolean success = true
        String error = ''
        try {
            computerService.deleteComputer(params.ipAddress)
        } catch (ComputerDeleteException err) {
            success = false
            error = err.getMessage()
        }
        render(contentType: 'text/json') {[
            success: success,
            error: error
        ]}
    }

    def getComputerUsers() {
        render(contentType: 'text/json') {
            computerService.getComputerUsers(Computer.findByIpAddress(params.ipAddress))
        }
    }

    def getComputerByIpAddress() {
        render(contentType: 'text/json') {
            computerService.getComputerByIpAddress(params.ipAddress)
        }
    }

    def getComputerNameByIpAddress() {
        render(contentType: 'text/json') {
            name = computerService.getComputerName(params.ipAddress)
        }
    }

    def getAllSoftware() {
        render(contentType: 'text/json') {
            softwareService.getAllSoftware()
        }
    }

    def getAllOperatingSystems() {
        render(contentType: 'text/json') {
            softwareService.getAllOperatingSystems()
        }
    }

    def getAllFileSystems() {
        render(contentType: 'text/json') {
            softwareService.getAllFileSystems()
        }
    }

    def getAllSoftwareWithinOSFS() {
        render(contentType: 'text/json') {
            softwareService.getAllSoftwareWithinOSFS()
        }
    }

    def getComputerComponentsByIpAddress() {
        render(contentType: 'text/json') {
            computerService.getAllComputerComponentsByIpAddress(params.ipAddress)
        }
    }

    def getComputerSoftwareByIpAddress() {
        render(contentType: 'text/json') {
            computerService.getAllComputerSoftwareByIpAddress(params.ipAddress)
        }
    }

    def getComputerHardwareByIpAddress() {
        render(contentType: 'text/json') {
            computerService.getAllComputerHardwareByIpAddress(params.ipAddress)
        }
    }
}
