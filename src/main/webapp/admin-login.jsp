<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
</head>
<body>
    <%@include file="navbar.jsp" %>
    
	<h2>Admin Login</h2>

    <form method="post" action="/check-admin-login" >
        <label for="username" >Userame: </label>
        <input type="" id="username" name="username" required />
        <br /><br />
        
        <label for="password" >Password: </label>
        <input type="password" id="password" name="password" required />
        <br /><br />
        
        <input type="submit" value="Submit" />
        <input type="reset" value="Reset" />
    </form>

    <c:if test="${logout == true}" >
        <%
            session.setAttribute("admin", null);
        %>
    </c:if>
</body>
</html>
	