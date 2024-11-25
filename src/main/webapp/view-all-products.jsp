<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>View All Products</title>

    <link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
	<c:if test="${admin != null}" >
		<%@include file="admin-navbar.jsp" %>
		
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
	</c:if>
	
	<c:if test="${admin == null}" >
		<h2>
			<div class="red-txt" >No Admin Logged in!</div>
			<a style="color: blue;" href="/admin-login" >Login</a>
			to view home.
		</h2>
	</c:if>
</body>
</html>
