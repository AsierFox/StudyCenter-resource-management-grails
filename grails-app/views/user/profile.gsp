<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="layout" content="defaultMain" />

        <title>Profile - ${ user.name }</title>

        <style>

            body {
              background: #F1F3FA;
            }

            table td:first-child {
                font-weight: bold;
            }

            .container {
                margin-top: 35px;
            }

            .img-responsive {
                margin: 0 auto;
            }

            .profile-sidebar {
              padding: 20px 0 10px 0;
              background: #FFF;
            }

            .profile-userpic img {
              float: none;
              margin: 0 auto;
              width: 50%;
              height: 50%;
              -webkit-border-radius: 50% !important;
              -moz-border-radius: 50% !important;
              border-radius: 50% !important;
            }

            .profile-usertitle {
              text-align: center;
              margin-top: 20px;
            }

            .profile-usertitle-name {
              color: #5a7391;
              font-size: 16px;
              font-weight: 600;
              margin-bottom: 7px;
            }

            .profile-usertitle-job {
              text-transform: uppercase;
              color: #5b9bd1;
              font-size: 12px;
              font-weight: 600;
              margin-bottom: 15px;
            }

            .profile-userbuttons {
              text-align: center;
              margin-top: 10px;
            }

            .profile-userbuttons .btn {
              text-transform: uppercase;
              font-size: 11px;
              font-weight: 600;
              padding: 6px 15px;
              margin-right: 5px;
            }

            .profile-userbuttons .btn:last-child {
              margin-right: 0px;
            }

            .profile-usermenu {
              margin-top: 30px;
            }

            .profile-usermenu ul li {
              border-bottom: 1px solid #f0f4f7;
            }

            .profile-usermenu ul li:last-child {
              border-bottom: none;
            }

            .profile-usermenu ul li a {
              color: #93a3b5;
              font-size: 14px;
              font-weight: 400;
            }

            .profile-usermenu ul li a i {
              margin-right: 8px;
              font-size: 14px;
            }

            .profile-usermenu ul li a:hover {
              background-color: #fafcfd;
              color: #5b9bd1;
            }

            .profile-usermenu ul li.active {
              border-bottom: none;
            }

            .profile-usermenu ul li.active a {
              color: #5b9bd1;
              background-color: #f6f9fb;
              border-left: 2px solid #5b9bd1;
              margin-left: -2px;
            }

            .profile-content {
              padding: 20px;
              background: #fff;
              min-height: 460px;
            }

        </style>

    </head>
<body>

    <div class="container">

        <div class="row">

            <g:form method="POST" action="logout">
                <button type="submit">Logout</button>
            </g:form>
            <a href="<g:createLink controller='admin' />">Admin panel</a>

            <div class="col-md-3">
                <div class="profile-sidebar">
                    <g:img class="img-responsive" width="150" dir="images" file="user/avatar/${ user.avatar }" />
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">
                        ${ user.name }
                    </div>
                    <div class="profile-usertitle-job">
                        ${ user.class.getSimpleName() }
                    </div>
                </div>
                <div class="profile-userbuttons">
                    <button type="button" class="btn btn-success btn-sm">Follow</button>
                    <button type="button" class="btn btn-danger btn-sm">Message</button>
                </div>
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li class="active">
                            <a href="#">
                            <i class="glyphicon glyphicon-home"></i>
                            Overview </a>
                        </li>
                        <li>
                            <a href="#">
                            <i class="glyphicon glyphicon-user"></i>
                            Account Settings </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                            <i class="glyphicon glyphicon-ok"></i>
                            Tasks </a>
                        </li>
                        <li>
                            <a href="#">
                            <i class="glyphicon glyphicon-flag"></i>
                            Help </a>
                        </li>
                    </ul>
                </div>
                <!-- END MENU -->
            </div>

            <div class="col-md-9">
                <div class="profile-content">

                    <h3>Account information</h3>
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>DNI:</td>
                                <td>${ user.dni }</td>
                            </tr>
                            <tr>
                                <td>E-mail:</td>
                                <td>${ user.email }</td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td>${ user.name }</td>
                            </tr>
                            <tr>
                                <td>Surname</td>
                                <td>${ user.surname }</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>

    </div>

</body>
</html>
