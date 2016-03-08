package app

import grails.transaction.Transactional

@Transactional
class SeedService {

    Boolean showErrors = true

    def seed() {
        Collection users = seedUsers()
        Map os = seedOperatingSystems()
        Map fileSystems = seedFileSystems()
        Classroom classroom = seedClassroom()

        Map computers = seedComputers(classroom, users, os, fileSystems)
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
        fileSystems.each{ k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
        return fileSystems
    }

    def seedClassroom() {
        def classroom = new Classroom(number: 6)
        classroom.save(flush: true, failOnError: showErrors)
        return classroom
    }

    def seedComputers(Classroom classroom, Collection users, Map os, Map fileSystems) {
        Map computers = [:]
        computers.put("172.16.16.200", new Computer(ipAddress: "172.16.16.200", ram: 6, storage: 480.5, classroom: classroom, users: users, operatingSystem: os.get('windows'), fileSystem: fileSystems.get('b-tree')))
        computers.put("172.16.16.160", new Computer(ipAddress: "172.16.16.160", ram: 4, storage: 480.5, classroom: classroom, users: users, operatingSystem: os.get('linux'), fileSystem: fileSystems.get('fat')))
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

}
