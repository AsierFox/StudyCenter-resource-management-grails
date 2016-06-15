package app

/**
 * Admin interceptor for the sections that needs to be
 * logged in with the Administrator rol.
 */
class AdminInterceptor {

    AdminInterceptor() {
        match(controller: 'user', action: 'allUsers')
    }

    boolean before() {
        if ( !session.user ) {
            redirect(controller: 'admin')
            false
        } else if ( !session.user.isAdmin() ) {
            redirect(controller: 'admin')
            false
        }
        true
    }

    boolean after() { true }

    void afterView() { }
}
