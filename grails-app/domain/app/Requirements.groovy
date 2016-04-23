package app

class Requirements {

    float storage
    int memoryCapacity
    String fileSystemType
    String operatingSystem

    List software

    static hasMany = [software: String]

    static constraints = {
        storage(nullable: false)
        memoryCapacity(nullable: false)
        fileSystemType(nullable: false)
        operatingSystem(nullable: false)
    }
}
