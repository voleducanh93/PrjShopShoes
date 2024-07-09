<%-- 
    Document   : createUser
    Created on : Feb 24, 2024, 8:25:15 AM
    Author     : hoanv
--%>

<%@page import="sample.sp24.t2s4.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create User</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        <h1>Create new user</h1>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/>${requestScope.USER_ERROR.userIDError}
            </br> Full Name<input type="text" name="fullName" required=""/>${requestScope.USER_ERROR.fullNameError}
            </br> Role ID<input type="text" name="roleID" value="US" readonly=""/>
            </br> Password<input type="password" name="password" required=""/>
            </br> Confirm<input type="password" name="confirm" required=""/>${requestScope.USER_ERROR.confirmError}
            </br><input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
            ${requestScope.USER_ERROR.error}
        </form>
    </body>
</html>
