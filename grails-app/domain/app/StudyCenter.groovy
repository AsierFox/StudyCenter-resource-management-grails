package app

class StudyCenter {

    String nif
    String name
    String address
    String website

    Stock stock

    Collection classrooms
    Collection commonTickets

    static hasMany = [
        classrooms: Classroom,
        commonTickets: Ticket
    ]

    static constraints = {
        nif(unique: true)
        name(unique: true)
    }
}
