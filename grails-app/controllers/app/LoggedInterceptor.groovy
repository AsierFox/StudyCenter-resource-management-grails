package app

class LoggedInterceptor {

    LoggedInterceptor() {
        matchAll()
            .excludes(controller: 'home')
            .excludes(controller: 'user', action: 'login')
            .excludes(controller: 'user', action: 'signUp')
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
        true
    }

    void afterView() { }

}
