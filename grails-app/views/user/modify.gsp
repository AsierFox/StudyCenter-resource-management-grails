<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain">

        <title>Modify user ${ userModify.username }</title>

        <asset:stylesheet src="metis-menu"/>
        <asset:stylesheet src="sb-admin-2"/>
        <asset:stylesheet src="sweet-alert"/>
    </head>
<body>

    <div id="wrapper">

        <g:applyLayout name="navAdmin" />

        <!-- page-wrapper -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Modify user  ${ userModify.username }</h2>
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
                            <i class="fa fa-exclamation" aria-hidden="true"></i>
                            ${ session.errorMsg }
                            <% session.errorMsg = '' %>
                        </div>

                    </g:if>

                <g:form role="form" method="POST" controller="user" action="modifyUser">
                    <input type="hidden" id="userToModifyId" name="userToModifyId" value="${ userModify.id }">
                    <input type="hidden" id="userToModifyRol" name="userToModifyRol" value="${ userModify.class.getSimpleName() }">

                    <g:if test="${ userModify.isTechnical() }">
                        <input type="hidden" id="userToModifyDepartament" name="userToModifyDepartament" value="${ userModify.departament.name }">
                        <input type="hidden" id="userToModifyAvailable" name="userToModifyAvailable" value="${ userModify.available ? 'Available' : 'Not available' }">
                    </g:if>

                    <div class="form-group">
                        <label for="newDni">DNI</label>
                        <input type="text" id="form-dni" name="newDni" value="${ userModify.dni }" placeholder="DNI" class="form-control" size="10"  maxlength="9" name="nif" pattern="(([X-Z]{1})([-]?)(\d{7})([-]?)([A-Z]{1}))|((\d{8})([-]?)([A-Z]{1}))" style="text-transform:uppercase" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="newFirstName">First name</label>
                        <input value="${ userModify.name }" type="text" name="newFirstName" placeholder="First name" class="form-control" id="form-first-name">
                    </div>

                    <div class="form-group">
                        <label for="newLastName">Last name</label>
                        <input value="${ userModify.surname }" type="text" name="newLastName" placeholder="Last name" class="form-control" id="form-last-name">
                    </div>

                    <div class="form-group">
                        <label for="newUsername">Username</label>
                        <input value="${ userModify.username }" type="text" name="newUsername" placeholder="Username" class="form-control" id="form-username">
                    </div>

                    <div class="form-group">
                        <label for="newEmail">Email</label>
                        <input value="${ userModify.email }" type="text" name="newEmail" placeholder="Email" class="form-control" id="newEmail">
                    </div>

                    <div class="form-group">
                        <label for="newRol">User rol</label>
                        <select name="newRol" id="user-rol" class="form-control">
                            <g:each in="${ roles }" var="rol">
                                <option value="app.${ rol }">${ rol }</option>
                            </g:each>
                        </select>
                    </div>

                    <g:if test="${ userModify.isUser() }">

                        <div class="form-group">
                            <label for="newDepartament">Classroom</label>
                            <select id="select-class" name="form-classroom" onchange="showClassroomComputers(this, 'select-classroomComputer')" class="form-control">
                                <option value="">Choose a classroom</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="newDepartament">Computer</label>
                            <select id="select-classroomComputer" name="form-computer" class="form-control">
                                <option value="">Choose a computer</option>
                            </select>
                        </div>

                    </g:if>

                    <g:if test="${ userModify.isTechnical() }">

                        <div class="form-group">
                            <label for="newDepartament">Departament</label>
                            <select name="newDepartament" id="user-departament" class="form-control">
                                <g:each in="${ departaments }" var="departament">
                                    <option value="${ departament.id }">${ departament.name }</option>
                                </g:each>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="newAvailable">Availability</label>
                            <select name="newAvailable" id="user-available" class="form-control">
                                <option value="1">Available</option>
                                <option value="0">Not available</option>
                            </select>
                        </div>

                    </g:if>

                    <button class="btn btn-primary" type="submit">Modify user</button>
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
    <asset:javascript src="metisMenu.js" />
    <asset:javascript src="sb-admin-2.js" />
    <asset:javascript src="sweet-alert" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="user-modify" />
</body>
</html>
