package app

class Ram extends Hardware {

    int capacity
    String memoryTech

    static constraints = {
        capacity(min: 1)
    }
}
