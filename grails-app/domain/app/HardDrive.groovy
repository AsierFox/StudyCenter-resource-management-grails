package app

class HardDrive extends Hardware {

    int storage

    static constraints = {
        storage(min: 1)
    }
}
