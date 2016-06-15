package app

import grails.transaction.Transactional

import src.groovy.exceptions.ClassroomNotFoundException
import src.groovy.exceptions.CreateClassroomException
import src.groovy.exceptions.DeleteClassroomException

@Transactional
class ClassroomService {

    /**
     * Returns all the classrooms of the study center.
     */
    def allClassrooms() {
        Classroom.findAll()
    }

    def getClassroomComputerCount(id) {
        Classroom.get(id).computers.size()
    }

    def isClassroomFull(Classroom classroom) {
        return getClassroomComputerCount(classroom.id) >= classroom.maxCapacity
    }

    /** Returns the Classroom with the number passed by parameter. */
    def getClassroomByNumber(number) {
        Classroom classroom = Classroom.findByNumber(number)
        if (!classroom) {
            throw new ClassroomNotFoundException()
        }
        classroom
    }

    /**
     * Get all computers of a specific classroom.
     */
    def getClassroomComputers(classroomNum) throws ClassroomNotFoundException {
        Classroom classroom = Classroom.findByNumber(classroomNum)
        if ( !classroom ) {
            throw new ClassroomNotFoundException()
        }
        return classroom.computers
    }

    def createClassroom(data) throws CreateClassroomException {

        List floorClassrooms = Classroom.findAllByFloor(data.floor)

        floorClassrooms.each {
            if (it.number == Integer.parseInt(data.number)) {
                throw new CreateClassroomException('There is already a classroom with that number in the floor ' + data.floor)
            }
        }

        Classroom classroom = new Classroom(
            number: data.number,
            floor: data.floor,
            maxCapacity: data.maxCapacity,
            description: data.description
        )

        classroom.save(flush: true)

        classroom
    }

    def deleteClassroom(number) {
        Classroom classroom = Classroom.findByNumber(number)

        if (classroom.computers.size() > 0) {
            throw new DeleteClassroomException("The classroom has computers installed")
        }

        classroom.delete()

        true
    }
}
