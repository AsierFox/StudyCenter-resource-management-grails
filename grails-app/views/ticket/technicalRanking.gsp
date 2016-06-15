<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

        <asset:stylesheet src="metis-menu" />
        <asset:stylesheet src="sb-admin-2" />
        <asset:stylesheet src="timeline" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h2 class="page-header">Technical rankig</h2>
                    <p>The ranking of the top ten technicals with the most solved number of tickets.</p>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Position</th>
                            <th>Technical</th>
                            <th>Number of solved tickets</th>
                            <th>Username</th>
                            <th>Department</th>
                            <th>Available</th>
                        </tr>
                    </thead>
                    <tbody>

                        <% int cont = 1; %>
                        <g:each in="${ technicals }" var="technical">

                            <tr>
                                <td>${ cont++ }</td>
                                <td>${ technical.name } ${ technical.surname }</td>
                                <td>${ technical.solvedTickets }</td>
                                <td>${ technical.username }</td>
                                <td>${ technical.departament.name }</td>
                                <td>${ technical.available ? 'Available' : 'Not Available' }</td>
                            </tr>

                        </g:each>

                    </tbody>
                </table>

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
