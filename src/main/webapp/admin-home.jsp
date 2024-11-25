<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.klef.jfsd.springboot.model.Admin" %>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<%
	Admin admin = (Admin)session.getAttribute("admin");
%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Admin Home</title>

	<link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
	<c:if test="${admin != null}" >
		<%@include file="admin-navbar.jsp" %>
		
		<h2>Admin Home</h2>
		
		<h4>Totoal Customers: <c:out value="${customerCount}" ></c:out></h4>
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
	