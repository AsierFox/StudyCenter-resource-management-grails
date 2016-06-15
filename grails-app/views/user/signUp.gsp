<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Sign up</title>

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
                    <h2 class="page-header">Sign up new user</h2>
                </div>

                <div class="container">
                    <div class="col-sm-6">

                        <div class="form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <i>Fill all the fields please:</i>
                                </div>
                            </div>

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

                                <g:eachError>

                                    <div class="alert alert-danger">
                                        <p><i class="fa fa-exclamation" aria-hidden="true"></i> <g:message error="${ it }" /></p>
                                    </div>

                                </g:eachError>

                            </g:hasErrors>

                            <div class="form-bottom">

                                <g:form onsubmit="return validateForm()" method="POST" url="[action:'signUpUser', controller:'user']" class="registration-form" role="form">

                                    <g:if test="${ errorMsg }">

                                        <div class="alert alert-danger" role="alert">
                                            <span class="fa fa-exclamation" aria-hidden="true"></span>
                                            ${ errorMsg }
                                        </div>

                                    </g:if>

                                    <div class="form-group">
                                        <label for="form-dni">DNI</label>
                                        <input type="text" id="form-dni" name="form-dni" placeholder="DNI" class="form-control" size="10"  maxlength="9" name="nif" pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" style="text-transform:uppercase" required autofocus>
                                    </div>

                                    <div class="form-group">
                                        <label for="form-first-name">First name</label>
                                        <input type="text" name="form-first-name" placeholder="First name" class="form-control" id="form-first-name">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-last-name">Last name</label>
                                        <input type="text" name="form-last-name" placeholder="Last name" class="form-control" id="form-last-name">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-username">Username</label>
                                        <input type="text" name="form-username" placeholder="Username" class="form-control" id="form-username">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-password">Password</label>
                                        <input type="password" name="form-password" placeholder="Password" class="form-control" id="form-password">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-repeat-password">Repeat password</label>
                                        <input type="password" name="form-repeat-password" placeholder="Repeat password" class="form-control" id="form-repeat-password">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-email">Email</label>
                                        <input type="text" name="form-email" placeholder="Email" class="form-control" id="form-email">
                                    </div>

                                    <div class="form-group">
                                        <label for="form-classroom">Classroom</label>
                                        <select id="select-class" name="form-classroom" onchange="showClassroomComputers(this, 'select-classroomComputer')" class="form-control">
                                            <option value="">Choose a classroom</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="form-classroomComputer">Computer</label>
                                        <select id="select-classroomComputer" name="form-computer" class="form-control">
                                            <option value="">Choose a computer</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn btn-primary">Sign me up</button>
                                </g:form>

                                <hr>
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
    <asset:javascript src="metisMenu" />
    <asset:javascript src="sb-admin-2" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="user-sign-up" />
</body>
</html>
