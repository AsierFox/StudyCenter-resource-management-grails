package app

class Ticket {

    String subject
    String description
    Date date
    Status status

    User user
    Computer computer
    Technical technical

    static enum Status {
        PENDING,
        SOLVED,
        CANCELED
    }

    static constraints = {
        user(nullable: false)
        computer(nullable: false)
        // Common tickets  does not have technicals associated
        technical(nullable: true)
    }
}
