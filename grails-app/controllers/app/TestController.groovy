package app

class TestController {

    def index() {
        def temp = Computer.findAll()
        for (Computer comp : temp) {
            comp.attach()
        }
        request.data = temp

        render(view: '/test/test')
    }

}
