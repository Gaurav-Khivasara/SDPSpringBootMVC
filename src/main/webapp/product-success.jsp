<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Product Addition Success</title>

	<link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
	<c:if test="${admin != null}" >
		<%@include file="admin-navbar.jsp" %>
		
		<h2>${msg}</h2>
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
	