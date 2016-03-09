package app

import grails.transaction.Transactional

@Transactional
class SearchService {

    def searchUsersByUsername(username) {
        def users = User.findAllByUsernameLike('%' + username + '%')
        return users
    }

}
