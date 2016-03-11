package app

class Requirement {

    Integer ram
    Float storage
    String operatingSystem

    FileSystem fileSystem

    static constraints = {
        ram(min: 2)
    }

}
