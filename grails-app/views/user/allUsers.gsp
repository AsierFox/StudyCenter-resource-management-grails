<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
         <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>

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
                    <h1 class="page-header">All users</h1>
                </div>

                    <div class="panel-body">
                        <div ng-app="searchUserModule" class="dataTable_wrapper">
                            <div ng-controller="searchController" id="dataTables-example_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_length" id="dataTables-example_length">
                                            <label>Show
                                            <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                                                <option value="10">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                             entries</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div id="dataTables-example_filter" class="dataTables_filter">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="glyphicon glyphicon-search"></i></div>
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
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing 1 to 10 of {{ users.length }} entries</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                            <ul class="pagination">
                                                <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">Previous</a></li>
                                                <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
                                                <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li>
                                                <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li>
                                                <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li>
                                                <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li>
                                                <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li>
                                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">Next</a></li>
                                            </ul>
                                        </div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="all-users-table-search-angular" />
</body>
</html>
