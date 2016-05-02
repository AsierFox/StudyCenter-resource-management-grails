<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Stock</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:stylesheet src="sweet-alert" />

        <style>

            .modal .modal-dialog {
                background-color: #f3f3f3;
            }

        </style>

    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Stock</h2>
                    <p>The stock is the place where components are stored.</p>

                    <button onclick="createComputer()" class="btn btn-primary" type="button"><i class="fa fa-plus" aria-hidden="true"></i> Create computer</button>

                    <div id="createComputerModal" class="modal fade" tabindex="-1" role="dialog">

                        <div class="modal-dialog">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <h3 class="modal-title left">Create computer</h3>
                            </div>
                            <div class="modal-body">


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
                                                        <input id="computer-ip-address" type="text" class="form-control">
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

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Components</h2>

                    <g:if test="${ !stockLines }">

                        <h1>There are not components in stock</h1>

                    </g:if>
                    <g:else>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Component</th>
                                    <th>Available</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>

                            <g:each in="${ stockLines }" var="stockLine">

                                <tr>
                                    <td>${ stockLine.component.name }</td>
                                    <td>${ stockLine.remaining - (stockLine.total - stockLine.remaining) }</td>
                                    <td>${ stockLine.remaining }/${ stockLine.total }</td>
                                </tr>

                            </g:each>

                            </tbody>
                        </table>

                    </g:else>

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
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="create-computer" />
</body>
</html>
