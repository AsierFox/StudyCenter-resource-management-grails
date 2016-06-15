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
                    <h2 class="page-header">Create Software</h2>
                </div>

                <g:if test="${ success }">

                    <div class="row">
                        <div class="alert alert-success" style="overflow-x:hidden">
                            <h4>The software was created successfully!</h4>
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

                <g:form role="form" method="POST" controller="software" action="createSoftware">

                    <div class="row col-md-12">
                        <h3>Software name</h3>
                        <hr>
                    </div>
                    <div class="form-group col-md-12">
                        <label class="sr-only" for="name">Software name</label>
                        <input type="text" name="name" placeholder="Software name" class="form-control" required>
                    </div>

                    <div class="row col-md-12">
                        <h3>Requirements</h3>
                        <hr>
                    </div>

                    <div class="form-group col-md-3">
                        <label class="sr-only" for="Storage">Storage</label>
                        <input type="number" name="storage" placeholder="Storage" class="form-control" min="1" required>
                    </div>

                    <div class="form-group col-md-3">
                        <label class="sr-only" for="maxCapacity">Ram</label>
                        <input type="number" name="ram" placeholder="Ram" class="form-control" min="1" max="50" required>
                    </div>

                    <div class="form-group col-md-3">
                        <label class="sr-only" for="fileSystem">File System</label>
                        <select name="fileSystem" class="form-control">
                            <option selected disabled>Choose the File System</option>
                            <g:each in="${ allFS }" var="fs">
                                <option value="${ fs.id }">${ fs.name }</option>
                            </g:each>
                        </select>
                    </div>

                    <div class="form-group col-md-3">
                        <label class="sr-only" for="operatingSystem">File System</label>
                        <select name="operatingSystem" class="form-control">
                            <option selected disabled>Choose the File System</option>
                            <g:each in="${ allOS }" var="os">
                                <option value="${ os.id }">${ os.name }</option>
                            </g:each>
                        </select>
                    </div>

                    <div class="row"></div>
                    <h4>Required Software</h4>
                    <div class="form-group">
                        <g:each in="${ allSoftware }" var="software">
                            <label class="btn btn-primary">
                                <g:checkBox checked="0" name="softwareRequired" value="${ software.name }" />
                                ${ software.name }
                            </label>
                        </g:each>
                    </div>

                    <hr>
                    <button type="submit" class="btn btn-primary">Create Software</button>
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
