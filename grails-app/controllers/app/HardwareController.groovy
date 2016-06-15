package app

import src.groovy.exceptions.HardwareCreateException
import src.groovy.exceptions.ComputerBuildException

class HardwareController {

    def hardwareService

    static allowedMethods = [
        graphicCardCreation: 'POST',
        hardDriveCreation: 'POST',
        networkCardCreation: 'POST',
        ramCreation: 'POST',
        getAllHardware: 'POST',
        updateComputerHardware: 'POST'
    ]

    def index() {
        request.allHardware = hardwareService.getAllHardware()
        render(view: 'allHardware')
    }

    def createGraphicCard() {}
    def createHardDrive() {}
    def createNetworkCard() {}
    def createRam() {}

    def graphicCardCreation() {
        GraphicCard graphicCard
        try {
            graphicCard = hardwareService.graphicCardCreation(params)
        } catch(HardwareCreateException err) {
            session.errorMsg = err.getMessage()
        }

        if (graphicCard) {
            if (!graphicCard.hasErrors()) {
                session.flashMsg = 'The graphic card ' + params.name + ' was created successfully.'
            }
            render(view: 'createGraphicCard', model: [graphicCard: graphicCard])
        } else {
            render(view: 'createGraphicCard')
        }
    }

    def hardDriveCreation() {
        HardDrive hardDrive
        try {
            hardDrive = hardwareService.hardDriveCreation(params)
        } catch(HardwareCreateException err) {
            session.errorMsg = err.getMessage()
        }

        if (hardDrive) {
            if (!hardDrive.hasErrors()) {
                session.flashMsg = 'The hard drive ' + params.name + ' was created successfully.'
            }
            render(view: 'createHardDrive', model: [hardDrive: hardDrive])
        } else {
            render(view: 'createHardDrive')
        }
    }

    def networkCardCreation() {
        NetworkCard networkCard
        try {
            networkCard = hardwareService.networkCardCreation(params)
        } catch(HardwareCreateException err) {
            session.errorMsg = err.getMessage()
        }

        if (networkCard) {
            if (!networkCard.hasErrors()) {
                session.flashMsg = 'The network card ' + params.name + ' was created successfully.'
            }
            render(view: 'createNetworkCard', model: [networkCard: networkCard])
        } else {
            render(view: 'createNetworkCard')
        }
    }

    def ramCreation() {
        Ram ram
        try {
            ram = hardwareService.ramCreation(params)
        } catch(HardwareCreateException err) {
            session.errorMsg = err.getMessage()
        }

        if (ram) {
            if (!ram.hasErrors()) {
                session.flashMsg = 'The RAM ' + params.name + ' was created successfully.'
            }
            render(view: 'createRam', model: [ram: ram])
        } else {
            render(view: 'createRam')
        }
    }

    def updateComputerHardware() {
        boolean success = true
        String error = ''
        try {
            hardwareService.updateComputerHardware(params)
        } catch (ComputerBuildException err) {
            success = false
            error = err.getMessage()
        }
        render(contentType: 'text/json') {[
            success: success,
            error: error
        ]}
    }

    def getAllHardware() {
        render(contentType: 'text/json') {
            hardwareService.getAllHardware()
        }
    }
}
