
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
                    console.log(response.data);
                    $scope.providers = response.data.providers;
                });
        };

        getProviders();

    });
})();
