<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.klef.jfsd.springboot.model.Customer" %>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Customer Profile</title>
    
    <link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
    <c:if test="${customer != null}" >
        <%@include file="customer-navbar.jsp" %>
        
        <h2>Update Customer Profile</h2>
        
        <form method="post" action="/customer-profile" >
            <label for="id">ID:</label>
            <input type="number" id="id" name="id" value="${customer.id}" disabled />
            <br /><br />
            
            <label for="name" >Name: </label>
            <input type="" id="name" name="name" value="${customer.name}" required />
            <br /><br />
            
            <label for="gender" >Gender: </label>
            <input type="radio" id="male" value="Male" name="gender" required />
            <label for="male" >Male</label>
            <input type="radio" id="female" value="Female" name="gender" required />
            <label for="female" >Female</label>
            <br /><br />
            
            <label for="dob" >Date of Birth: </label>
            <input type="date" id="dob" name="dob" value="${customer.dob}" required />
            <br /><br />
            
            <label for="email" >Email: </label>
            <input type="email" id="email" name="email" value="${customer.email}" disabled />
            <br /><br />
            
            <label for="password" >Password: </label>
            <input type="password" id="password" name="password" value="${customer.password}" required />
            <br /><br />
            
            <label for="location" >Location: </label>
            <textarea id="location" name="location" required >${customer.name}</textarea>
            <br /><br />
            
            <input type="submit" value="Update" />
            <input type="reset" value="Reset" />
        </form>
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
