<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

        <asset:stylesheet src="metis-menu" />
        <asset:stylesheet src="sb-admin-2" />
        <asset:stylesheet src="timeline" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Tickets</h1>
                </div>

                <g:if test="${ tickets }">


                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Tickets timeline
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="timeline">

                                <% boolean isLeft = true %>

                                <g:each in="${ tickets }" var="ticket">

                                    <g:set var="isIssue" value="${ ticket instanceof app.Issue }" />

                                    <li class="${ isLeft ?: 'timeline-inverted' }">
                                        <div class="timeline-badge ${ isIssue ? 'warning' : 'primary' }"><i class="fa fa-${ isIssue ? 'bomb' : 'save' }"></i>
                                        </div>
                                        <div class="timeline-panel">
                                            <div class="timeline-heading">
                                                <h4 class="timeline-title">${ ticket.subject }</h4>
                                                <p><small class="text-muted"><i class="fa fa-clock-o"></i> ${ ticket.date }</small>
                                                </p>
                                            </div>
                                            <div class="timeline-body">
                                                <p>${ ticket.description }</p>
                                            </div>
                                        </div>
                                    </li>

                                    <% isLeft = !isLeft %>

                                </g:each>

                            </ul>
                        </div>
                    </div>

                </g:if>
                <g:else>

                    <h1>You do not have any Tickets</h1>

                </g:else>

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
