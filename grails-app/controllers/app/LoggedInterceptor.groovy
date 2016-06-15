package app

class LoggedInterceptor {

    LoggedInterceptor() {
        matchAll()
            .excludes(controller: 'home')
            .excludes(controller: 'user', action: 'login')
            .excludes(controller: 'classroom', action: 'getAllClassrooms')
            .excludes(controller: 'classroom', action: 'getClassroomComputers')
    }

    boolean before() {
        if ( !session.user ) {
            flash.errorMsg = 'You must login to access to this page.'
            render(view: '/user/login')
            false
        }
        else {
            true
        }
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
