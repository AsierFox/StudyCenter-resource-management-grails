package app

import grails.transaction.Transactional

import src.groovy.exceptions.InstallRequestException
import src.groovy.exceptions.SoftwareRequerimentException

import static app.Ticket.Status.PENDING

@Transactional
class InstallRequestService {

    def computerService
    def technicalService
    def softwareService

    def sendInstallRequest(data) throws InstallRequestException, SoftwareRequerimentException {
        String computerIpAddress = data.get('computer[ipAddress]')

        // Get the computer
        Computer computer = computerService.getComputerByIpAddress(computerIpAddress)
        if (!computer) {
            throw new InstallRequestException('There is no computer with the IP address ' + computerIpAddress)
        }

        // Get the requested software
        Software requestedSoftware = softwareService.getSoftwareById(data.get('request[software]'))

        // Check if there is already the Tickes sent
        InstallRequest repeatedInstallRequest = InstallRequest.findByComputerAndStatusAndReqSoftware(computer, PENDING, requestedSoftware)
        if (repeatedInstallRequest) {
            throw new InstallRequestException('The software ' + requestedSoftware.name + ' is already installed')
        }

        // Check Software requirements for the Software
        softwareService.checkSoftwareRequirementsForComputer(requestedSoftware, computer)

        Technical technical = technicalService.getLessTicket()
        if (!technical) {
            throw new InstallRequestException('Could not find any technical available')
        }

        // Save the Install Request Ticket
        InstallRequest installResquest = new InstallRequest(
            subject: data.get('request[subject]'),
            description: data.get('request[description]'),
            date: new Date(),
            status: PENDING,
            computer: computer,
            technical: technical,
            reqSoftware: requestedSoftware
        );
        if (!installResquest.save(flush: true)) {
            throw new InstallRequestException('Error sending the Software request')
        }

        // Increment the number of Tickets of the chose Technical
        technicalService.incrementNumberTickets(technical)

        System.out.println('Install Request sent to ' + technical.username)
    }

    /** Returns the Install Request by the passed Id */
    def getIntallRequestById(id) {
        InstallRequest.get(id)
    }

}
