package app

import grails.transaction.Transactional

import src.groovy.exceptions.ComputerBuildException
import src.groovy.exceptions.ClassroomNotFoundException

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

    def getComputerClassroom(Computer computer) {
        Classroom.executeQuery("SELECT class.id FROM Classroom class JOIN class.computers AS c WHERE c = ?", [computer])
    }

    def getUserComputer(user) {
        user.attach()
        user.computer.attach()
        return user.computer
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
    def getAllComputerSoftwareByIpAddress(ipAddress) {
        Computer.findByIpAddress(ipAddress).components
    }
}
