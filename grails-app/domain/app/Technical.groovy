package app

class Technical extends Profesor {

    boolean available
    int numberTickets

    Departament departament

    static constraints = {
        available(nullable: true)
        numberTickets(nullable: true, defaultValue: "9")
    }
}
