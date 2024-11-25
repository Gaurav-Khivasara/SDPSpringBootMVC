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
        
        <c:if test="${msg != null}" >
            <h2 class="red-txt" ><c:out value="${msg}" ></c:out></h2>
        </c:if>
        
        <h2>All Customers:</h2>

        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>DOB</th>
                <th>Email</th>
                <th>Location</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${customers}" var="customer" >
                <tr>
                    <td><c:out value="${customer.id}" ></c:out></td>
                    <td><c:out value="${customer.name}" ></c:out></td>
                    <td><c:out value="${customer.gender}" ></c:out></td>
                    <td><c:out value="${customer.dob}" ></c:out></td>
                    <td><c:out value="${customer.email}" ></c:out></td>
                    <td><c:out value="${customer.location}" ></c:out></td>
                    <td><a href="<c:url value='?id=${customer.id}' ></c:url>" >Delete</a></td>
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
