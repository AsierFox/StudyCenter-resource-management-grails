package app

class GraphicCard extends Hardware {

    int ramSize
    int clockSpeed
    String resolution

    static constraints = {
        ramSize(min: 1)
    }
}
