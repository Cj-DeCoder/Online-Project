<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<style type="text/css">
	h1{
		color: black;
		text-align: center;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>ADD TO CART</th>
			</tr>
		</thead>
		<%ArrayList<ProductDTO> arr = (ArrayList<ProductDTO>) request.getAttribute("arr"); 
		%>
		<tbody>
		<%for(ProductDTO p : arr){ %>
			<tr>
				<td><%=p.getId() %></td>
				<td><%=p.getName() %></td>
				<td><%=p.getCategory() %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=p.getPrice() %></td>
				<td><a href="addToCart?id=<%=p.getId()%>"><i class="fa-solid fa-cart-shopping"></i> Add to cart</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<% int value = (int) request.getAttribute("value");
		if(value==0){%>
			<h1>Products Not Found!</h1>
		<%} %>
	<br><br><br><br>
</body>
</html>