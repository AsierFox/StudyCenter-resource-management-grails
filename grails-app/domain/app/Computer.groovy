package app

class Computer {

    String ipAddress
    Integer ram
    Float storage

    FileSystem fileSystem
    OperatingSystem operatingSystem

    Collection components

    static hasMany = [components: Component]

    static constraints = {
        ipAddress(unique: true)
    }

}
