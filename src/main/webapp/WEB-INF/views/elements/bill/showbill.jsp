<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Bills Overview</title>
</head>
<body>
    <h1>Bill List for User ID: ${userId}</h1>
        <table border="1">
            <tr>
                <th>Bill ID</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Details</th>
            </tr>
            <c:forEach var="books" items="${books}">
                <tr>
                    <td>${book.MASACH}</td>
                    <td>${book.TENSACH}</td>
                    <td>${book.LANTAIBAN}</td>
                    <td>${book.GIA}</td>
                </tr>
            </c:forEach>
        </table>
</body>
</html>
