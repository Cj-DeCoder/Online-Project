<%@page import="dao.CartDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders Cancelled</title>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
</head>
<body>
	<h2 id="head"><i class="fa-solid fa-rectangle-xmark"></i> Orders Cancelled</h2>
	
	<table id="customers">
		<tr>
			<th>S.No</th>
			<th>Mobile Number</th>
			<th scope="col">Product Name</th>
			<th scope="col">Quantity</th>
			<th scope="col">Sub Total</th>
			<th >Address</th>
			<th >City</th>
			<th >State</th>
			<th >Country</th>
			<th scope="col">Order Date</th>
			<th scope="col">Expected Delivery Date</th>
			<th scope="col">Payment Method</th>
			<th scope="col">T-ID</th>
			<th scope="col">Status</th>
		<tr>
		<%int sno = 1; %>
		<%ResultSet rs = CartDAO.ordersCancelled(); %>
		<%while(rs.next()){ %>
			<tr>
				<td><%=sno++ %></td>
				<td><%=rs.getLong(10) %></td>
				<td><%=rs.getString(17) %></td>
				<td><%=rs.getInt(3) %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs.getDouble(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
				<td><%=rs.getString(11) %></td>
				<td><%=rs.getString(12) %></td>
				<td><%=rs.getString(13) %></td>
				<td><%=rs.getString(14) %></td>
				<td class="cancelled"><i class="fa-solid fa-rectangle-xmark"></i> <%=rs.getString(15) %></td>
			</tr>
		<%} %>
	</table>
	<br><br><br><br>
</body>
</html>