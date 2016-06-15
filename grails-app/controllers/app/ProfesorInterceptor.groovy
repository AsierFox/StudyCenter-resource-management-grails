package app


class ProfesorInterceptor {

    ProfesorInterceptor() {
        match(controller: 'user', action: 'signUp')
        match(controller: 'user', action: 'signUpUser')
    }

    boolean before() {
        if ( !session.user ) {
            false
        } else if ( !session.user.isProfesor() ) {
            false
        }
        true
    }

    boolean after() {
        def user = session.user

        request.isAdmin = user instanceof app.Administrator
        request.isTechnical = user instanceof app.Technical && !request.isAdmin
        request.isUser = user instanceof app.User && !request.isTechnical && !request.isAdmin

        true
    }

    void afterView() { }

}
