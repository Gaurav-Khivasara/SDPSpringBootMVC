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
    
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <c:if test="${customer != null}" >
        <%@include file="customer-navbar.jsp" %>

        <c:if test="${msg != null}" >
            <h2 class="green-txt" >${msg}</h2>
        </c:if>
        
        <h2>My Profile</h2>
        Id.: <%=customer.getId()%>
        <br />
        Name: <%=customer.getName()%>
        <br />
        Gender: <%=customer.getGender()%>
        <br />
        DOB: <%=customer.getDob()%>
        <br />
        Email: <%=customer.getEmail()%>
        <br />
        Location <%=customer.getLocation()%>
        <br /><br />

        <h3><a href="/update-customer-profile" >Update Profile</a></h3>
    </c:if>

    <c:if test="${customer == null}" >
        <h2>
            <div class="red-txt" >No Customer Logged in!</div>
            <a style="color: blue;" href="/customer-login" >Login</a>
            to view Profile.
        </h2>
    </c:if>
</body>
</html>
	