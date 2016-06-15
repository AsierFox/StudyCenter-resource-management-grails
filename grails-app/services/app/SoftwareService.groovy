package app

import grails.transaction.Transactional

import src.groovy.exceptions.SoftwareRequerimentException
import src.groovy.exceptions.CreateSoftwareException
import src.groovy.exceptions.ComputerBuildException

@Transactional
class SoftwareService {

    def checkSoftwareRequirementsForComputer(Software newSoftware, Computer computer) throws SoftwareRequerimentException {
        Requirements newSoftwareRequeriments = newSoftware.requirements
        Collection computerSoftware = computer.getSoftware()

        // Check if the computer has Operating System
        if (!computer.operatingSystem) {
            throw new SoftwareRequerimentException('The computer does not have any Operating System')
        }

        // Check if the computer has File System
        if (!computer.fileSystem) {
            throw new SoftwareRequerimentException('The computer does not have any File System')
        }

        // Check File System
        if (!computer.fileSystem.type.equalsIgnoreCase(newSoftwareRequeriments.fileSystemType)) {
            throw new SoftwareRequerimentException('The computer has another type of File System')
        }

        // Check Operating System
        if (!computer.operatingSystem.name.equalsIgnoreCase(newSoftwareRequeriments.operatingSystem)) {
            throw new SoftwareRequerimentException('The computer has another type of Operating System')
        }

        // Loop through the computer installed software
        computerSoftware.each {
            // Check if already has this software
            if (it.name.equalsIgnoreCase(newSoftware.name)) {
                throw new SoftwareRequerimentException('The computer has already installed this software')
            }

            // Check Software dependencies if it has
            if (!newSoftwareRequeriments.software?.empty) {
                if (!newSoftwareRequeriments.software.contains(it.name)) {
                    throw new SoftwareRequerimentException('The computer require ' + newSoftwareRequeriments.software.join(', ') + ' software installed')
                }
            }
        }

        // RAM capacity
        if (computer.getMemoryCapacity() < newSoftwareRequeriments.memoryCapacity) {
            throw new SoftwareRequerimentException('The computer does not have enough memory capacity (RAM)')
        }

        // Storage
        if (computer.getAvailableStorage() < newSoftwareRequeriments.storage) {
            throw new SoftwareRequerimentException('The computer does not have enough storage')
        }
    }

    def createSoftware(data) throws CreateSoftwareException {
        Software software

        Requirements requirements = new Requirements(
            storage: data.storage,
            memoryCapacity: data.ram,
            fileSystemType: FileSystem.get(data.fileSystem).name,
            operatingSystem: OperatingSystem.get(data.operatingSystem).name,
            software: data.softwareRequired
        );
        requirements.save(flush: true)

        software = new Software(
            name: data.name,
            requirements: requirements
        );
        software.save(flush: true)

        software
    }

    def updateComputerSoftware(data) throws ComputerBuildException {
        Computer computer = Computer.findByName(data.computerName)
        List newSoftwareNames = []
        Collection newSoftware = []

        if (data.get('newSoftware[]') instanceof String) {
            newSoftwareNames.add(data.get('newSoftware[]'))
        } else {
            newSoftwareNames = data.get('newSoftware[]')
        }

        newSoftwareNames.each { newSoftware.add(Software.findByName(it)) }

        newSoftware.each {
            Requirements softwareRequeriments = it.requirements

            // Check if the computer has Operating System
            if (!computer.operatingSystem) {
                throw new ComputerBuildException('The computer does not have any Operating System')
            }

            // Check if the computer has File System
            if (!computer.fileSystem) {
                throw new ComputerBuildException('The computer does not have any File System')
            }

            // Check File System
            if (!computer.fileSystem.type.equalsIgnoreCase(softwareRequeriments.fileSystemType)) {
                throw new ComputerBuildException('The computer has another type of File System')
            }

            // Check Operating System
            if (!computer.operatingSystem.name.equalsIgnoreCase(softwareRequeriments.operatingSystem)) {
                throw new ComputerBuildException('The computer has another type of Operating System')
            }

            // RAM capacity
            if (computer.getMemoryCapacity() < softwareRequeriments.memoryCapacity) {
                throw new ComputerBuildException('The computer does not have enough memory capacity (RAM)')
            }

            // Storage
            if (computer.getAvailableStorage() < softwareRequeriments.storage) {
                throw new ComputerBuildException('The computer does not have enough storage')
            }

            boolean meetRequirements = true
            // Loop through the computer installed software
            newSoftware.each {
                // Check Software dependencies if it has
                if (!softwareRequeriments.software?.empty) {

                    // Check if the software is on the requested new software
                    softwareRequeriments.software.each {
                        if (!(it in newSoftwareNames)) {
                            meetRequirements = false
                        }
                    }
                }
            }
            if (!meetRequirements) {
                throw new ComputerBuildException('The computer require ' + softwareRequeriments.software.join(', ') + ' software installed')
            }
        }

        // Update
        List allHardware = computer.getHardware()
        computer.components.clear()
        allHardware.each { computer.components.add(it) }
        newSoftware.each { computer.components.add(it) }

        computer.save(flush: true)
    }

    def hasComputerSoftware(Computer computer) {
        return computer.getSoftware() != null
    }

    def getSoftwareById(id) {
        Software.get(id)
    }

    /** Returns all the Software available. */
    def getAllSoftware() {
        Software.findAll()
    }

    /** Returns all the Software but the Operating and File Systems. */
    def getAllSoftwareWithinOSFS() {
        Software.findAllByClass(Software.class)
    }

    /** Returns all the Operating and File Systems. */
    def getAllOSAndFS() {
        Software.createCriteria().list {
            or {
                eq 'class', OperatingSystem.class
                eq 'class', FileSystem.class
            }
        }
    }

    /** Returns all the Operating Systems. */
    def getAllOperatingSystems() {
        Software.findAllByClass(OperatingSystem.class)
    }

    /** Returns all the File Systems. */
    def getAllFileSystems() {
        Software.findAllByClass(FileSystem.class)
    }
}
