<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.klef.jfsd.springboot.model.Customer" %>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<%
Customer customer = (Customer)session.getAttribute("customer");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Customer Home</title>

	<link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
    <c:if test="${customer != NULL}" >
		<%@include file="customer-navbar.jsp" %>
	
		<h2>
			Welcome 
			<%=customer.getName().substring(0, 1).toUpperCase() %><%=customer.getName().substring(1) %>
		</h2>
	</c:if>

    <c:if test="${customer == null}" >
        <h2>
            <div class="red-txt" >No Customer Logged in!</div>
            <a style="color: blue;" href="/customer-login" >Login</a>
            to view Home.
        </h2>
    </c:if>
</body>
</html>
	