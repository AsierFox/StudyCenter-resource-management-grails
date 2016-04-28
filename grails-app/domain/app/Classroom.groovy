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

    def getRemainingSpace() {
        return maxCapacity - computers.size()
    }

    def isFull() {
        return computers.size() >= maxCapacity
    }
}
