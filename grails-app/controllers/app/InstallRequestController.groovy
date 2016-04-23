package app

import src.groovy.exceptions.InstallRequestException
import src.groovy.exceptions.SoftwareRequerimentException

class InstallRequestController {

    def installRequestService

    static allowedMethods = [sofwareInstallRequest: 'POST']

    def sofwareInstallRequest() {
        boolean success = true
        String errorMsg = ''
        try {
            installRequestService.sendInstallRequest(params)
        } catch(InstallRequestException | SoftwareRequerimentException | Exception err) {
            success = false
            errorMsg = err.getMessage()
        } finally {
            render(contentType: 'text/json') {[
                success: success,
                flashError: errorMsg
            ]}
        }
    }
}
