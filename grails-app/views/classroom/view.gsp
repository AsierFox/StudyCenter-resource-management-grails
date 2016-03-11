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

            .computer-card button {
                margin-bottom: 5px;
                width: 100%;
            }

            .modal .modal-dialog {
                background-color: #f3f3f3;
                margin-top: 10%;
            }

            .modal textarea {
                resize: none;
                height: 100px;
                width: 100%;
            }

        </style>

    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <div id="page-wrapper">

            <div class="row">
                <div class="col-lg-12">
                    <ul class="pager">
                        <li class="previous"><a href="<g:createLink controller='classroom' />"><span aria-hidden="true">&larr;</span> Classrooms</a></li>
                    </ul>
                    <h1 class="page-header">Computers of Classroom ${ params.id }</h1>
                </div>

                <div class="row">

                    <g:if test="${ !computers }">
                        <h4 class="error-msg">There are no computers in this class.</h4>
                    </g:if>
                    <g:else>

                        <g:each in="${ computers }" var="computer">

                            <!-- Computer Card -->
                            <div class="col-md-3 computer-card">
                                <div class="thumbnail">
                                    <i class="fa fa-desktop card-icon"></i>
                                    <div class="caption">
                                        <h3 class="text-center">Computer</h3><h4 class="text-center">${ computer.ipAddress }</h4>
                                        <div class="list-group">

                                            <a class="list-group-item">
                                                <b>Operating system</b> <i class="fa fa-${ computer.operatingSystem.icon }"></i>
                                            </a>
                                            <a class="list-group-item"><b>RAM</b> ${ computer.ram } GB</a>
                                            <a class="list-group-item"><b>Storage</b> ${ computer.storage } GB</a>
                                            <a class="list-group-item"><b>File system</b> ${ computer.fileSystem.name }</a>
                                        </div>

                                        <button onclick="installRequest('${ computer.ipAddress }');" class="btn btn-primary" role="button">Install request</button>

                                        <button onclick="notifyIssue('${ computer.ipAddress }');" class="btn btn-warning" role="button">Notify issue</button>
                                    </div>
                                </div>
                            </div>

                        </g:each>

                        <!-- Installation Request Modal -->
                        <div id="installRequestModal" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                    <h4 class="modal-title">Computer {IpAddress}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h1>Component</h1>
                                        </div>
                                        <div class="col-md-6">
                                            <h1>Component</h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>

                        <!-- Notify Issue Modal -->
                        <div id="notifyIssueModal" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                    <h4 class="modal-title">Computer {IpAddress}</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Issue Description:</h4>
                                            <textarea class="form-control"></textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <h4>Remarks:</h4>
                                            <textarea class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>

                    </g:else>

                </div>
            </div>
        </div>
    </div>

    <!-- Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="classroom-view" />
</body>
</html>
