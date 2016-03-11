package app

class Departament {

    String name

    static constraints = {
        name(unique: true)
    }
}
