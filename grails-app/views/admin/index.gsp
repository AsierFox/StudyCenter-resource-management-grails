<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="defaultMain">

        <title>Dashboard</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:stylesheet src="sweet-alert.css"/>

        <style>

            a {
                cursor: pointer;
            }

            .card-icon {
                font-size: 100px;
                margin-top: 15px;
                text-align: center;
                width: 100%;
            }

            .computer-card a.pull-right, .computer-card a.pull-left {
                margin: 1px 5px;
                font-size: 1.5em;
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

        </style>
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Support Tickets!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- User Computer -->

            <g:if test="${ session.user.isUser() }">

                <div class="row">

                    <h2>Get Classroom name</h2>

                    <!-- Computer Card -->
                    <div class="col-md-3 computer-card">
                        <div class="thumbnail">
                            <a onclick="viewComputer('${ userComputer.ipAddress }')" class="pull-left"><i class="fa fa-eye">EYE</i></a>

                            <i class="fa fa-desktop card-icon"></i>
                            <div class="caption">
                                <h4 class="text-center">Computer</h4><h3 class="text-center">${ userComputer.name }</h3>
                                <div class="list-group">
                                    <a class="list-group-item">
                                        <b>IP Address</b> ${ userComputer.ipAddress }
                                    </a>
                                    <ul class="nav nav-tabs nav-pills nav-justified">
                                        <li class="active">
                                            <a data-toggle="pill" href="#tab-hardware">Hardware</a>
                                        </li>
                                        <li>
                                            <a data-toggle="pill" href="#tab-software">Software</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <!-- Hardware tab -->
                                        <div id="tab-hardware" class="tab-pane fade in active">
                                            <g:each in="${ userComputer.getHardware() }" var="hardware" >
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
                                        <div id="tab-software" class="tab-pane fade">
                                            <!-- Operating System -->
                                            <a class="list-group-item">
                                                <b>Operating system</b> &nbsp;<i class="fa fa-${ userComputer.operatingSystem.icon }"></i>
                                            </a>
                                            <!-- FileSystem -->
                                            <a class="list-group-item">
                                                <b>File system</b> ${ userComputer.fileSystem.type }
                                            </a>
                                            <a class="list-group-item">
                                                <center><b><u>Installed Software</u></b></center>
                                            </a>
                                            <g:each in="${ userComputer.getSoftware() }" var="software" >
                                                <a class="list-group-item">
                                                    ${ software.name }
                                                </a>
                                            </g:each>
                                        </div>
                                    </div>

                                    <button onclick="installRequest('${ userComputer.ipAddress }');" class="btn btn-success" role="button">Install request</button>
                                    <button onclick="notifyIssue('${ userComputer.ipAddress }');" class="btn btn-warning" role="button">Notify issue</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Action modals -->
                    <div id="viewComputerModal" class="modal fade" tabindex="-1" role="dialog"></div>
                    <div id="installRequestModal" class="modal fade" tabindex="-1" role="dialog"></div>
                    <div id="notifyIssueModal" class="modal fade" tabindex="-1" role="dialog"></div>
                    <!-- ! Action modals -->

                    <!-- ! Computer Card -->

                </div>

            </g:if>
            <!-- ! User Computer -->

        </div>
    </div>

    <!-- Script -->
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="jquery-ui.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="computer-request-issue" />
    <asset:javascript src="computer-view-edit" />
    <asset:javascript src="sweet-alert" />
</body>
</html>
