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
<title>Orders Received</title>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<style type="text/css">
	#head{
		color: white;
		text-align: center;
	}
	#cancelled{
		color: red;
	}
	#delivered{
		color: green;
	}
	
</style>
</head>
<body>
<h2 id="head"><i class="fa-solid fa-truck"></i> Orders Received</h2>
	<%String email = request.getSession().getAttribute("email").toString(); %>
	<%String msg = request.getParameter("msg"); %>
	<%if("cancelled".equals(msg)){ %>
		<h3 class="alert">Order Cancelled Successfully!</h3>
	<%} %>
	<%if("delivered".equals(msg)){ %>
		<h3 class="alert">Orders Delivered Successfully!</h3>
	<%} %>
	<%if("invalid".equals(msg)){ %>
		<h3 class="alert">Something went wrong! Try Again!</h3>
	<%} %>
	
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
			<th scope="col" id="cancelled"><i class="fa-solid fa-rectangle-xmark"></i> Cancel Order</th>
			<th scope="col" id="delivered"><i class="fa-solid fa-square-check"></i> Order Delivered</th>
		</tr>
		<%int sno = 1; %>
		<%ResultSet rs = CartDAO.ordersReceived(); %>
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
				<td><%=rs.getString(15) %></td>
				<td><a href="../cancelOrders?pid=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Cancel Order</a></td>
				<td><a href="../deliveredOrders?pid=<%=rs.getString(2)%>&email=<%=rs.getString(1)%>">Delivered</a></td>
			</tr>
		<%} %>
	</table>
	<br><br><br><br>
</body>
</html>