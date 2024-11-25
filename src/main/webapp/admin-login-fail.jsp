<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Admin Login Failed</title>
</head>
<body>
    <!-- <%@include file="navbar.jsp" %> -->
    
	<h2><c:out value="${msg}" ></c:out></h2>
    <a href="/admin-login" >Try Again</a>

</body>
</html>
	