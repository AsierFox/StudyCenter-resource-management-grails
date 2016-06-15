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
            .profile-usertitle {
              text-align: center;
              margin-top: 20px;
            }

            .profile-usertitle-name {
              color: #5a7391;
              font-size: 16px;
              font-weight: 600;
              margin-bottom: 7px;
            }

            .profile-usertitle-job {
              text-transform: uppercase;
              color: #5b9bd1;
              font-size: 12px;
              font-weight: 600;
              margin-bottom: 15px;
            }

            .profile-userbuttons {
              text-align: center;
              margin-top: 10px;
            }

            .profile-userbuttons .btn {
              text-transform: uppercase;
              font-size: 11px;
              font-weight: 600;
              padding: 6px 15px;
              margin-right: 5px;
            }

            .profile-userbuttons .btn:last-child {
              margin-right: 0px;
            }

            .profile-usermenu {
              margin-top: 30px;
            }

            .profile-usermenu ul li {
              border-bottom: 1px solid #f0f4f7;
            }

            .profile-usermenu ul li:last-child {
              border-bottom: none;
            }

            .profile-usermenu ul li a {
              color: #93a3b5;
              font-size: 14px;
              font-weight: 400;
            }

            .profile-usermenu ul li a i {
              margin-right: 8px;
              font-size: 14px;
            }

            .profile-usermenu ul li a:hover {
              background-color: #fafcfd;
              color: #5b9bd1;
            }

            .profile-usermenu ul li.active {
              border-bottom: none;
            }

            .profile-usermenu ul li.active a {
              color: #5b9bd1;
              background-color: #f6f9fb;
              border-left: 2px solid #5b9bd1;
              margin-left: -2px;
            }

        </style>
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Profile</h2>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                ${ user.name }
                            </div>
                            <div class="profile-usertitle-job">
                                ${ user.class.getSimpleName() }
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="profile-content col-md-5">

                        <h3>Account information</h3>
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>DNI:</th>
                                    <td>${ user.dni }</td>
                                </tr>
                                <tr>
                                    <th>E-mail:</th>
                                    <td>${ user.email }</td>
                                </tr>
                                <tr>
                                    <th>Name:</th>
                                    <td>${ user.name }</td>
                                </tr>
                                <tr>
                                    <th>Surname</th>
                                    <td>${ user.surname }</td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>

            <!-- User Computer -->
            <g:if test="${ session.user.isUser() }">

                <div class="row">

                    <h3>Associated computer</h3>

                    <!-- Computer Card -->
                    <div class="col-md-3 computer-card">
                        <div class="thumbnail">
                            <button onclick="installRequest('${ userComputer.ipAddress }');" class="btn btn-success" role="button">Install request</button>
                            <button onclick="notifyIssue('${ userComputer.ipAddress }');" class="btn btn-warning" role="button">Notify issue</button>

                            <a onclick="viewComputer('${ userComputer.ipAddress }')" class="pull-left"><i class="fa fa-eye"></i> View computer</a>

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
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="computer-request-issue" />
    <asset:javascript src="computer-view-edit" />
</body>
</html>
