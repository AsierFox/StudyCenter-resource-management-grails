<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Issue Types</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:stylesheet src="sweet-alert" />

        <style>

            .modal .modal-dialog {
                background-color: #f3f3f3;
            }

            a {
                cursor: pointer;
            }

            th, td {
                text-align: center;
            }

            td > a {
                font-size: 25px;
            }

            #modifyIssueTypeModal > .col-md-6 {
                width: 100%;
            }

            .fa-trash {
                color: #EF5350;
            }

        </style>

    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Issue types</h2>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <button onclick="showCreateIssueTypeModal()" class="btn btn-primary"><i class="fa fa-plus" aria-hidden="true"></i> Create issue type</button>

                        <div id="createIssueTypeModal" class="modal fade" tabindex="-1" role="dialog">

                            <div class="modal-dialog">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <h3 class="modal-title left">Create an Issue Type</h3>
                                </div>
                                <div class="modal-body">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Topic</h4>
                                            <input id="form-issue-topic" type="text" class="form-control" placeholder="Issue type topic" />
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button onclick="createIssueType()" type="button" class="btn btn-primary">Create</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <g:if test="${ !issueTypes }">

                    <div class="alert alert-danger">
                        <h2>There are not issue types created.</h2>
                    </div>

                </g:if>
                <g:else>

                    <div class="row">
                        <div class="col-md-6">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Issue type</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <g:each in="${ issueTypes }" var="issueType">

                                        <tr>
                                            <td>${ issueType.topic }</td>
                                            <td><a onclick="showModifyIssueModal('${ issueType.topic }')"><i class="fa fa-pencil-square" aria-hidden="true"></i></a></td>
                                            <td><a><i onclick="removeIssueType(${ issueType.id }, '${ issueType.topic }')" class="fa fa-trash" aria-hidden="true"></i></a></td>
                                        </tr>

                                    </g:each>

                                </tbody>
                            </table>

                            <div id="modifyIssueTypeModal" class="modal fade" tabindex="-1" role="dialog">
                        </div>
                    </div>

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
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="issueTypeCRUD" />
</body>
</html>
