package app

import grails.transaction.Transactional
import src.groovy.exceptions.ClassroomNotFoundException

@Transactional
class ClassroomService {

    /**
     * Returns all the classrooms of the study center.
     */
    def allClassrooms() {
        return Classroom.findAll()
    }

    /**
     * Get all computers of a specific classroom.
     */
    def getClassroomComputers(classroomNum) {
        Classroom classroom = Classroom.findByNumber(classroomNum)
        if ( !classroom ) {
            throw new ClassroomNotFoundException()
        }
        return classroom.computers
    }

}
