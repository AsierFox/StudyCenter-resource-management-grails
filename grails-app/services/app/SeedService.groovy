package app

import grails.transaction.Transactional

/**
 * Seed service for filling the database with data.
 */
@Transactional
class SeedService {

    boolean showErrors = true

    Stock stock

    Map computers
    Map departaments
    Map components

    Collection users
    Collection classrooms
    Collection staff

    def seed() {
        components = [:]

        seedSoftwareApps()
        seedHardwareComponents()
        seedSoftwareFileSystems()
        seedSoftwareOperatingSystems()

        saveAllComponents()

        saveToStock()

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

    def saveToStock() {
        StockLine stockLine
        Collection stockLines = []

        components.each { k, v ->
            stockLine = new StockLine(component: v, remaining: 9, total: 10)
            stockLine.save(flush: true, failOnError: showErrors)
            stockLines.add(stockLine)
        }

        stock = new Stock(stockLines: stockLines)

        stock.save(flush: true, failOnError: showErrors)
    }

    def seedSoftwareApps() {
        Requirements requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("JRE",
            new Software(
                name: 'JRE',
                requirements: requirements)
        );

        requirements = new Requirements(
            storage: 15,
            memoryCapacity: 2,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: ['JRE']
        );
        requirements.save()
        components.put("Eclipse",
            new Software(
                name: 'Eclipse',
                requirements: requirements)
        );

        requirements = new Requirements(
            storage: 45,
            memoryCapacity: 8,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("Battlefield 4",
            new Software(
                name: 'Battlefield 4',
                requirements: requirements)
        );

        requirements = new Requirements(
            storage: 4,
            memoryCapacity: 2,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("DirectX",
            new Software(
                name: 'DirectX',
                requirements: requirements)
        );

        requirements = new Requirements(
            storage: 100,
            memoryCapacity: 5,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: ['DirectX']
        );
        requirements.save()
        components.put("Starcraft 2",
            new Software(
                name: 'Starcraft 2',
                requirements: requirements)
        );
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
        Requirements requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("MACLion",
            new OperatingSystem(
                name: 'MAC',
                requirements: requirements,
                distro: 'Lion',
                icon: 'fa fa-apple')
        );

        requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("LinuxUbuntu",
            new OperatingSystem(
                name: 'Linux',
                requirements: requirements,
                distro: 'Ubuntu',
                icon: 'fa fa-linux')
        );

        requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("Windows10",
            new OperatingSystem(
                name: 'Windows',
                requirements: requirements,
                distro: '10',
                icon: 'fa fa-windows')
        );
    }

    def seedSoftwareFileSystems() {
        Requirements requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("NTFS",
            new FileSystem(
                name: 'NTFS',
                requirements: requirements,
                type: 'ntfs')
        );

        requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("FAT",
            new FileSystem(
                name: 'FAT',
                requirements: requirements,
                type: 'fat')
        );

        requirements = new Requirements(
            storage: 5,
            memoryCapacity: 1,
            fileSystemType: 'ntfs',
            operatingSystem: 'MAC',
            software: []
        );
        requirements.save()
        components.put("B-Tree",
            new FileSystem(
                name: 'B-Tree',
                requirements: requirements,
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

        tempComponents.add(components.get('JRE')) // Eclipse

        tempComponents.add(components.get('11233')) // RAM
        tempComponents.add(components.get('11211')) // Hard drive
        tempComponents.add(components.get('11441')) // Graphic Card

        computers.put("172.16.16.200",
            new Computer(
                ipAddress: "172.16.16.200",
                name: "PC 32",
                operatingSystem: components.get('MACLion'),
                fileSystem: components.get('NTFS'),
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
                available: true,
                numberTickets: 0,
                departament: departaments.get('programming'))
        );
        staff.add(
            new Technical(
                dni: "23821333B",
                username: "iban2",
                password: "asier",
                email: "iban2@gmail.com",
                name: "Iban2",
                surname: "Nolose2",
                avatar: "default-avatar.png",
                available: true,
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
