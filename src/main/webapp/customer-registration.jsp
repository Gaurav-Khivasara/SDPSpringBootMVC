<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
	<title>Customer Registration</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<h2>Customer Registration</h2>

    <form method="post" action="/register-customer" >
        <label for="name" >Name: </label>
        <input type="" id="name" name="name" required />
        <br /><br />
        
        <label for="gender" >Gender: </label>
        <input type="radio" id="male" value="Male" name="gender" required />
        <label for="male" >Male</label>
        <input type="radio" id="female" value="Female" name="gender" required />
        <label for="female" >Female</label>
        <br /><br />
        
        <label for="dob" >Date of Birth: </label>
        <input type="date" id="dob" name="dob" required />
        <br /><br />
        
        <label for="email" >Email: </label>
        <input type="email" id="email" name="email" required />
        <br /><br />
        
        <label for="password" >Password: </label>
        <input type="password" id="password" name="password" required />
        <br /><br />
        
        <label for="location" >Location: </label>
        <textarea id="location" name="location" required ></textarea>
        <br /><br />

        <input type="submit" value="Submit" />
        <input type="reset" value="Reset" />
    </form>

</body>
</html>
	