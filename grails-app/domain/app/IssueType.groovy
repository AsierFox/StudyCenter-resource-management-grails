package app

class IssueType {

    String topic

    static constraints = {
        topic(unique: true)
    }
}
