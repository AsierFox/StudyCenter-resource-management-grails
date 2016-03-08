<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Class</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>

        <style>

            .caption a[role="button"] {
                width: 100%;
            }

            .card-icon {
                font-size: 100px;
                margin-top: 15px;
                text-align: center;
                width: 100%;
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
                    <h1 class="page-header">Computers of Classroom ${ computers.first().classroom.number }</h1>
                </div>

                <div class="row">

                    <g:each in="${ computers }" var="computer">

                        <div class="col-md-3">
                            <div class="thumbnail">
                                <i class="fa fa-desktop card-icon"></i>
                                <div class="caption">
                                    <h3 class="text-center">Computer</h3><h4 class="text-center">${ computer.ipAddress }</h4>
                                    <div class="list-group">

                                        <a href="#" class="list-group-item">
                                            Operating system <i class="fa fa-${ computer.operatingSystem.icon }"></i>
                                        </a>
                                        <a href="#" class="list-group-item">RAM ${ computer.ram } GB</a>
                                        <a href="#" class="list-group-item">Storage ${ computer.storage } GB</a>
                                        <a href="#" class="list-group-item">File system ${ computer.fileSystem.name }</a>
                                    </div>
                                    <p><a href="#" class="btn btn-primary" role="button">Install request</a></p>
                                    <p><a href="#" class="btn btn-warning" role="button">Notify issue</a></p>
                                </div>
                            </div>
                        </div>

                    </g:each>

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
</body>
</html>
