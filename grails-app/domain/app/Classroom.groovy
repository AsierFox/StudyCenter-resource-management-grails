package app

class Classroom {

    Integer number
    Integer floor
    String description
    Integer maxCapacity

    Collection computers

    static hasMany = [computers: Computer]

    static constraints = {
        number(size: 1..15)
        floor(size: 1..10)
        maxCapacity(size: 1..80)
        computers(nullable: true)
    }

    def getRemainingSpace() {
        return maxCapacity - computers.size()
    }

    def isFull() {
        return computers.size() >= maxCapacity
    }
}
