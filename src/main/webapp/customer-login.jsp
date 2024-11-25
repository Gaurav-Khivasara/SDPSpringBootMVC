<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Customer Login</title>
</head>
<body>
    <%@include file="navbar.jsp" %>
	
    <h2>Customer Login</h2>

    <form method="post" action="/check-customer-login" >
        <label for="email" >Email: </label>
        <input type="email" id="email" name="email" required />
        <br /><br />
        
        <label for="password" >Password: </label>
        <input type="password" id="password" name="password" required />
        <br /><br />
        
        <input type="submit" value="Submit" />
        <input type="reset" value="Reset" />
    </form>

    <c:if test="${msg != null}" >
        <br />
        <span class="red-txt" >
            <c:out value="${msg}" ></c:out>
        </span>
    </c:if>
    
    <c:if test="${logout == true}" >
        <%
            session.setAttribute("customer", null);
        %>
    </c:if>
        
</body>
</html>
	