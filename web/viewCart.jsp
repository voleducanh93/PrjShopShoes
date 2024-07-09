<%-- 
    Document   : viewCart
    Created on : Feb 28, 2024, 8:25:33 AM
    Author     : hoanv
--%>

<%@page import="sample.sp24.t2s4.shopping.Shoes"%>
<%@page import="sample.sp24.t2s4.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart Page</title>
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

        h1 {
            text-align: center;
            margin-bottom: 20px;
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

        input[type="text"], input[type="number"] {
            padding: 8px;
            width: 100%;
            box-sizing: border-box;
        }

        .green-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            border-radius: 4px;
        }

        .green-button:hover {
            background-color: #45a049;
        }

        .total {
            text-align: right;
            margin-top: 20px;
            font-weight: bold;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>  
    </head>
    <body>
        <script>
            <c:if test="${not empty requestScope.ERROR}">
               alert("${requestScope.ERROR}");
            </c:if>          
        </script>
        
        <div class="container">
            <h1>Your selected shoes</h1>
            <c:choose>
                <c:when test="${not empty sessionScope.CART}">
                    <c:if test="${fn:length(sessionScope.CART.cart) > 0}">
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="1" />
                                <c:set var="total" value="0" />
                                <c:forEach var="shoes" items="${sessionScope.CART.cart}">
                                    <c:set var="total" value="${total + (shoes.value.quantity * shoes.value.price)}" />
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${count}</td>
                                        <td>
                                            <input type="text" name="id" value="${shoes.value.id}" readonly=""/>
                                        </td>
                                        <td>${shoes.value.name}</td>
                                        <td>${shoes.value.price}$</td>
                                        <td>
                                            <input min="1" type="number" name="quantity" value="${shoes.value.quantity}" required=""/>
                                        </td>
                                        <td>${shoes.value.quantity * shoes.value.price}$</td>
                                        <td>
                                            <input type="submit" name="action" value="Remove" class="green-button"/>
                                        </td>
                                        <td>
                                            <input type="submit" name="action" value="Edit" class="green-button"/>
                                        </td>
                                    </tr>
                                </form>
                                <c:set var="count" value="${count + 1}" />
                            </c:forEach>
                            </tbody>
                        </table>
                        <h1>Total: ${total}$</h1>
                    </c:if>
                </c:when>
            </c:choose>
            <a href="MainController?action=Shopping_Page">Add more</a>
            <a href="MainController?action=CheckOut">Check out</a>
        </div>
    </body>
</html>
