package app

class Component {

    String name

    static constraints = {
        name(unique: true)
    }
}
