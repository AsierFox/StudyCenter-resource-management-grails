<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>

        <style>

            .caption a[role="button"] {
                width: 100%;
            }

            .card-icon {
                font-size: 130px;
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
                    <h1 class="page-header">Classroom</h1>
                </div>

                <div class="row">

                    <g:each in="${ classrooms }" var="classroom">
                        <div class="col-md-3">
                            <div class="thumbnail">
                                <i class="fa fa-book card-icon"></i>
                                <div class="caption">
                                    <h3>Classroom ${ classroom.number }</h3>
                                    <div class="list-group">
                                        <a href="#" class="list-group-item disabled">
                                            Cras justo odio
                                        </a>
                                        <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                                        <a href="#" class="list-group-item">Morbi leo risus</a>
                                        <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                                        <a href="#" class="list-group-item">Vestibulum at eros</a>
                                    </div>
                                    <p><a href="<g:createLink controller='classroom' action='view' />/${ classroom.number }" class="btn btn-success" role="button">View class</a></p>
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
