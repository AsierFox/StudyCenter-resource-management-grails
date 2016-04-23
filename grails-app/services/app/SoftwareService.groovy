package app

import grails.transaction.Transactional

import src.groovy.exceptions.SoftwareRequerimentException

@Transactional
class SoftwareService {

    def checkSoftwareRequirementsForComputer(Software newSoftware, Computer computer) throws SoftwareRequerimentException {
        Requirements newSoftwareRequeriments = newSoftware.requirements
        Collection computerSoftware = computer.getSoftware()

        // Check if the computer has software
        if (!computerSoftware) {
            throw new SoftwareRequerimentException('The computer does not have any software installed')
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

            // Check Software dependencies
            if (!newSoftwareRequeriments.software.contains(it.name)) {
                throw new SoftwareRequerimentException('The computer require ' + newSoftwareRequeriments.software.join(', ') + ' software installed')
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
