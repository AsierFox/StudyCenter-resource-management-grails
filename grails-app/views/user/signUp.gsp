<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="defaultMain" />

        <title>Sign up</title>

        <asset:stylesheet src="sign-up.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">

        <style>

            .classroom-list {
                width: 200px;
            }

            .list-group-item i {
                float: right;
                margin-top: 5px;
            }

            #showClassesBtn {
                width: 100%;
            }

        </style>
    </head>
<body>

    <div class="row">
        <div class="col-sm-5 col-sm-offset-4">

            <div class="form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h3>Sign up now</h3>
                        <p>Fill all the fields please:</p>
                    </div>
                    <div class="form-top-right">
                        <i class="fa fa-pencil"></i>
                    </div>
                </div>
                <div class="form-bottom">

                    <g:form onsubmit="return validateForm()" method="POST" url="[action:'signUpUser', controller:'user']" class="registration-form" role="form">

                        <g:if test="${ errorMsg }">
                            <div class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <span class="sr-only">Error:</span>
                                ${ errorMsg }
                            </div>
                        </g:if>

                        <div class="form-group">
                            <label class="sr-only" for="form-dni">DNI</label>
                            <input autofocus type="text" name="form-dni" placeholder="DNI" class="form-control" id="form-dni" style="text-transform:uppercase">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-first-name">First name</label>
                            <input type="text" name="form-first-name" placeholder="First name" class="form-control" id="form-first-name">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-last-name">Last name</label>
                            <input type="text" name="form-last-name" placeholder="Last name" class="form-control" id="form-last-name">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-username">Username</label>
                            <input type="text" name="form-username" placeholder="Username" class="form-control" id="form-username">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-password">Password</label>
                            <input type="password" name="form-password" placeholder="Password" class="form-control" id="form-password">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-repeat-password">Repeat password</label>
                            <input type="password" name="form-repeat-password" placeholder="Repeat password" class="form-control" id="form-repeat-password">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-email">Email</label>
                            <input type="text" name="form-email" placeholder="Email" class="form-control" id="form-email">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-avatar">Avatar</label>
                            <input type="file" name="form-avatar" placeholder="Email" class="form-control" id="form-avatar">
                        </div>

                        <div class="form-group">
                            <select id="select-class" name="form-classroom" onchange="showClassroomComputers(this, 'select-classroomComputer')" class="form-control">
                                <option value="">Choose a classroom</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <select id="select-classroomComputer" name="form-computer" class="form-control">
                                <option value="">Choose a computer</option>
                            </select>
                        </div>

                        <button type="submit" class="btn">Sign me up</button>

                    </g:form>

                </div>
            </div>

        </div>
    </div>

    <asset:javascript src="jquery.min.js" />
    <asset:javascript src="bootstrap.min.js" />
    <asset:javascript src="form-data-helper" />
    <asset:javascript src="user-sign-up" />
</body>
</html>
