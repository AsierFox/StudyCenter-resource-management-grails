package app

class Ticket {

    String subject
    String description
    Date date
    Status status

    Computer computer
    Technical technical

    static enum Status {
        PENDING,
        SOLVED,
        CANCELED
    }

    static constraints = {
    }
}
