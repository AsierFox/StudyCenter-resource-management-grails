package app

class ComputerController {

    def computerService

    static allowedMethods = [getComputerByIpAddress: 'POST', getComputerNameByIpAddress: 'POST']

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

}
