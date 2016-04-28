package app

class StudyCenter {

    String nif
    String name
    String address
    String website

    Stock stock

    Collection classrooms

    static hasMany = [classrooms: Classroom]

    static constraints = {
        nif(unique: true)
        name(unique: true)
    }

}
