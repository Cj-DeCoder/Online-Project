<%@page import="dao.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<style type="text/css">
	h3{
		text-align: center;
		color: yellow;
	}
	#home{
		text-align: center;
		color: white;
		font-size: 30px;
	}
	#total{
		color: black;
		background-color: yellow;
	}
	
</style>
</head>
<body>
	<h2 id="home"><i class="fa-solid fa-cart-shopping"></i> My Cart</h2>
	<%String msg = request.getParameter("msg"); %>
	<%if("notPossible".equals(msg)){ %>
		<h3 class="alert">There is only one quantity! So click on remove!</h3>
	<%} %>
	<%if("inc".equals(msg)){ %>
		<h3 class="alert">Quantity increased successfully!</h3>
	<%} %>
	<%if("dec".equals(msg)){ %>
		<h3 class="alert">Quantity decreased successfully!</h3>
	<%} %>
	
	<%if("removed".equals(msg)){ %>
		<h3 class="alert">Product successfully removed!</h3>
	<%} %>
	
	<% double total = (double)request.getAttribute("total"); %>
	<table>
		<thead>
			<tr>
				<th scope="col" id="total">Total: <%=total %> </th>
				<%if(total>0){ %>
				<th scope="col"><a href="addressPayment">Proceed to Order</a></th>
				<%} %>
			</tr>
		</thead>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Product Name</th>
				<th scope="col">Category</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Sub Total</th>
				<th scope="col">Remove</th>
			</tr> 
		</thead>
	
		<%int sno = 0;%>
		<% String mail = (String) request.getSession().getAttribute("email");
		ResultSet rs = ProductDAO.selectProductInnerCart(email); 
			while(rs.next()){
		%>
		<tr>
			<%sno = sno + 1; %>
			<td><%=sno %></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getDouble(4)%></td>
			<td><a href="inc_dec_quantity?id=<%=rs.getInt(1)%>&quantity=dec">-</a> <%=rs.getInt(8)%> <a href="inc_dec_quantity?id=<%=rs.getInt(1)%>&quantity=inc">+</a></td>
			<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getDouble(10)%></td>
			<td><a href="removeFromCart?id=<%=rs.getInt(1)%>"><i class="fa-solid fa-trash"></i> Remove</a></td>
		</tr>
		<%} %>
	</table>
	<br><br><br><br>
</body>
</html>