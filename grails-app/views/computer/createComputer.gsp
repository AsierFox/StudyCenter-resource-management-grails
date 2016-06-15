<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Create computer</title>

        <asset:stylesheet src="metis-menu" />
        <asset:stylesheet src="sb-admin-2" />
        <asset:stylesheet src="sweet-alert" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">

                <div class="col-lg-12">
                    <h2 class="page-header">Create computer</h2>
                </div>

                <div style="padding:15px">
                    <div class="row">

                        <form onsubmit="return createNewComputer('<g:createLink controller='computer' action='createNewComputer' />')" method="POST" enctype="application/x-www-form-urlencoded">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Computer name</h4>
                                    <div class="form-group">
                                        <input id="computer-name" type="text" class="form-control" autofocus>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <h4>Computer IP address</h4>
                                    <div class="form-group">
                                        <input id="computer-ip-address" pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}" type="text" class="form-control" required>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Classroom</h4>
                                    <div class="form-group">
                                        <select id="select-class" class="form-control">
                                            <option value="">Choose a classroom</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Operating Systems</h4>
                                    <div class="form-group">
                                        <select id="select-os" class="form-control">
                                            <option value="">Choose a OS</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <h4>File Systems</h4>
                                    <div class="form-group">
                                        <select id="select-fs" class="form-control">
                                            <option value="">Choose a FS</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary col-md-12">Create the PC</button>
                        </form>

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
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="create-computer" />
</body>
</html>
