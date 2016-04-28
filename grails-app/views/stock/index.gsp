<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Stock</title>

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
                    <h2 class="page-header">Stock</h2>
                    <p>The stock is the place where components are stored.</p>

                    <button class="btn btn-primary" type="button">Create computer</button>
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
</body>
</html>
