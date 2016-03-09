package app

import grails.transaction.Transactional

@Transactional
class SeedService {

    Boolean showErrors = true

    def seed() {
        Collection staff = seedStaffUsers()
        Collection users = seedUsers()
        Map os = seedOperatingSystems()
        Map fileSystems = seedFileSystems()

        Classroom classroom1 = seedClassroom()
        Classroom classroom2 = seedClassroom()

        Map computers = seedComputers(classroom1, users, os, fileSystems)
    }

    def seedOperatingSystems() {
        Map os = [:]
        os.put("mac", new OperatingSystem(name: 'MAC', icon: 'fa fa-apple'))
        os.put("linux", new OperatingSystem(name: 'Linux', icon: 'fa fa-linux'))
        os.put("windows", new OperatingSystem(name: 'Windows', icon: 'fa fa-windows'))
        os.each{ k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
        return os
    }

    def seedFileSystems() {
        Map fileSystems = [:]
        fileSystems.put("ntfs", new FileSystem(name: 'NTFS'))
        fileSystems.put("fat", new FileSystem(name: 'FAT'))
        fileSystems.put("b-tree", new FileSystem(name: 'B-Tree'))
        fileSystems.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
        return fileSystems
    }

    def seedClassroom() {
        def classroom = new Classroom(number: new java.util.Random().nextInt(100))
        classroom.save(flush: true, failOnError: showErrors)
        return classroom
    }

    def seedComputers(Classroom classroom, Collection users, Map os, Map fileSystems) {
        Map computers = [:]
        computers.put("172.16.16.200", new Computer(ipAddress: "172.16.16.200", ram: 6, storage: 400.5, classroom: classroom, users: users, operatingSystem: os.get('windows'), fileSystem: fileSystems.get('b-tree')))
        computers.put("172.16.16.160", new Computer(ipAddress: "172.16.16.160", ram: 4, storage: 480.5, classroom: classroom, users: users, operatingSystem: os.get('linux'), fileSystem: fileSystems.get('fat')))
        computers.put("172.16.16.1", new Computer(ipAddress: "172.16.16.1", ram: 4, storage: 600.5, classroom: classroom, users: users, operatingSystem: os.get('mac'), fileSystem: fileSystems.get('ntfs')))
        computers.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
        return computers
    }

    def seedUsers() {
        Collection users = []
        users.add(new User(dni: "44690254N", username: "asier", password: "asier", email: "asigonlo@gmail.com", name: "Asier", surname: "Gonzalez", avatar: "default-avatar.png"))
        users.each {
            it.save(flush: true, failOnError: showErrors)
        }
        return users
    }

    def seedStaffUsers() {
        Collection staff = []
        staff.add(new Technical(dni: "23889067I", username: "iban", password: "asier", email: "iban@gmail.com", name: "Iban", surname: "Nolose", avatar: "default-avatar.png"))
        staff.add(new Administrator(dni: "45672398L", username: "mikel", password: "asier", email: "mikel@gmail.com", name: "Mikel", surname: "Linares", avatar: "default-avatar.png"))
        staff.each {
            it.save(flush: true, failOnError: showErrors)
        }
        return staff
    }

}
