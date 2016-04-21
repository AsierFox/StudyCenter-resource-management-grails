package app

class Classroom {

    Integer number
    Integer floor
    String description
    Integer maxCapacity

    Collection computers

    static hasMany = [computers: Computer]

    static constraints = {
        number(unique: true)
        computers(nullable: true)
    }

    def remainingSpace() {
        //maxCapacity - computers.length
    }

    def isFull() {
        //computers.length >= maxCapacity
    }

}
