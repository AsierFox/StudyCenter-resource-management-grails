package app

class Technical extends Profesor {

    boolean available
    int numberTickets
    int solvedTickets

    Departament departament

    static constraints = {
        available(nullable: true)
        numberTickets(nullable: true, defaultValue: 0)
    }
}
