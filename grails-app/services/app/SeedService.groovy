package app

import grails.transaction.Transactional

// TODO: Change some save() of false to --> showErrors

@Transactional
class SeedService {

    Boolean showErrors = true

    Map computers
    Map departaments
    Map components

    Collection users
    Collection classrooms
    Collection staff

    def seed() {
        components = [:]

        seedHardwareComponents()

        seedSoftwareApps()
        seedSoftwareFileSystems()
        seedSoftwareOperatingSystems()

        saveAllComponents()

        seedComputers()
        seedClassrooms()
        seedUsers()
        seedDepartaments()
        seedStaffUsers()
        seedIssueTypes()
    }

    def saveAllComponents() {
        components.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedSoftwareApps() {
        //components
    }

    def seedClassrooms() {
        classrooms = []

        classrooms.add(
            new Classroom(
                number: new java.util.Random().nextInt(100),
                floor: 2,
                maxCapacity: 20,
                description: "This is a classroom",
                computers: computers.values())
        );
        classrooms.add(
            new Classroom(
                number: new java.util.Random().nextInt(100),
                floor: 3,
                maxCapacity: 10,
                description: "This another classroom without computers")
        );
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

    def seedSoftwareOperatingSystems() {
        components.put("58931",
            new OperatingSystem(
                ref: '58931',
                name: 'MAC',
                icon: 'fa fa-apple')
        );
        components.put("009844",
            new OperatingSystem(
                ref: '009844',
                name: 'Linux',
                icon: 'fa fa-linux')
        );
        components.put("47392",
            new OperatingSystem(
                ref: '47392',
                name: 'Windows',
                icon: 'fa fa-windows')
        );
    }

    def seedSoftwareFileSystems() {
        components.put("03649",
            new FileSystem(
                ref: '03649',
                name: 'NTFS',
                type: 'ntfs')
        );
        components.put("99783",
            new FileSystem(
                ref: '99783',
                name: 'FAT',
                type: 'fat')
        );
        components.put("14423",
            new FileSystem(
                ref: '14423',
                name: 'B-Tree',
                type: 'b-tree')
        );
    }

    def seedHardwareComponents() {
        components.put("11233",
            new Ram(
                ref: "11233",
                name: "G.Skill Ripjaws",
                capacity: 6,
                memoryTech: "DDR3 1600")
        );
        components.put("11211",
            new HardDrive(
                ref: "11211",
                name: "SATA Turbo",
                storage: 500)
        );
        components.put("11441",
            new GraphicCard(
                ref: "11441",
                name: "GTX TITAN",
                ramSize: 12,
                clockSpeed: 7206,
                resolution: "1080x720")
        );
    }

    def seedComputers() {
        computers = [:]
        Collection tempComponents = []

        tempComponents.add(components.get('58931')) // OS
        tempComponents.add(components.get('03649')) // FS

        tempComponents.add(components.get('11233'))
        tempComponents.add(components.get('11211')) // Hard drive
        tempComponents.add(components.get('11441'))

        computers.put("172.16.16.200",
            new Computer(
                ipAddress: "172.16.16.200",
                name: "PC 32",
                components: tempComponents)
        );
        /*
        computers.put("172.16.16.160",
            new Computer(
                ipAddress: "172.16.16.160",
                name: "PC 12",
                components: tempComponents)
        );
        computers.put("172.16.16.100",
            new Computer(
                ipAddress: "172.16.16.100",
                name: "PC 34",
                ram: 4,
                storage: 600.5,
                operatingSystem: os.get('mac'),
                fileSystem: fileSystems.get('ntfs'))
        );
        */
        computers.each { k, v ->
            v.save(flush: true, failOnError: showErrors)
        }
    }

    def seedUsers() {
        users = []
        users.add(
            new User(
                dni: "44690254N",
                username: "asier",
                password: "asier",
                email: "asigonlo@gmail.com",
                name: "Asier", surname: "Gonzalez",
                avatar: "default-avatar.png",
                computer: computers.get('172.16.16.200'))
        );
        users.add(
            new User(
                dni: "42640224Y",
                username: "sky",
                password: "asier",
                email: "asigonlo@hotmail.com",
                name: "Sky", surname: "Fox",
                avatar: "default-avatar.png",
                computer: computers.get('172.16.16.200'))
        );

        users.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

    def seedStaffUsers() {
        staff = []
        staff.add(
            new Technical(
                dni: "23889067I",
                username: "iban",
                password: "asier",
                email: "iban@gmail.com",
                name: "Iban",
                surname: "Nolose",
                avatar: "default-avatar.png",
                numberTickets: 0,
                departament: departaments.get('programming'))
        );
        staff.add(
            new Administrator(
                dni: "45672398L",
                username: "mikel",
                password: "asier",
                email: "mikel@gmail.com",
                name: "Mikel",
                surname: "Linares", avatar: "default-avatar.png")
        );

        staff.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

    def seedIssueTypes() {
        def issueTypes = []
        issueTypes.add(new IssueType(topic: 'Graphic card'))
        issueTypes.add(new IssueType(topic: 'RAM'))
        issueTypes.add(new IssueType(topic: 'Hardware peripheral'))
        issueTypes.add(new IssueType(topic: 'Hard drive'))
        issueTypes.add(new IssueType(topic: 'Processor'))
        issueTypes.add(new IssueType(topic: 'Software'))
        issueTypes.add(new IssueType(topic: 'Network card'))

        issueTypes.each {
            it.save(flush: true, failOnError: showErrors)
        }
    }

}
