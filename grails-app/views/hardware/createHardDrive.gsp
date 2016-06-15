<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Create Hard Drive</title>

        <asset:stylesheet src="metis-menu" />
        <asset:stylesheet src="sb-admin-2" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Create Hard Drive</h2>
                </div>
                <div class="row"></div>

                <g:if test="${ session.flashMsg }">

                    <div class="alert alert-success">
                        ${ session.flashMsg }
                        <% session.flashMsg = '' %>
                    </div>

                </g:if>
                <g:if test="${ session.errorMsg }">

                    <div class="alert alert-danger">
                        ${ session.errorMsg }
                        <% session.errorMsg = '' %>
                    </div>

                </g:if>

                <g:hasErrors>
                    <div class="row"></div>
                    <g:eachError>
                        <div class="alert alert-danger">
                            <p><i class="fa fa-exclamation" aria-hidden="true"></i> <g:message error="${ it }" /></p>
                        </div>
                    </g:eachError>
                </g:hasErrors>

                <g:form role="form" method="POST" controller="hardware" action="hardDriveCreation">

                    <div class="form-group">
                        <label for="name">Hardware name</label>
                        <input id="name" name="name" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="ref">Reference number</label>
                        <input id="ref" name="ref" type="text" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="storage">Storage</label>
                        <input id="storage" name="storage" type="number" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-primary col-md-12">Create Hard Drive</button>
                </g:form>
                <hr>

            </div>

        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->

    <!-- Script -->
    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="metisMenu" />
    <asset:javascript src="sb-admin-2" />
</body>
</html>
