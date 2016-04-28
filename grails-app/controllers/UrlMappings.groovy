class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
            }
        }

        "/"(controller: 'home')
        "/user/sign-up"(controller: 'user', action: 'signUp')

        group("/app") {
            "/classroom/$action?/$id?(.$format)?"(controller: 'classroom')
            "/user/all-users"(controller: 'user', action: 'allUsers')
            "/providers/$action?/$id?(.$format)?"(controller: 'provider')
            "/providers/offers/$id?(.$format)?"(controller: 'provider', action: 'showProviderOffers')
            "/tickets/$action?/$id?(.$format)?"(controller: 'ticket')
        }

        "404"(view: '/error/notFound')
        "405"(view: '/error/notFound')
        "500"(view: '/error/error')

        "/test"(controller: 'test')
    }
}
