<%@page import="java.security.KeyStore.Entry"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.CartDTO"%>
<%@page import="dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
<link rel="stylesheet" href="css/bill.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>
<body>
	<h3>Online shopping bill</h3>
	<%ArrayList<UserDTO> user = (ArrayList<UserDTO>) request.getAttribute("user"); %>
	<%ArrayList<CartDTO> cart = (ArrayList<CartDTO>) request.getAttribute("cart"); 
	%>
	<hr>
	
	<div class="left-div">
		<h3>Name: <%=user.get(0).getName() %></h3>
	</div>
	<div class="right-div-right">
		<h3>Email: <%=user.get(0).getEmail() %></h3>
	</div>
	<div class="right-div">
		<h3>Mobile Number: <%=user.get(0).getMobileNumber() %> </h3>
	</div>
	
	<div class="left-div">
		<h3>Order Date: <%=cart.get(0).getOrderDate()%></h3>
	</div>
	<div class="right-div-right">
		<h3>Payment Method: <%=cart.get(0).getPaymentMethod() %></h3>
	</div>
	<div class="right-div">
		<h3>Expected Delivery: <%=cart.get(0).getDeliveryDate() %> </h3>
	</div>
	
	<div class="left-div">
		<h3>Transaction Id: <%=cart.get(0).getTransactionId() %> </h3>
	</div>
	
	<div class="right-div">
		<h3>City: <%=user.get(0).getCity() %></h3>
	</div>
	<div class="right-div-right">
		<h3>Address: <%=user.get(0).getAddress() %></h3>
	</div>
	<div class="left-div">
		<h3>State: <%=user.get(0).getState() %></h3>
	</div>
	<div class="right-div-right">
		<h3>Country: <%=user.get(0).getCountry() %> </h3>
	</div>
	<hr>
	<h3>Product Details</h3>
	<table id="customers">
		<tr>
			<th>S.NO</th>
			<th>PRODUCT NAME</th>
			<th>CATEGORY</th>
			<th>PRICE</th>
			<th>QUANTITY</th>
			<th>SUB TOTAL</th>
		</tr>
		<%Map<Integer,List<Object>> map = (HashMap<Integer,List<Object>>) request.getAttribute("map");%>
		<% for(Map.Entry<Integer,List<Object>> entry : map.entrySet()) {%>
			<%List<Object> ob = entry.getValue(); %>
		<tr>
			<td><%=entry.getKey()%></td>
			<td><%=ob.get(0)%></td>
			<td><%=ob.get(1)%></td>
			<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=ob.get(2)%></td>
			<td><%=ob.get(3)%></td>
			<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=ob.get(4)%></td>
		</tr>
		<%} %>
	</table>
	<%double total = (double)request.getAttribute("total"); %>
	<h3>Total :<i class="fa-solid fa-indian-rupee-sign"></i> <%=total %> </h3>
	<a href="continueShopping"><button class="button left-button">Continue Shopping</button></a>
	<a onclick="window.print()"><button class="button right-button">Print</button></a>
	<br><br><br><br>
</body>
</html>