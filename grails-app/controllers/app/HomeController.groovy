package app

import src.groovy.faker.Faker

class HomeController {

    static boolean isSeed = false

    def seedService
    def mailService

    static defaultAction = 'index'

    def index() {

        if ( !isSeed ) {
            seedService.seed()
            isSeed = true
            redirect(action: defaultAction)
        }

    }
}
