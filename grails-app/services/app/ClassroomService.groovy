package app

import grails.transaction.Transactional
import src.groovy.exceptions.ClassroomNotFoundException

@Transactional
class ClassroomService {

    /**
     * Returns all the classrooms of the study center.
     */
    def allClassrooms() {
        Classroom.findAll()
    }

    /** Returns the Classroom with the number passed by parameter. */
    def getClassroomByNumber(number) {
        Classroom.findByNumber(number)
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

}
