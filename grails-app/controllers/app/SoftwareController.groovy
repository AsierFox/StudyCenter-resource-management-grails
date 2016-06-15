package app

import src.groovy.exceptions.CreateSoftwareException
import src.groovy.exceptions.ComputerBuildException

class SoftwareController {

    def softwareService

    static allowedMethods = [
        updateComputerHardware: 'POST'
    ]

    def index() {
        request.allSoftware = softwareService.getAllSoftwareWithinOSFS()
        render(view: 'allSoftware')
    }

    def createSoftware() {
        Software newSoftware
        try {
            newSoftware = softwareService.createSoftware(params)
        } catch(CreateSoftwareException | Exception err) {
            err.printStackTrace()
            request.errorMsg = err.getMessage()
        }
        if (!newSoftware) {
            request.success = false
            render(view: '/component/createSoftware')
        }
        else {
            if (newSoftware.hasErrors()) {
                request.success = false
                render(view: '/component/createSoftware', model: [software: newSoftware])
            }
            request.success = true
            render(view: '/component/createSoftware')
        }
    }

    def updateComputerSoftware() {
        boolean success = true
        String error = ''
        try {
            softwareService.updateComputerSoftware(params)
        } catch (ComputerBuildException err) {
            success = false
            error = err.getMessage()
        }
        render(contentType: 'text/json') {[
            success: success,
            error: error
        ]}
    }
}
