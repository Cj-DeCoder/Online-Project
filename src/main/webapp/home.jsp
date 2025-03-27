<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>
<%@ page import = "dao.ProductDAO" %>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
	h3{
		color: yellow;
		text-align: center;
	}
	#head{
		color: white;
		text-align: center;
	}
	#thd{
		color: darkgreen;
		font-size: 20px; 
	}
	
</style>
</head>
<body>

	<h2 id="head">
		<i class="fa-solid fa-house"></i> Home
	</h2>
	<%String msg = request.getParameter("msg");
		if("added".equals(msg)){ %>
			<h3 class="alert">Product added successfully!</h3>
		<%} %>
		<%if("exist".equals(msg)){ %>
			<h3 class="alert">Product already exist in your cart! Quantity increased</h3>
		<%} %>
		<%if("invalid".equals(msg)){ %>
			<h3>Something went wrong! Try again!</h3>
		<%} %>
		
	<table>
		<thead>
			<tr id="thd">
				<th>ID</th>
				<th>NAME</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>ADD TO CART</th>
			</tr>
		</thead>
		<%ResultSet rs = ProductDAO.activeProducts(); %>
		<tbody>
		<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getInt(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getDouble(4) %></td>
				<td><a href="addToCart?id=<%=rs.getInt(1)%>"><i class="fa-solid fa-cart-plus"></i> Add to cart</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<br><br><br><br>
</body>
</html>