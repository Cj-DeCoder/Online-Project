<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "dao.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editing</title>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<style type="text/css">
	#count{
		color: black;
		text-align: center;
	}
	.back{
		color: purple;
		margin: 20px;
	}
	#btn{
		width: 180px;
		margin-top: 20px;
	}
</style>
</head>
<body>
	<a class="back" href="addProductEditProduct.jsp"><button id="btn"><i class="fa-solid fa-arrow-left"></i> Back</button></a>
	<% int id = Integer.parseInt(request.getParameter("id"));%>
	<% ResultSet rs = ProductDAO.selectUser(id); %>
		<%if(rs.next()){ %>
		<form action="../editProduct" method="post">
		<h2 id="count">Product ID: <%=rs.getInt(1) %></h2>
		<div class="left-div">
			<h3>Enter Name</h3>
			<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Enter Category</h3>
			<input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required>
			<hr>
		</div>
		<div class="left-div">
			<h3>Enter Price</h3>
			<input class="input-style" type="text" name="price" value="<%=rs.getString(4)%>" required>
			<hr>
		</div>
		<div class="right-div">
			<h3>Active</h3>
			<select class="input-style" name="status">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
			</select>
			<hr>
		</div>
		<button class="button" name="id" value="<%=rs.getInt(1)%>">Save</button>
		</form>
	<%} %>
</body>
</html>