<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
</head>
<body>
    <%@include file="admin-navbar.jsp" %>
    
	<h2>View Customer By ID</h2>

    <form method="post" action="/view-customer-by-id" >
        <label for="customer-ids" >Select Customer ID:</label>
        <select id="customer-ids" name="id" required >
            <option value="" selected disabled >--IDs--</option>
            <c:forEach items="${customers}" var="customer" >
                <option value="${customer.id}" >${customer.id} - ${customer.name}</option>
            </c:forEach>
        </select>
        <br /><br />
        
        <input type="submit" value="View" />
    </form>
    <br /><br />
    
    <c:if test="${customer != null}" >
        Id: ${customer.id}
        <br />
        Name: ${customer.name}
        <br />
        DOB: ${customer.dob}
        <br />
        Email: ${customer.email}
        <br />
        Gender: ${customer.gender}
        <br />
        Location: ${customer.location}
    </c:if>

    <c:if test="${logout == true}" >
        <%
            session.setAttribute("admin", null);
        %>
    </c:if>
</body>
</html>
	