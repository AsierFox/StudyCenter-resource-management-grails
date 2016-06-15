package app


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ProfesorInterceptor)
class ProfesorInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test profesor interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"profesor")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
