package app

import grails.transaction.Transactional

@Transactional
class ComputerService {

    def getComputersClassroom(classroomNum) {
        def computers = Computer.where {
            classroom.number == classroomNum
        }
        return computers.list()
    }

}
