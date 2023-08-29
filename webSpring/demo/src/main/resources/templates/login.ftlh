<!DOCTYPE html>

<html>
<head>
    <title>BUYSELL</title>

    <style>
        form {
            border-color: aqua;
            border-radius: 2px;
            margin: 20px;
            text-align: center;
        }

        input[type="submit"]{
            padding: 5px;
            margin: 5px;
        }


        input[type="submit"]{
            background-color: darkgoldenrod;
            border: none;
            color: white;
            cursor: pointer;
        }



        body {
            font-family: Arial, sans-serif;
        }


        a {
            text-decoration: none;
            color: #007bff;
            position: static;
            text-align: center;
        }


        a:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>
<h1>BUYSELL</h1>


<h4>AUTHORISATION</h4>
<form action="/login" method="post">
    Email : <input type="email" name="username"><br><br>
    Password: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Enter"/><br><br>
    <a href="/registration"> Registration </a>
</form>

</body>
</html>