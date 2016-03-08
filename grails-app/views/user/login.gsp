<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain"/>

        <title>Login</title>

        <asset:stylesheet src="login.css" />

    </head>
<body>

    <div class="container">

        <div class="row">

            <div class="col-md-4 col-md-offset-4 login-container">

                <g:img class="img-responsive" dir="images" file="wales/uw-logo.png" />

                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>

                    <div class="panel-body">

                        <g:if test="${ flash.errorMsg }">
                            <div class="alert alert-danger" role="alert">
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <span class="sr-only">Error:</span>
                                ${ flash.errorMsg }
                            </div>
                        </g:if>

                        <g:form role="form" method="POST" controller="user" action="auth">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <button type="submit" class="btn btn-lg btn-primary btn-block">Login</button>
                                <a href="<g:createLink controller='user' action='sign-up' />" class="btn btn-lg btn-success btn-block">Sign-up</a>
                            </fieldset>
                        </g:form>

                    </div>

                </div>

            </div>

        </div>

    </div>

</body>
</html>
