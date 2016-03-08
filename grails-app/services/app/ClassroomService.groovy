package app

import grails.transaction.Transactional

@Transactional
class ClassroomService {

    def allClassrooms() {
        return Classroom.findAll()
    }

}
