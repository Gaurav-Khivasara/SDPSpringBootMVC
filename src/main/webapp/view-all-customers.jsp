<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="com.klef.jfsd.springboot.model.Admin" %>

<%@taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Admin admin = (Admin)session.getAttribute("admin");
%>

<!DOCTYPE html>
<html>
<head>
	<title>View All Customers</title>

    <link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
    <c:if test="${admin != null}" >
        <%@include file="admin-navbar.jsp" %>
        
        <h2>All Customers:</h2>
        <h4>Totoal Customers: <c:out value="${customerCount}" ></c:out></h4>
        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>DOB</th>
                <th>Email</th>
                <th>Location</th>
            </tr>
            <c:forEach items="${customers}" var="customer" >
                <tr>
                    <td><c:out value="${customer.id}" ></c:out></td>
                    <td><c:out value="${customer.name}" ></c:out></td>
                    <td><c:out value="${customer.gender}" ></c:out></td>
                    <td><c:out value="${customer.dob}" ></c:out></td>
                    <td><c:out value="${customer.email}" ></c:out></td>
                    <td><c:out value="${customer.location}" ></c:out></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
    <c:if test="${admin == null}" >
        <h2>
            <div class="red-txt" >No Admin Logged in!</div>
            <a style="color: blue;" href="/admin-login" >Login</a>
            to view all customers.
        </h2>
    </c:if>
</body>
</html>
