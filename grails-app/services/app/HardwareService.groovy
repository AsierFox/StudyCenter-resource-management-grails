package app

import grails.transaction.Transactional

import src.groovy.exceptions.HardwareCreateException
import src.groovy.exceptions.SoftwareRequerimentException
import src.groovy.exceptions.ComputerBuildException

@Transactional
class HardwareService {

    def softwareService

    def updateComputerHardware(data) throws ComputerBuildException {
        Computer computer = Computer.findByName(data.computerName)
        List computerSoftware = computer.getSoftware()
        List computerHardware = computer.getHardware()
        List newHardwareNames = []
        Collection newHardware = []
        boolean error = false

        if (data.get('newHardware[]') instanceof String) {
            newHardwareNames.add(data.get('newHardware[]'))
        } else {
            newHardwareNames = data.get('newHardware[]')
        }

        newHardwareNames.each { newHardware.add(Hardware.findByName(it)) }

        // Temporal update with new hardware
        computer.components.clear()
        computerSoftware.each { computer.components.add(it) }
        newHardware.each { computer.components.add(it) }

        // RAM capacity
        computerSoftware.each {
            if (it.requirements.memoryCapacity > computer.getMemoryCapacity()) {
                computer.components.clear()
                computerSoftware.each { computer.components.add(it) }
                computerHardware.each { computer.components.add(it) }
                throw new ComputerBuildException('The computer will not have enough memory capacity (RAM) after the update')
            }
        }

        // Storage
        if (computer.getUsedStorage() > computer.getTotalStorage()) {
            computer.components.clear()
            computerSoftware.each { computer.components.add(it) }
            computerHardware.each { computer.components.add(it) }
            throw new ComputerBuildException('The computer will not have enough storage after the update')
        }

        computer.save(flush: true)
    }

    def graphicCardCreation(data) throws HardwareCreateException {
        GraphicCard graphicCard = new GraphicCard(
            name: data.name,
            ref: data.ref,
            ramSize: data.ramSize,
            clockSpeed: data.clockSpeed,
            resolution: data.resolution
        );

        graphicCard.save(flush: true)

        graphicCard

    }

    def hardDriveCreation(data) throws HardwareCreateException {
        HardDrive hardDrive = new HardDrive(
            name: data.name,
            ref: data.ref,
            storage: data.storage
        );

        hardDrive.save(flush: true)

        hardDrive
    }

    def networkCardCreation(data) throws HardwareCreateException {
        NetworkCard networkCard = new NetworkCard(
            name: data.name,
            ref: data.ref,
            maximumWirelessSpeed: data.maximumWirelessSpeed
        );

        networkCard.save(flush: true)

        networkCard
    }

    def ramCreation(data) throws HardwareCreateException {
        Ram ram = new Ram(
            name: data.name,
            ref: data.ref,
            capacity: data.capacity,
            memoryTech: data.memoryTech
        );

        ram.save(flush: true)

        ram
    }

    def getAllHardware() {
        Hardware.getAll()
    }
}
