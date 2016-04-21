package app

class Processor extends Hardware {

    String modelFamily
    float speed
    int coreNumber
    String socketModel

    static constraints = {
        coreNumber(min: 1)
    }
}
