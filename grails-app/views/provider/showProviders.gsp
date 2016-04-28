<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Providers</title>

        <asset:stylesheet src="metis-menu.css" />
        <asset:stylesheet src="sb-admin-2.css" />
        <asset:javascript src="angular.min.js" />
        <asset:javascript src="view-providers" />

        <style>

            .panel-footer button {
                width: 100%;
            }

            .panel-footer button > a {
                color: white;
            }

        </style>

    </head>
<body>

    <div id="wrapper" ng-app="viewProvidersModule">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Providers</h1>
                </div>
            </div>

            <div id="view-providers" ng-controller="viewController">

                    <div class="col-md-4" ng-repeat="provider in providers">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                {{ provider.title }}
                            </div>
                            <div class="panel-body">
                                <div class="container">
                                    <div class="row">
                                        <p>{{ provider.description }}</p>
                                        <br>
                                        <p><b>Number of products: {{ provider.offers.length }}</b></p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <a href="<g:createLink controller='provider' action='showProviderOffers' />/{{ provider.name }}"><button class="btn btn-primary">View {{ provider.name }}</button></a>
                            </div>
                        </div>
                    </div>

            </div>

        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- Script -->
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
</body>
</html>
