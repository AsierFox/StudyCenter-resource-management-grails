<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">Install Requests</h1>
                </div>

                <g:if test="${ tickets }">

                    <g:set var="count" value="${ 0 }" />

                    <g:each in="${ tickets }" var="ticket">

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <!-- .panel-heading -->
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">

                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse${ count }">Subject: ${ ticket.subject }</a>
                                                    </h4>
                                                </div>
                                                <div id="collapse${ count }" class="panel-collapse collapse">
                                                    <div class="panel-body">

                                                        <h5>Description: ${ ticket.description }</h5>
                                                        <h5>Software: ${ ticket.reqSoftware.name }</h5>

                                                        <div class="row">
                                                            <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-times"></i></button>
                                                            <button type="button" class="btn btn-default btn-circle btn-lg"><i class="fa fa-check"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- .panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>

                        <g:set var="count" value="${ count + 1 }" />

                    </g:each>

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
