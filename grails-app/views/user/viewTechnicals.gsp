<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Available technicals</title>

        <asset:stylesheet src="metis-menu"/>
        <asset:stylesheet src="sb-admin-2"/>

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
                    <h2 class="page-header">Available technicals</h2>
                </div>
                <div class="row"></div>

                <g:if test="${ !technicals }">

                    <div class="alert alert-danger">
                        <i class="fa fa-exclamation"></i> There are no technicals available
                    </div>

                </g:if>
                <g:else>

                    <table class="table table hover">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Username</th>
                                <th>E-mail</th>
                                <th>Surname</th>
                                <th>Department</th>
                            </tr>
                        </thead>
                        <tbody>

                            <g:each in="${ technicals }" var="technical">

                                <tr>
                                    <td>${ technical.name }</td>
                                    <td>${ technical.username }</td>
                                    <td>${ technical.email }</td>
                                    <td>${ technical.name }</td>
                                    <td>${ technical.departament.name }</td>
                                </tr>

                            </g:each>

                        </tbody>
                    </table>

                </g:else>

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
