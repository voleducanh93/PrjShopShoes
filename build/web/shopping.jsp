<%-- 
    Document   : shopping.jsp
    Created on : Feb 28, 2024, 8:16:28 AM
    Author     : hoanv
--%>

<%@page import="sample.sp24.t2s4.shopping.ShoesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Shoes Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <style>
            body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            max-width: 600px;
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

        form {
            text-align: center;
        }

        select, input[type="submit"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #4CAF50;
            color: white;
        }
        </style>
    </head>
    <body>
        <form action="MainController">
                          <input type="submit" name="action" value="Logout" />  
                </form>
        <script>
            <c:if test="${not empty requestScope.THANKYOU}">
            alert("${requestScope.THANKYOU}");
            </c:if>
        </script>
        <div class="container">
            <h1>Welcome to Shoes Shop</h1>
            <form action="MainController" method="POST">
                Select your shoes:
                <select name="shoes">
                    <c:set var="dao" value="<%= new ShoesDAO()%>" />
                    <c:set var="listItem" value="${dao.getAllProduct()}" />

                    <c:forEach var="shoes" items="${listItem}">
                        <c:set var="value" value="${shoes.id}-${shoes.name}-" />
                        <c:set var="content" value="${shoes.name} - " />
                        <c:if test="${shoes.price == Math.round(shoes.price)}">
                            <c:set var="roundedPrice" value="${Math.round(shoes.price)}" />
                            <c:set var="value" value="${value}${roundedPrice}" />
                            <c:set var="content" value="${content}${roundedPrice}$" />
                        </c:if>

                        <c:if test="${shoes.price != Math.round(shoes.price)}">
                            <c:set var="value" value="${value}${shoes.price}" />
                            <c:set var="content" value="${content}${shoes.price}$" />
                        </c:if>
                        <option value="${value}"> ${content}  </option>
                    </c:forEach>
                </select>
                Quantity:<select name="quantity">
                    <option value="1">1 Items</option>
                    <option value="2">2 Items</option>
                    <option value="3">3 Items</option>
                    <option value="4">4 Items</option>
                    <option value="5">5 Items</option>
                    <option value="10">10 Items</option>
                </select>
                <input type="submit" name="action" value="Add"/>
                <input type="submit" name="action" value="View"/>

            </form>
        </div>
    </body>

    ${requestScope.MESSAGE}
</html>
