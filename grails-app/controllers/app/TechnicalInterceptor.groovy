package app

/**
 * Technical interceptor for the sections that needs to be
 * logged in with the Technical rol.
 */
class TechnicalInterceptor {

    TechnicalInterceptor() {
        match(controller: 'issueType')
        match(controller: 'stock')
    }

    boolean before() {
        if ( !session.user ) {
            false
        } else if ( !session.user.isTechnical() ) {
            false
        }
        true
    }

    boolean after() { true }

    void afterView() { }
}
