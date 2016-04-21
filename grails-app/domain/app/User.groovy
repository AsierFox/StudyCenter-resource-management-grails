package app

//import com.bloomhealthco.jasypt.GormEncryptedStringType

class User {

    String dni
    String username
    String password
    String email
    String name
    String surname
    String avatar

    Computer computer

    static constraints = {
        dni(unique: true, blank: false)
        username(unique: true, blank: false)
        password(password: true, blank: false)
        email(unique: true, email: true, blank: false)
        avatar(defaultValue: 'default-avatar.png')
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

    def isTechnical() {
        "Technical".equals(getClass().getSimpleName())
    }

    def isAdministrator() {
        "Administrator".equals(getClass().getSimpleName())
    }

}
