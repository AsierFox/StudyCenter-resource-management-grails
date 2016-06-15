<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Classrooms</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>

        <style>

            .caption a[role="button"] {
                width: 100%;
            }

            .card-icon {
                font-size: 3.2em;
                margin-top: 15px;
                text-align: center;
                width: 100%;
            }

            .panel-body {
                height: 100px;
                overflow-y: scroll;
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
                    <h2 class="page-header">Classrooms</h2>
                </div>

                <g:set var="user" value="${ session.user }" />

                <div class="row">
                    <div class="row"></div>

                    <g:if test="${ session.flashMsg }">

                        <div class="alert alert-success">
                            ${ session.flashMsg }
                            <% session.flashMsg = '' %>
                        </div>

                    </g:if>
                    <g:if test="${ session.errorMsg }">

                        <div class="alert alert-danger">
                            <i class="fa fa-exclamation"></i>
                            ${ session.errorMsg }
                            <% session.errorMsg = '' %>
                        </div>

                    </g:if>

                    <g:if test="${ user.isTechnical() || user.isAdmin() }">

                        <div class="row">
                            <div class="col-md-12">
                                <a style="margin-left:15px;" href="<g:createLink controller='classroom' action='create' />"><button class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Create classroom</button></a>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>

                    </g:if>

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
                                    <p><b>Floor:</b> ${ classroom.floor }</p>
                                    <p><b>Computers:</b> ${ classroom.computers.size() }</p>
                                    <p><b>Capacity:</b> ${ classroom.maxCapacity }</p>

                                    <a href="<g:createLink controller='classroom' action='view' />/${ classroom.number }" class="btn btn-success" role="button">View class</a>

                                    <g:if test="${ user.isTechnical() || user.isAdmin() }">

                                        <form action="<g:createLink controller='classroom' action='deleteClassroom' />" method="POST">
                                            <input type="hidden" name="classroomNumber" value="${ classroom.number }">
                                            <button type="submit" class="btn btn-danger" style="width:100%;margin-top:5px" role="button"><i class="fa fa-trash"></i> Delete class</button>
                                        </form>
                                    </g:if>
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
