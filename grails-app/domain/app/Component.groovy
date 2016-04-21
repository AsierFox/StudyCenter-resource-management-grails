package app

class Component {

    String ref
    String name

    static constraints = {
        name(unique: true)
        ref(unique: true)
    }
}
