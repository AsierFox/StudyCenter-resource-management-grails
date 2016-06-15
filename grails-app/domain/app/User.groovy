package app

//import com.bloomhealthco.jasypt.GormEncryptedStringType

class User {

    public static final String DEFAULT_AVATAR = 'default-avatar.png'

    String dni
    String username
    String password
    String email
    String name
    String surname

    Computer computer

    static constraints = {
        dni(unique: true, blank: false)
        username(unique: true, blank: false)
        password(password: true, blank: false)
        email(unique: true, email: true, blank: false)
        computer(nullable: true)
    }

    static mapping = {
        //password(type: GormEncryptedStringType)
    }

    def beforeValidate() {
        username = username?.trim()
    }

    def isUser() {
        "User".equals(getClass().getSimpleName())
    }

    def isProfesor() {
        "Profesor".equals(getClass().getSimpleName())
    }

    def isTechnical() {
        "Technical".equals(getClass().getSimpleName())
    }

    def isAdmin() {
        "Administrator".equals(getClass().getSimpleName())
    }

}
