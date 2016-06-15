<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>All users</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:javascript src="angular.min.js"/>

        <style>

            #users-table thead th {
                cursor: pointer;
            }

        </style>
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">All users</h2>
                </div>

                    <div class="panel-body">
                        <div ng-app="searchUserModule" class="dataTable_wrapper">
                            <div ng-controller="searchController" id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-search"></i></div>
                                                <input ng-model="username" ng-change="searchUserByUsername()" type="search" class="form-control input-sm" placeholder="Username" aria-controls="dataTables-example">
                                            </div>
                                        </div>
                                        <h4 id="flash-search-error" hidden class="error-msg">Not users found.</h4>
                                    </div>
                                </div>
                                <div class="page-header" style="margin-top:5px"></div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="users-table" class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" role="grid">
                                            <thead>
                                                <tr role="row">
                                                    <th class="sorting" ng-click="sortType = 'dni'; sortOrder = !sortOrder">DNI</th>
                                                    <th class="sorting" ng-click="sortType = 'name'; sortOrder = !sortOrder">Name</th>
                                                    <th class="sorting" ng-click="sortType = 'surname'; sortOrder = !sortOrder">Surname</th>
                                                    <th class="sorting" ng-click="sortType = 'username'; sortOrder = !sortOrder">Username</th>
                                                    <th class="sorting" ng-click="sortType = 'email'; sortOrder = !sortOrder">E-mail</th>
                                                    <th class="sorting" ng-click="sortType = 'class'; sortOrder = !sortOrder">User type</th>
                                                    <th>Modify</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="user in users | orderBy:sortType:sortOrder" role="row">
                                                    <td>{{ user.dni }}</td>
                                                    <td>{{ user.name }}</td>
                                                    <td>{{ user.surname }}</td>
                                                    <td>{{ user.username }}</td>
                                                    <td>{{ user.email }}</td>
                                                    <td>{{ user.class }}</td>
                                                    <td><center><a href="<g:createLink controller='user' action='modify' />/{{ user.id }}"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></center></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
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
    <asset:javascript src="all-users-table-search-angular" />
</body>
</html>
