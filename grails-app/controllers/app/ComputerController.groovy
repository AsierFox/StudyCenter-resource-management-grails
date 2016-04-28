package app

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
