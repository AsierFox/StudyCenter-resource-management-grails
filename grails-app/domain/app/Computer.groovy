package app

class Computer {

    String ipAddress
    Integer ram
    Float storage

    FileSystem fileSystem
    OperatingSystem operatingSystem
    Classroom classroom

    Collection users
    static hasMany = [users: User]

    static constraints = {
        ipAddress(unique: true)
    }

}
