
<g:set var="user" value="${ session.user }" />

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <br>
        <a class="navbar-brand" href="<g:createLink controller='admin' />">
            COMPUFOX
        </a>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  ${ user.username } <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li>
                    <g:form style="text-align: center" method="POST" controller="user" action="logout">
                        <button type="submit" class="btn btn-link"><i class="fa fa-sign-out fa-fw"></i> Logout</button>
                    </g:form>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="<g:createLink controller='admin' />"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="<g:createLink controller='classroom' />"><i class="fa fa-table fa-book"></i> Classrooms</a>
                </li>
                <g:if test="${ user.isAdmin() }">
                    <li>
                        <a href="<g:createLink controller='user' action='allUsers' />"><i class="fa fa-edit fa-users"></i> All users</a>
                    </li>
                </g:if>
                <li>
                    <a href="<g:createLink controller='provider' />"><i class="fa fa-table fa-product-hunt"></i> Providers</a>
                </li>
                <g:if test="${ user.isTechnical() }">
                    <li>
                        <a href="#"><i class="fa fa-table fa-fw"></i> Tickets &nbsp; <span class="label label-primary">${ user.numberTickets }</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<g:createLink controller='ticket' />">Pending Timeline</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='ticket' action='installRequest' />">Install Request</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='ticket' action='issueNotification' />">Issue Notifications</a>
                            </li>
                        </ul>
                    </li>
                </g:if>
                <li>
                    <a href="#"><i class="fa fa-wrench fa-fw"></i> Technicals...<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<g:createLink controller='user' action='getAvailableTechnicals' />"><i class="fa fa-table fa-check"></i> Available technicals</a>
                        </li>
                        <li>
                            <a href="<g:createLink controller='ticket' action='technicalRanking' />"><i class="fa fa-table fa-fw"></i> Technical ranking</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-wrench fa-fw"></i> View...<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="<g:createLink controller='software' />"><i class="fa fa-table fa-fw"></i> View software</a>
                        </li>
                        <li>
                            <a href="<g:createLink controller='hardware' />"><i class="fa fa-table fa-fw"></i> View hardware</a>
                        </li>
                        <li>
                            <a href="<g:createLink controller='component' action='viewOperatingSystems' />"><i class="fa fa-table fa-fw"></i> View Operating Systems</a>
                        </li>
                        <li>
                            <a href="<g:createLink controller='component' action='viewFileSystems' />"><i class="fa fa-table fa-fw"></i> View File Systems</a>
                        </li>
                    </ul>
                </li>
                <g:if test="${ user.isTechnical() || user.isAdmin() }">
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-plus-circle"></i> Create...<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<g:createLink controller='user' action='sign-up' />"><i class="fa fa-table fa-plus"></i> Sign up user</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='issueType' />"><i class="fa fa-table fa-plus"></i> Issue Types</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='classroom' action='create' />"><i class="fa fa-table fa-plus"></i> Create classroom</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='computer' action='createComputer' />"><i class="fa fa-table fa-plus"></i> Create computer</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='component' action='createSoftware' />"><i class="fa fa-table fa-plus"></i> Create software</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-hdd-o"></i> Hardware<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<g:createLink controller='hardware' action='createGraphicCard' />"><i class="fa fa-table fa-fw"></i> Create Graphic Card</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='hardware' action='createHardDrive' />"><i class="fa fa-table fa-fw"></i> Create Hard Drive</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='hardware' action='createNetworkCard' />"><i class="fa fa-table fa-fw"></i> Create Network Card</a>
                            </li>
                            <li>
                                <a href="<g:createLink controller='hardware' action='createRam' />"><i class="fa fa-table fa-fw"></i> Create ram</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </g:if>
                <li>
                    <br>
                    <center>
                        <g:img dir="images" file="logo/compufox-logo.png" width="140" />
                    </center>
                    <br>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
