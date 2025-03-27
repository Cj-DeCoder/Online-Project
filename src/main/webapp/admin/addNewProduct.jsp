<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.ProductDAO" %>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Product</title>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<style type="text/css">
	#head{
		text-align: center;
		color: white;
	}
	#count{
		color: black;
	}
</style>
</head>
<body>	
	<h2 id="head"><i class="fa-solid fa-circle-plus"></i> Add New Product</h2>
	<%!int count=0;%>
	<%count = ProductDAO.productsCount();
	%>
	
	<%String msg = (String)request.getParameter("msg"); 
	  if("valid".equals(msg)){%>
		  <h3 class="alert">Product added successfully!</h3>
	  <%} %>
	  <%if("invalid".equals(msg)){ %>
		  <h3 class="alert">Something went wrong! Try again!</h3>
	  <% }%>
	<form action="../addNewProduct" method="post">
		<h3 id="count">Product ID: <%out.println(count);%> </h3>
		<input type="hidden" name="id" value="<%=count %>">
		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="name" placeholder="Enter Your Name" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="category" placeholder="Enter Your Category" required>
			<hr>
		</div>
		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="number" name="price" placeholder="Enter Your Price" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Active</h3>
			<select class="input-style" name="active">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>
			<hr>
		</div>
		<button>Save</button>
	</form>
</body>
</html>