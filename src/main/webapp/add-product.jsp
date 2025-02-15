<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="jakarta.tags.core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
	<title>Add Product</title>

	<link rel="stylesheet" href="styles.css" type="text/css" >
</head>
<body>
	<c:if test="${admin != null}" >
		<%@include file="admin-navbar.jsp" %>
		
		<h2>Add Product</h2>
	
	    <form method="post" action="/add-product" enctype="multipart/form-data" onsubmit="return validateImage()" >
	        <label for="pname" >Product Name: </label>
	        <input type="text" id="pname" name="pname" required />
	        <br /><br />
	        
	        <label for="pcost" >Product Cost: </label>
	        <input type="number" id="pcost" name="pcost" step="0.01" required />
	        <br /><br />
	        
	        <label for="pdescription" >Product Description: </label>
	        <textarea id="pdescription" name="pdescription" required ></textarea>
	        <br /><br />
	        
	        <label for="pimg" >Product Image: </label>
	        <input type="file" id="pimg" name="pimg" accept="image/*" required />
	        <br /><br />
	
	        <input type="submit" value="Add Product" />
	        <input type="reset" value="Reset" />
	    </form>
	
	    <script>
	        function validateImage() {
	            const file = document.getElementById("pimg").files[0];
	            if (file) {
	                if (file.type.startsWith("image/")) {
	                    return  true;
	                } else {
	                    alert("Select an Image file type!");
	                    return false;
	                }
	            }
	
	            return false;
	        }
	    </script>
	</c:if>
	
	<c:if test="${admin == null}" >
		<h2>
			<div class="red-txt" >No Admin Logged in!</div>
			<a style="color: blue;" href="/admin-login" >Login</a>
			to view home.
		</h2>
	</c:if>
</body>
</html>
	