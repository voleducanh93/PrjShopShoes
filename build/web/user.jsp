<%-- 
    Document   : user
    Created on : Jan 24, 2024, 8:43:45 AM
    Author     : hoanv
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.sp24.t2s4.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .center-block {
            text-align: center;
            margin-top: 50px;
        }

        .container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .user-info {
            margin-bottom: 20px;
        }

        .user-info br {
            display: none;
        }

        .shopping-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
        }

        .shopping-link:hover {
            text-decoration: underline;
        }

        input[type="submit"] {
            display: block;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    </head>
    <body>
        <div class="center-block">
            <h1>User information in detail:</h1>

            <div class="container">
                <div class="user-info">
                    <div>User ID: ${sessionScope.LOGIN_USER.userID}</div>
                    <div>Full name: ${sessionScope.LOGIN_USER.fullName}</div>
                    <div>Role ID: ${sessionScope.LOGIN_USER.roleID}</div>
                    <div>Password: ${sessionScope.LOGIN_USER.password}</div>
                </div>
                <a href="MainController?action=Shopping_Page" class="shopping-link">Shopping</a>
            </div>
        </div>
                <form action="MainController">
                          <input type="submit" name="action" value="Logout" />  
                </form>

    </body>
</html>
