<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>View operating systems</title>

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
                    <h2 class="page-header">View operating systems</h2>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Distribution</th>
                            <th>Icon</th>
                            <th>Storage</th>
                            <th>Memory capacity (RAM)</th>
                            <th>File system type</th>
                            <th>Operating system</th>
                            <th>Required software</th>
                        </tr>
                    </thead>
                    <tbody>

                        <g:each in="${ allOS }" var="os">

                            <tr>
                                <td>${ os.name }</td>
                                <td>${ os.distro }</td>
                                <td><i class="fa fa-${ os.icon }"></i></td>
                                <td>${ os.requirements.storage }</td>
                                <td>${ os.requirements.memoryCapacity }</td>
                                <td>${ os.requirements.fileSystemType }</td>
                                <td>${ os.requirements.operatingSystem }</td>
                                <td>${ os.requirements.software.size() > 0 ? os.requirements.software : "No software required" }</td>
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
