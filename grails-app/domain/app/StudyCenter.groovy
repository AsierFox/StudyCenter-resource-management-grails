package app

class StudyCenter {

    String nif
    String name
    String address
    String website

    Stock stock

    Collection classrooms
    Collection providers

    static hasMany = [classrooms: Classroom, providers: Provider]

    static constraints = {
        nif(unique: true)
        name(unique: true)
    }

}
