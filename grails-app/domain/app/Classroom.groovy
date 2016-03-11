package app

class Classroom {

    Integer number
    String description

    Collection computers

    static hasMany = [computers: Computer]

    static constraints = {
        number(unique: true)
    }

}
