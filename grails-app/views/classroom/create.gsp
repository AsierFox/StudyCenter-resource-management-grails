<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Admin panel</title>

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
                    <h2 class="page-header">Create a Classroom</h2>
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
                            <i class="fa fa-exclamation"></i>
                            ${ session.errorMsg }
                            <% session.errorMsg = '' %>
                        </div>

                    </g:if>

                <g:if test="${ success }">

                    <div class="row">
                        <div class="alert alert-success" style="overflow-x:hidden">
                            <h4>The classroom was created successfully</h4>
                        </div>
                    </div>

                </g:if>
                <g:else>

                    <g:hasErrors>
                        <div class="row"></div>
                        <g:eachError>
                            <div class="alert alert-danger">
                                <p><i class="fa fa-exclamation" aria-hidden="true"></i> <g:message error="${ it }" /></p>
                            </div>
                        </g:eachError>
                    </g:hasErrors>

                </g:else>

                <g:form role="form" method="POST" controller="classroom" action="createClassroom">

                    <div class="form-group">
                        <label class="sr-only" for="number">Classroom number</label>
                        <input type="number" name="number" placeholder="Classroom number" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="floor">Floor</label>
                        <input type="number" name="floor" placeholder="Floor" class="form-control" min="1" max="10" required>
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="maxCapacity">Max capacity</label>
                        <input type="number" name="maxCapacity" placeholder="Max capacity" class="form-control" min="1" max="50" required>
                    </div>

                    <div class="form-group">
                        <label class="sr-only" for="description">Description</label>
                        <textarea name="description" placeholder="Description" class="form-control" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary">Create the classroom</button>
                </g:form>

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
