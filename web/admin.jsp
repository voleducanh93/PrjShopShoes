<%-- 
    Document   : admin
    Created on : Jan 24, 2024, 8:44:19 AM
    Author     : hoanv
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.sp24.t2s4.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="password"] {
            padding: 8px;
            width: calc(100% - 16px); /* Adjust for padding */
            box-sizing: border-box;
        }

        input[type="submit"] {
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .center-text {
            text-align: center;
        }
    </style>
    </head>
    <body>

        <div class="container">

            <h1> Welcome: ${sessionScope.LOGIN_USER.fullName}</h1>
            <c:url var="logoutLink" value="MainController">
                <c:param name="action" value="MainController"></c:param>
            </c:url>
            <a href="${LogoutLink}"></a>
            <form action="MainController" method="POST">
                Search:<input type="text" name="search" value="${param.search}"/>
                <input type="submit" name="action" value="Search"/>
            </form>
            <div class="container">
                <c:if test="${requestScope.LIST_USER != null}">
                    <c:if test="${not empty requestScope.LIST_USER}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>User ID</th>
                                    <th>Full Name</th>
                                    <th>Role ID</th>
                                    <th>Password</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                <form action="MainController" method="POST"
                                      <tr>
                                        <td>${counter.count}</td>
                                        <td>
                                            <input type="text" name="userID" value="${user.userID}" readonly=""/>

                                        </td>
                                        <td>
                                            <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                        </td>
                                        <td>
                                            <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                        </td>                         
                                        <td>${user.password}</td>
                                        <td>
                                            <input type="hidden" name="search" value="${param.search}" />
                                            <input type="submit" name="action" value="Update"/>
                                        </td>
                                        <td>
<!--                                            <input type="submit" name="action" value=""/>-->
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="userID" value="${user.userID}"></c:param>
                                                <c:param name="action" value="Delete"></c:param>
                                                <c:param name="search" value="${param.search}"></c:param>

                                            </c:url>
                                            <a href="${deleteLink}">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                        </table>
                    </div>
                </div>
            </c:if>
        </c:if>            


    </body>
    <script>
        <c:if test="${not empty requestScope.ERROR}">
            alert("${requestScope.ERROR}");
        </c:if>
    </script>
</html>
