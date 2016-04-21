package app

class FileSystem extends Software {

    String type

    static constraints = {
        type(unique: true)
    }

}
