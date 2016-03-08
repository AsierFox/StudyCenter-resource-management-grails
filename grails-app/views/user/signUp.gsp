<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="defaultMain" />

        <title>Sign up</title>

        <asset:stylesheet src="sign-up.css" />
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">

    </head>
<body>

    <div class="row">
        <div class="col-sm-4 col-sm-offset-4">

            <div class="form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h3>Sign up now</h3>
                        <p>Fill in the form below to get instant access:</p>
                    </div>
                    <div class="form-top-right">
                        <i class="fa fa-pencil"></i>
                    </div>
                </div>
                <div class="form-bottom">

                    <form role="form" action="" method="post" class="registration-form">

                        <div class="form-group">
                            <label class="sr-only" for="form-first-name">First name</label>
                            <input type="text" name="form-first-name" placeholder="First name..." class="form-first-name form-control" id="form-first-name">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-last-name">Last name</label>
                            <input type="text" name="form-last-name" placeholder="Last name..." class="form-last-name form-control" id="form-last-name">
                        </div>

                        <div class="form-group">
                            <label class="sr-only" for="form-email">Email</label>
                            <input type="text" name="form-email" placeholder="Email..." class="form-email form-control" id="form-email">
                        </div>

                        <button type="submit" class="btn">Sign me up</button>
                    </form>
                </div>
            </div>

        </div>
    </div>

</body>
</html>
