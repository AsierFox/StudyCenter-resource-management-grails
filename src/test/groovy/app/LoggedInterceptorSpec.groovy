package app


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoggedInterceptor)
class LoggedInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test logged interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"logged")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
