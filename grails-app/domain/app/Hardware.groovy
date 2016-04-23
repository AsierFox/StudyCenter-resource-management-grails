package app

class Hardware extends Component {

    String ref

    static constraints = {
        ref(unique: true)
    }
}
