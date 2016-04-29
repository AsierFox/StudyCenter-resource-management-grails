package app

import src.groovy.exceptions.ComputerBuildException

class ComputerController {

    def computerService
    def softwareService

    static allowedMethods = [
        getComputerByIpAddress: 'POST',
        getComputerNameByIpAddress: 'POST',
        getAllSoftware: 'POST',
        getAllSoftwareWithinOSFS: 'POST',
        getComputerComponentsByIpAddress: 'POST'
    ]

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
            computerService.getAllComputerSoftwareByIpAddress(params.ipAddress)
        }
    }
}
