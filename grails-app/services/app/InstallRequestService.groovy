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

    def sendInstallRequest(user, data) throws InstallRequestException, SoftwareRequerimentException {
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

        boolean isTechnical = true
        InstallRequest installResquest
        Technical technical = technicalService.getLessTicket()
        if (!technical) {
            installResquest = new InstallRequest(
                subject: data.get('request[subject]'),
                description: data.get('request[description]'),
                date: new Date(),
                status: PENDING,
                user: user,
                computer: computer,
                reqSoftware: requestedSoftware
            );
            isTechnical = false
        }
        else {
            installResquest = new InstallRequest(
                subject: data.get('request[subject]'),
                description: data.get('request[description]'),
                date: new Date(),
                status: PENDING,
                user: user,
                computer: computer,
                technical: technical,
                reqSoftware: requestedSoftware
            );
        }


        if (!installResquest.save(flush: true)) {
            throw new InstallRequestException('Error sending the Software request')
        }

        if (isTechnical) {
            // Increment the number of Tickets of the chose Technical
            technicalService.incrementNumberTickets(technical)

            System.out.println('Install Request sent to ' + technical.username)
        }
        else {
            // Increment the amount of tickects of all technicals
            technicalService.getAllTechicals().each {
                technicalService.incrementNumberTickets(it)
            }
            // add tichet to study center
            StudyCenter studyCenter = StudyCenter.get(1)
            studyCenter.commonTickets.add(installResquest)
            studyCenter.save(flush: true)

            System.out.println('Install Request sent to all technicals.')
        }
    }

    /** Returns the Install Request by the passed Id */
    def getIntallRequestById(id) {
        InstallRequest.get(id)
    }

}
