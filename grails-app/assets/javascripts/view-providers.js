
(function() {
    'use-strict';

    var app = angular.module('viewProvidersModule', []);

    app.controller('viewController', function($scope, $http) {
        var getAllProvidersUrl = 'getAllProviders';

        $scope.providers = [];

        var getProviders = function() {
            $http
                .post(getAllProvidersUrl)
                .then(function(response) {
                    $scope.providers = response.data;
                });
        };
        getProviders();
    });

})();
