<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>${ title }</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:stylesheet src="sweet-alert" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">${ title }</h1>
                </div>

                <div class="row">

                    <g:set var="count" value="${ 0 }" />

                    <div class="col-lg-4">
                        <div class="panel panel-default">

                            <div class="panel-heading" style="background:#F4511E;font-weight:bold;color:white">
                                Pending Tickets
                            </div>

                            <div class="panel-body">
                                <div class="panel-group" id="accordion">

                                    <g:each in="${ pendingTickets }" var="ticket">

                                    <!-- !/ Content -->

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${ count }">Subject: ${ ticket.subject } &nbsp;<small><b>date:</b> ${ ticket.date }</small></a>
                                                </h4>
                                            </div>
                                            <div id="collapse${ count }" class="panel-collapse collapse">
                                                <div class="panel-body">

                                                    <h5>Status: ${ ticket.status }</h5>

                                                    <h5>Description: ${ ticket.description }</h5>

                                                    <h5>PC: ${ ticket.computer.name }</h5>

                                                    <g:if test="${ isInstallRequest }">

                                                        <h5>Software: ${ ticket.reqSoftware.name }</h5>

                                                    </g:if>
                                                    <g:else>

                                                        <h5>Remarks: ${ ticket.remarks }</h5>

                                                        <h5>Type: ${ ticket.type.topic }</h5>

                                                    </g:else>

                                    <!-- !/ Content -->

                                                    <div class="row">
                                                        <g:form onsubmit="return cancelTicket(${ ticket.id }, '${ ticket.subject }')" action="${ isInstallRequest ? 'cancelInstallRequest' : 'cancelIssue' }">
                                                            <input type="hidden" id="ticketId" value="${ ticket.id }">
                                                            <button type="submit" class="btn btn-default btn-circle btn-lg"><i class="fa fa-times"></i></button>
                                                        </g:form>
                                                        <g:form onsubmit="return solveTicket(${ ticket.id }, '${ ticket.subject }')" action="${ isInstallRequest ? 'solveInstallRequest' : 'solveIssue' }">
                                                            <input type="hidden" id="ticketId" value="${ ticket.id }">
                                                            <button type="submit" class="btn btn-default btn-circle btn-lg"><i class="fa fa-check"></i></button>
                                                        </g:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <g:set var="count" value="${ count + 1 }" />
                                    </g:each>

                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="panel panel-primary">

                            <div class="panel-heading" style="font-weight:bold;color:white">
                                Solved tickets
                            </div>

                            <div class="panel-body">
                                <div class="panel-group" id="accordion">

                                    <g:each in="${ solvedTickets }" var="ticket">

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${ count }">Subject: ${ ticket.subject } &nbsp;<small><b>date:</b> ${ ticket.date }</small></a>
                                                </h4>
                                            </div>
                                            <div id="collapse${ count }" class="panel-collapse collapse">
                                                <div class="panel-body">

                                                    <h5>Status: ${ ticket.status }</h5>

                                                    <h5>Description: ${ ticket.description }</h5>

                                                    <g:if test="${ isInstallRequest }">

                                                        <h5>Software: ${ ticket.reqSoftware.name }</h5>

                                                    </g:if>
                                                    <g:else>

                                                        <h5>Remarks: ${ ticket.remarks }</h5>

                                                        <h5>Type: ${ ticket.type.topic }</h5>

                                                    </g:else>

                                                    <div class="row">
                                                        <g:form onsubmit="return cancelTicket(${ ticket.id }, '${ ticket.subject }')" action="${ isInstallRequest ? 'cancelInstallRequest' : 'cancelIssue' }">
                                                            <input type="hidden" id="ticketId" value="${ ticket.id }">
                                                            <button type="submit" class="btn btn-default btn-circle btn-lg"><i class="fa fa-times"></i></button>
                                                        </g:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <g:set var="count" value="${ count + 1 }" />
                                    </g:each>

                                </div>
                            </div>

                        </div>

                    </div>


                    <div class="col-lg-4">
                        <div class="panel panel-default">

                            <div class="panel-heading" style="background:#d50000;font-weight:bold;color:white">
                                Canceled Tickets
                            </div>

                            <div class="panel-body">
                                <div class="panel-group" id="accordion">

                                    <g:each in="${ canceledTickets }" var="ticket">

                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse${ count }">Subject: ${ ticket.subject } &nbsp;<small><b>date:</b> ${ ticket.date }</small></a>
                                                </h4>
                                            </div>
                                            <div id="collapse${ count }" class="panel-collapse collapse">
                                                <div class="panel-body">

                                                    <h5>Status: ${ ticket.status }</h5>

                                                    <h5>Description: ${ ticket.description }</h5>

                                                    <g:if test="${ isInstallRequest }">

                                                        <h5>Software: ${ ticket.reqSoftware.name }</h5>

                                                    </g:if>
                                                    <g:else>

                                                        <h5>Remarks: ${ ticket.remarks }</h5>

                                                        <h5>Type: ${ ticket.type.topic }</h5>

                                                    </g:else>

                                                    <div class="row">
                                                        <g:form onsubmit="return solveTicket(${ ticket.id }, '${ ticket.subject }')" action="${ isInstallRequest ? 'solveInstallRequest' : 'solveIssue' }">
                                                            <input type="hidden" id="ticketId" value="${ ticket.id }">
                                                            <button type="submit" class="btn btn-default btn-circle btn-lg"><i class="fa fa-check"></i></button>
                                                        </g:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <g:set var="count" value="${ count + 1 }" />
                                    </g:each>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- Script -->
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="solve-cancel-tickets" />
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
</body>
</html>
