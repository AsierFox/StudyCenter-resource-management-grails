package app

class ComponentController {

    def softwareService

    def index() { }

    def createSoftware() {
        request.allOS = softwareService.getAllOperatingSystems()
        request.allFS = softwareService.getAllFileSystems()
        request.allSoftware = softwareService.getAllSoftwareWithinOSFS()
        render(view: 'createSoftware')
    }

    def viewOperatingSystems() {
        request.allOS = softwareService.getAllOperatingSystems()
        render(view: 'viewOperatingSystems')
    }

    def viewFileSystems() {
        request.allFS = softwareService.getAllFileSystems()
        render(view: 'viewFileSystems')
    }
}
