<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>
<%@ page import = "dao.ProductDAO" %>
<%@ page import = "java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<style type="text/css">
	.notify{
		color: yellow;
		text-align: center;
	}
	#head{
		text-align: center;
		color: white;
	}
</style>
</head>
<body>
	
	<% ResultSet rs = ProductDAO.retriveProducts(); %>
	<h2 id="head"><i class="fa-solid fa-pen-to-square"></i> Edit Product</h2>
	<table>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Status</th>
				<th scope="col">Edit</th>
			</tr>
		</thead>
		<tbody>
		<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getDouble(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><a href="editProduct.jsp?id=<%=rs.getInt(1)%>"><i class="fa-solid fa-pen-to-square"></i> Edit</a></td>
			</tr>
		<%} %>
		<% String msg = request.getParameter("msg"); %>
		<%if("valid".equals(msg)){ %>
			<h2 class="notify"> Updated Successfully</h2>
		<%} %>	
		<%if("invalid".equals(msg)){ %>
			<h2 class ="notify">Something went wrong! Try Again!</h2>
		<%} %>
		</tbody>
	</table>
</body>
</html>