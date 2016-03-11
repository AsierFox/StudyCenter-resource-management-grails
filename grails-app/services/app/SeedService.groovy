package app

import grails.transaction.Transactional

@Transactional
class SeedService {

    Boolean showErrors = true

    Map fileSystems
    Map os
    Map computers
    Map departaments
    Collection users
    Collection classrooms
    Collection staff

    def seed() {
        seedFileSystems()
        seedOperatingSystems()
        seedComputers()
        seedUsers()
        seedDepartaments()
        seedStaffUsers()

        seedClassrooms()
    }

    def seedClassrooms() {
        classrooms = []
        classrooms.add(new Classroom(number: new java.util.Random().nextInt(100), description: "This is a classroom", computers: computers.values()))
        classrooms.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

    def seedDepartaments() {
        departaments = [:]
        departaments.put('networking', new Departament(name: 'Networking'))
        departaments.put('programming', new Departament(name: 'Programming'))
        departaments.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedOperatingSystems() {
        os = [:]
        os.put("mac", new OperatingSystem(name: 'MAC', icon: 'fa fa-apple'))
        os.put("linux", new OperatingSystem(name: 'Linux', icon: 'fa fa-linux'))
        os.put("windows", new OperatingSystem(name: 'Windows', icon: 'fa fa-windows'))
        os.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedFileSystems() {
        fileSystems = [:]
        fileSystems.put("ntfs", new FileSystem(name: 'NTFS'))
        fileSystems.put("fat", new FileSystem(name: 'FAT'))
        fileSystems.put("b-tree", new FileSystem(name: 'B-Tree'))
        fileSystems.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedComputers() {
        computers = [:]
        computers.put("172.16.16.200", new Computer(ipAddress: "172.16.16.200", ram: 6, storage: 400.5, operatingSystem: os.get('windows'), fileSystem: fileSystems.get('b-tree')))
        computers.put("172.16.16.160", new Computer(ipAddress: "172.16.16.160", ram: 4, storage: 480.5, operatingSystem: os.get('linux'), fileSystem: fileSystems.get('fat')))
        computers.put("172.16.16.100", new Computer(ipAddress: "172.16.16.100", ram: 4, storage: 600.5, operatingSystem: os.get('mac'), fileSystem: fileSystems.get('ntfs')))
        computers.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedUsers() {
        users = []
        users.add(new User(dni: "44690254N", username: "asier", password: "asier", email: "asigonlo@gmail.com", name: "Asier", surname: "Gonzalez", avatar: "default-avatar.png", computer: computers.get('172.16.16.200')))
        users.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

    def seedStaffUsers() {
        staff = []
        staff.add(new Technical(dni: "23889067I", username: "iban", password: "asier", email: "iban@gmail.com", name: "Iban", surname: "Nolose", avatar: "default-avatar.png", computer: computers.get('172.16.16.200'), departament: departaments.get('programming')))
        staff.add(new Administrator(dni: "45672398L", username: "mikel", password: "asier", email: "mikel@gmail.com", name: "Mikel", surname: "Linares", avatar: "default-avatar.png", computer: computers.get('172.16.16.200')))
        staff.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

}
