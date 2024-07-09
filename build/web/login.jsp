<%-- 
    Document   : login
    Created on : Jan 24, 2024, 8:44:29 AM
    Author     : hoanv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .g-recaptcha {
            margin-bottom: 10px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 49%;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #4CAF50;
            color: white;
        }

        #error {
            color: red;
            margin-top: 10px;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
    </head>
    <body>
        <div class="container">
        <h1> Input your information</h1>
        <form action="MainController" method="POST">
            User ID <input type="text" name="userID" /></br>
            Password <input type="password" name="password" /></br>
            <input type="submit" name="action" value="Login" />
            <input type="reset"  value="Reset" />
        </form>
        <a href="MainController?action=Create_User_Page">Create User</a>
        ${requestScope.ERROR}
        </div>
    </body>
</html>
