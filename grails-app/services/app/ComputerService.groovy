package app

import grails.transaction.Transactional

import src.groovy.exceptions.ClassroomNotFoundException
import src.groovy.exceptions.ComputerBuildException
import src.groovy.exceptions.ComputerMoveException
import src.groovy.exceptions.ComputerDeleteException

@Transactional
class ComputerService {

    def classroomService

    def createNewComputer(classroomNumber, ipAddress, name, os, fs) throws ComputerBuildException {
        // Check ip address
        if (getComputerByIpAddress(ipAddress)) {
            throw new ComputerBuildException('There is another computer with the IP ' + ipAddress)
        }

        // Check computer name
        if (getComputerByName(name)) {
            throw new ComputerBuildException('There is another computer with the name ' + name)
        }

        // Get the classroom
        Classroom classroom = classroomService.getClassroomByNumber(classroomNumber)

        // Check the space of the classroom
        if (classroomService.isClassroomFull(classroom)) {
            throw new ComputerBuildException('The classroom '+ classroomNumber + ' is full of computers')
        }

        // Create the computer
        Computer newComputer = new Computer(
            ipAddress: ipAddress,
            name: name,
            operatingSystem: OperatingSystem.get(os),
            fileSystem: FileSystem.get(fs)
        );

        if (!newComputer.save(flush: true)) {
            throw new ComputerBuildException('Error creating the computer for the classroom ' + classroomNumber)
        }

        // Add computer to classroom
        classroom.computers.add(newComputer)
        classroom.save(flush: true)
    }

    def moveComputer(ipAddress, oldClassroomNumber, classroomNumber) throws ComputerMoveException {
        Classroom classroom = Classroom.findByNumber(classroomNumber)

        if (classroom.computers.size() >= classroom.maxCapacity) {
            throw new ComputerMoveException("This classroom can not fit more computers.")
        }

        Computer computer = Computer.findByIpAddress(ipAddress)
        classroom.computers.add(computer)

        Classroom oldClassroom = Classroom.findByNumber(oldClassroomNumber)
        int i = -1
        oldClassroom.computers.each {
            i++
            if (it.ipAddress.equals(ipAddress)) {
                return true
            }
        }
        oldClassroom.computers.remove(i)

        oldClassroom.save(flush: true)
        classroom.save(flush: true)
    }

    def deleteComputer(ipAddress) throws ComputerDeleteException {
        Computer computer = Computer.findByIpAddress(ipAddress)

        boolean hasUsers = User.executeQuery("SELECT COUNT(computer_id) FROM User u WHERE computer_id = ?", [computer.id])[0] > 0
        if (hasUsers) {
            throw new ComputerDeleteException("The computer has users associated to it");
        }

        computer.delete()
    }

    def formatComputer(data) {
        Computer computer = Computer.findByName(data.computerName)
        List hardware = computer.getHardware()

        computer.components.clear()
        hardware.each { computer.components.add(it) }

        computer.save(flush: true)
    }

    def getComputerClassroom(Computer computer) {
        Classroom.executeQuery("SELECT class.id FROM Classroom class JOIN class.computers AS c WHERE c = ?", [computer])
    }

    def getUserComputer(user) {
        user.attach()
        user.computer.attach()
        return user.computer
    }

    def getComputerUsers(Computer computer) {
        User.executeQuery("FROM User u WHERE computer_id = ?", [computer.id])
    }

    def getComputerByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress)
    }

    def getComputerName(ipAddress) {
        Computer.findByIpAddress(ipAddress).name
    }

    def getComputerByName(name) {
        Computer.findByName(name)
    }

    /** Returns all computer software by the computer ip address. */
    def getAllComputerComponentsByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress).components
    }

    def getAllComputerSoftwareByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress).getSoftware()
    }

    def getAllComputerHardwareByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress).getHardware()
    }
}
