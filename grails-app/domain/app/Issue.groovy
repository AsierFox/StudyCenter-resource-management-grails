package app

class Issue extends Ticket {

    Date date
    String description
    State state
    String remarks

    static constraints = {
    }

}
