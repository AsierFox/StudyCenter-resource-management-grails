<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>All hardware</title>

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
                    <h2 class="page-header">All Hardware</h2>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Reference</th>
                        </tr>
                    </thead>
                    <tbody>

                        <g:each in="${ allHardware }" var="hardware">

                            <tr>
                                <td>${ hardware.name }</td>
                                <td>${ hardware.ref }</td>
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
