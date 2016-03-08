package app

class StudyCenter {

    String name
    String website

    TicketHistory ticketHistory
    Map classrooms // Key: number

    static hasMany = [classrooms: Classroom]

    static constraints = {
        name(unique: true)
    }
}
