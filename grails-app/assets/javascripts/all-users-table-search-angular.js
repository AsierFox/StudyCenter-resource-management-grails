
var searchUserModule = angular.module('searchUserModule', []);

searchUserModule.controller('searchController', function($scope, $http) {

    //
    // Attributes
    var userPackage    = 'app.';
    var getAllUsersUrl = '/user/getAllUsers';
    var userSearchUrl  = '/user/search/';

    $scope.users = [];
    $scope.username = '';
    // Default sort by dni user attr.
    $scope.sortType = 'dni';
    $scope.sortOrder = false;

    //
    // Methods
    /**
     * Method that adds a user row to the angular scope.
     */
    var addUser = function (user) {
        user.class = user.class.replace(userPackage, '');
        $scope.users.push(user);
    };

    /**
     * Method to make a request of all the users.
     */
    var fillWithAllUsers = function() {
        $http
            .post(getAllUsersUrl)
            .then(function(response) {
                var users = response.data.users;

                for (var i = 0; i < users.length; i++) {
                    addUser(users[i]);
                }
            });
    };

    fillWithAllUsers();

    $scope.searchUserByUsername = function() {
        var flashError = $('#flash-search-error');
        var usersTable = $('#users-table tbody *');
        usersTable.remove();

        if ( !$scope.username || typeof $scope.username === 'undefined' ) {
            flashError.hide();
            fillWithAllUsers();
            return;
        }

        $http
            .post(userSearchUrl + $scope.username)

            .success(function(data, status) {
                if ( !data ) {
                    return;
                }
                var users = data.users;

                if ( !users.length ) {
                    flashError.show();
                    return;
                }

                flashError.hide();

                for (var i = 0; i < users.length; i++) {
                    addUser(users[i]);
                }
            })
            .error(function(data, status) {
                $scope.status = status;
            });
    };

});
