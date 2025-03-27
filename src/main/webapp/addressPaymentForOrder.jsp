<%@page import="dao.UserDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddressPaymentForOrder</title>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style type="text/css">
	#heading{
		color: darkred;
		text-align: center;
	}
	#back{
		background-color: blue;
	}
	#back a{
		color: white;
	}
	#total{
	background-color: yellow;
	}
	.alert{
		color:darkred;
	}
</style>
</head>
<body>
	<%String email = (String)request.getSession().getAttribute("email"); %>
	<%double total = (double)request.getAttribute("total");%>
	<h1 id="heading"><i class="fa-solid fa-credit-card"></i> PAYMENT INTERFACE</h1>	
	<table>
		<thead>
			<tr>
				<th id="back"><a href="myCart" >Back</a></th>
				<th id="total">Total:<%=total %></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>S.NO</th>
				<th>PRODUCT NAME</th>
				<th>CATEGORY</th>
				<th>PRICE</th>
				<th>QUANTITY</th>
				<th>SUB TOTAL</th>
			</tr>
		</thead>
		<tbody>
		<%int sno = 0;%>
		<%ResultSet rs1 = ProductDAO.selectProductInnerCart(email); 
			while(rs1.next()){
		%>
			<tr>
			<%sno = sno+1; %>
				<td><%=sno %></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs1.getDouble(4)%></td>
				<td><%=rs1.getInt(8)%></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=rs1.getDouble(10)%></td>
			</tr>
		<%} %>	
		
		</tbody>
	</table>
	<hr>
	<%ResultSet rs2 = UserDAO.retriveDetails(email); %>
	<%while(rs2.next()){ %>
	<form action="addressPayment" method="post">
		<div class="left-div">
			<h3>Enter Address</h3>
			<input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>" placeholder="Enter Address" required>
		</div>
		<div class="right-div">
			<h3>Enter City</h3>
			<input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>" placeholder="Enter City" required>
		</div>
		<div class="left-div">
			<h3>Enter State</h3>
			<input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>" placeholder="Enter State" required>
		</div>
		<div class="right-div">
			<h3>Enter Country</h3>
			<input class="input-style" type="text" name="country" value="<%=rs2.getString(10)%>" placeholder="Enter Country" required>
		</div>
		
		<h3 class="alert">**If there is no address it mean that you did not set your address!</h3>
		<h3 class="alert">**This address will also updated to your profile.</h3>
		<hr>
		<div class="left-div">
			<h3>Select way of Payment</h3>
			<select class="input-style"name="paymentMethod">
				<option value="cod">Cash on delivery(COD)</option>
				<option value="online">Online Payment</option>
			</select>
		</div>
		<div class="right-div">
			<h3>Pay online on this ala@pay.com</h3>
			<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction ID">
			<h3 class="alert">**If you enter online payment then mandatorily Enter Transaction ID here otherwise leave this blank.</h3>
		</div>
		<hr>
		<div class="left-div">
			<h3>Mobile Number</h3>
			<input class="input-style" type="tel" name="mobileNumber" value="<%=rs2.getLong(3)%>" placeholder="Enter Mobile Number" required>
			<h3 class="alert">This mobile number will updated to your profile.</h3>
		</div>
		<div class="right-div">
			<h3 class="alert">**If you enter wrong transactionID, then your order will be cancelled.</h3>
			<button class="button" type="submit">Proceed to generate a bill and Save</button>
			<h3 class="alert">**Fill the form correctly.</h3>
		</div>
	</form>
	<%} %>
	
	<script type="text/javascript">
		if(window.history.forward(1)!=null){
			window.history.forward(1);
		}
	</script>
</body>
</html>