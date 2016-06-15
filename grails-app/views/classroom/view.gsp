<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Classroom ${ params.id }</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:stylesheet src="sweet-alert" />

        <style>

            a {
                cursor: pointer;
            }

            .card-icon {
                font-size: 80px;
                margin-top: 15px;
                text-align: center;
                width: 100%;
            }

            .actions a {
                margin: 3px auto;
                text-align: center;
                font-size: 1.2em;
                display: block;
            }

            .tab-content {
                margin-top: 8px;
            }

            .computer-card button {
                margin-top: 5px;
                margin-bottom: -2px;
                width: 100%;
            }

            .modal .modal-dialog {
                background-color: #f3f3f3;
            }

            .modal textarea {
                resize: none;
                height: 100px;
                width: 100%;
            }

            ul li {
                list-style: none;
            }

            #modifyComputerSoftwareModal ul, #modifyComputerHardwareModal ul {
                padding: 0px;
                min-height: 80px;
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
                    <h2 class="page-header">Computers of Classroom ${ classroom.number }</h2>
                </div>
                <div class="row">

                    <g:set var="user" value="${ session.user }" />
                    <g:set var="isUser" value="${ session.user.isUser() }" />
                    <g:set var="isTechnical" value="${ session.user.isTechnical() }" />
                    <g:set var="isAdmin" value="${ session.user.isAdmin() }" />

                    <g:if test="${ user.isTechnical() || user.isAdmin() }">

                        <div class="row">
                            <div class="col-md-12">
                                <a style="margin-left:15px;" href="<g:createLink controller='computer' action='createComputer' />"><button class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Create computer</button></a>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>

                    </g:if>

                    <g:if test="${ !computers }">

                        <div class="row"></div>
                        <div class="col-md-12">
                            <div class="alert alert-danger">
                                <h4 class="error-msg"><i class="fa fa-exclamation" aria-hidden="true"></i> There are no computers in this class.</h4>
                            </div>
                        </div>

                    </g:if>
                    <g:else>

                        <g:set var="count" value="${ 0 }" />

                        <g:each in="${ computers }" var="computer">

                            <!-- Computer Card -->
                            <div class="col-md-3 computer-card">
                                <div class="thumbnail">
                                    <g:if test="${ isUser }">
                                        <g:if test="${ session.user.computer.ipAddress.equals(computer.ipAddress) }">

                                            <button onclick="installRequest('${ computer.ipAddress }');" class="btn btn-success" role="button">Install request</button>

                                        </g:if>
                                    </g:if>
                                    <g:else>

                                        <button onclick="installRequest('${ computer.ipAddress }');" class="btn btn-success" role="button">Install request</button>

                                    </g:else>

                                    <g:if test="${ isUser }">
                                        <g:if test="${ isUserClassroom }">

                                            <button onclick="notifyIssue('${ computer.ipAddress }');" class="btn btn-warning" role="button">Notify issue</button>

                                        </g:if>
                                    </g:if>
                                    <g:else>

                                        <button onclick="notifyIssue('${ computer.ipAddress }');" class="btn btn-warning" role="button">Notify issue</button>

                                    </g:else>

                                    <div class="actions">

                                        <a onclick="viewComputer('${ computer.ipAddress }', '${ computer.operatingSystem.name }', '${ computer.fileSystem.name }', '${ isTechnical ? true : false }')"><i class="fa fa-eye"> View</i></a>

                                        <g:if test="${ isTechnical || isAdmin }">

                                            <a onclick="modifyComputerSoftware('${ computer.ipAddress }')"><i class="fa fa-pencil"> Edit Software</i></a>
                                            <a onclick="modifyComputerHardware('${ computer.ipAddress }')"><i class="fa fa-pencil"> Edit Hardware</i></a>
                                            <a onclick="moveComputer('${ computer.ipAddress }', ${ classroom.floor }, ${ classroom.number })"><i class="fa fa-retweet"> Move computer</i></a>
                                            <a onclick="formatComputer('${ computer.name }')"><i class="fa fa-eraser"> Format</i></a>
                                            <a onclick="deleteComputer('${ computer.ipAddress }')"><i class="fa fa-trash"> Delete</i></a>

                                        </g:if>

                                    </div>

                                    <i class="fa fa-desktop card-icon"></i>
                                    <div class="caption">
                                        <h4 class="text-center">Computer</h4><h3 class="text-center">${ computer.name }</h3>
                                        <div class="list-group">
                                            <a class="list-group-item">
                                                <b>IP Address</b> ${ computer.ipAddress }
                                            </a>
                                            <ul class="nav nav-tabs nav-pills nav-justified">
                                                <li class="active">
                                                    <a data-toggle="pill" href="#tab-hardware-${ count }">Hardware</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="pill" href="#tab-software-${ count }">Software</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <!-- Hardware tab -->
                                                <div id="tab-hardware-${ count }" class="tab-pane fade in active">
                                                    <g:each in="${ computer.getHardware() }" var="hardware" >
                                                        <!-- RAM -->
                                                        <g:if test="${ hardware instanceof app.Ram }">
                                                            <a class="list-group-item">
                                                                <b>Ram</b> ${ hardware.name }, ${ hardware.capacity } GB
                                                            </a>
                                                        </g:if>
                                                        <g:elseif test="${ hardware instanceof app.GraphicCard }">
                                                        <!-- Storage -->
                                                            <a class="list-group-item">
                                                                <b>Graphic card</b> ${ hardware.name }, ${ hardware.clockSpeed } MHz
                                                            </a>
                                                        </g:elseif>
                                                        <g:elseif test="${ hardware instanceof app.HardDrive }">
                                                        <!-- GraphicCard -->
                                                            <a class="list-group-item">
                                                                <b>Hard Drive</b> ${ hardware.name }, ${ hardware.storage } GB
                                                            </a>
                                                        </g:elseif>
                                                        <g:else>
                                                            <a class="list-group-item">
                                                                <b>${ hardware }</b> ${ hardware.name }
                                                            </a>
                                                        </g:else>
                                                    </g:each>
                                                </div>

                                                <!-- Software tab -->
                                                <div id="tab-software-${ count }" class="tab-pane fade">
                                                    <!-- Operating System -->
                                                    <a class="list-group-item">
                                                        <b>Operating system</b> &nbsp;<i class="fa fa-${ computer.operatingSystem.icon }"></i>
                                                    </a>
                                                    <!-- FileSystem -->
                                                    <a class="list-group-item">
                                                        <b>File system</b> ${ computer.fileSystem.type }
                                                    </a>
                                                    <a class="list-group-item">
                                                        <center><b><u>Installed Software</u></b></center>
                                                    </a>
                                                    <g:if test="${ !computer.getSoftware() }">
                                                        <a class="list-group-item">
                                                            <center><small>No software installed</small></center>
                                                        </a>
                                                    </g:if>
                                                    <g:each in="${ computer.getSoftware() }" var="software" >
                                                        <a class="list-group-item">
                                                            <center>${ software.name }</center>
                                                        </a>
                                                    </g:each>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- ! Computer Card -->

                            <g:set var="count" value="${ count + 1 }" />

                        </g:each>

                        <!-- Action modals -->
                        <div id="viewComputerModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <div id="modifyComputerSoftwareModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <div id="modifyComputerHardwareModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <div id="moveComputerModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <div id="installRequestModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <div id="notifyIssueModal" class="modal fade" tabindex="-1" role="dialog"></div>
                        <!-- ! Action modals -->

                    </g:else>

                </div>
            </div>
        </div>
    </div>

    <!-- Script -->
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="jquery-ui.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="computer-request-issue" />
    <asset:javascript src="computer-view-edit" />
    <asset:javascript src="move-computer" />
    <asset:javascript src="format-computer" />
    <asset:javascript src="delete-computer" />
</body>
</html>
