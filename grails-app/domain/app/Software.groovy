package app

class Software extends Component {

    Collection requirements

    static hasMany = [requirements: Component]

    static constraints = {
        requirements(nullable: true)
    }
}
