package app

class Requirement {

    Integer ram
    Float storage
    FileSystem fileSystem
    String operatingSystem

    static constraints = {
        ram(min: 2)
    }

}
