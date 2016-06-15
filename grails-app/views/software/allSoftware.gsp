<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>All software</title>

        <asset:stylesheet src="metis-menu" />
        <asset:stylesheet src="sb-admin-2" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h2 class="page-header">All software</h2>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Storage</th>
                            <th>Memory capacity (RAM)</th>
                            <th>File system type</th>
                            <th>Operating system</th>
                            <th>Required software</th>
                        </tr>
                    </thead>
                    <tbody>

                        <g:each in="${ allSoftware }" var="software">

                            <tr>
                                <td>${ software.name }</td>
                                <td>${ software.requirements.storage }</td>
                                <td>${ software.requirements.memoryCapacity }</td>
                                <td>${ software.requirements.fileSystemType }</td>
                                <td>${ software.requirements.operatingSystem }</td>
                                <td>${ software.requirements.software.size() > 0 ? software.requirements.software : "No software required" }</td>
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
