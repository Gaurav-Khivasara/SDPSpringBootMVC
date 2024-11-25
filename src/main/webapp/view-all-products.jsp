<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>View All Products</title>

    <link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
    <h2>All Products:</h2>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Cost</th>
            <th>Description</th>
            <th>Image</th>
        </tr>
        <c:forEach items="${products}" var="product" >
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.cost}</td>
                <td>${product.description}</td>
                <td><img src="/display-img?id=${product.id}" width="15%" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
