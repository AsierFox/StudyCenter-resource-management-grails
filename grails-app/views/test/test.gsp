<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">
  <head>
    <title>Document</title>

    <meta charset="UTF-8" />
  </head>
<body>

    <g:form method="POST" controller="user" action="logout">
        <button type="submit">Logout</button>
    </g:form>
    <h1>Test</h1>
    <p>${data}</p>
    <br>
    <p>${data2}</p>

</body>
</html>
