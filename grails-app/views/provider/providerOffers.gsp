<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>${ params.id } offers</title>

        <asset:stylesheet src="metis-menu.css"/>
        <asset:stylesheet src="sb-admin-2.css"/>
        <asset:javascript src="view-provider-offers" />
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Provider ${ params.id }</h1>
                </div>

                <g:if test="${ !offers }">

                    <h1>The provider does not have offers</h1>

                </g:if>
                <g:else>

                    <form onsubmit="return generatePDF()">

                        <div class="row container">
                            <button class="btn btn-primary">Request components by PDF</button>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width:80px">Want it?</th>
                                    <th>Name</th>
                                    <th>Brand</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>

                                <g:each in="${ offers }" var="offer">

                                    <tr>
                                        <td>
                                            <div class="checkbox">
                                                <label><input name="offer" type="checkbox" value="${ offer.ref }"></label>
                                            </div>
                                        </td>
                                        <td>${ offer.name }</td>
                                        <td>${ offer.brand }</td>
                                        <td>${ offer.description }</td>
                                        <td>${ offer.price } &euro;</td>
                                    </tr>

                                </g:each>

                            </tbody>
                        </table>

                    </form>

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

    <script>

        var generatePDF = function() {
            var checkboxName = 'offer';
            var selectedOffers = [];
            var allCheckbox = document.getElementsByName(checkboxName);
            var allCheckboxSize = allCheckbox.length;

            for (var i = 0; i < allCheckboxSize; i++) {
                var checkbox = allCheckbox[i];

                if (checkbox.checked) {
                    selectedOffers.push(checkbox.value);
                }
            }

            return false;
        };

    </script>

</body>
</html>
