package app

class Technical extends Profesor {

    int numberTickets

    Departament departament

    static constraints = {
        numberTickets(nullable: true)
    }
}
