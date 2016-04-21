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
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            ${ classroom.description }
                                        </div>
                                    </div>
                                    <p>
                                        <a href="<g:createLink controller='classroom' action='view' />/${ classroom.number }" class="btn btn-success" role="button">View class</a>
                                    </p>
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
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
</body>
</html>
