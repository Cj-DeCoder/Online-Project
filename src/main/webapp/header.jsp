<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style type="text/css">
	#email{
		font-weight: bolder;
	}
	h1{
		text-align: center;
	}
	#search{
		display: flex;
		justify-content:flex-start;
		align-items: center;
		gap:10px;
	}
	#btn{
		font-size: 20px;
		border: none;
		height: 10px;
		margin-top: -5px;
	}
	#searchInput{
		border: 2px solid green;
		border-radius: 8px; 
	}
</style>
</head>
<body>
	<!-- Header -->
	<br>
	<div class="topnav sticky">
	<%String email =(String) request.getSession().getAttribute("email");
		if(email != null){
	%>
		<h1><i class="fa-solid fa-shop"></i> LEEZ ONLINE SHOPPING</h1>
		<a href="" id="email"><i class="fa-solid fa-user"></i> <%out.println(email); %></a>
		<a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
		<a href="myCart"><i class="fa-solid fa-cart-shopping"></i> My Cart</a>
		<a href="orderDetails"><i class="fa-solid fa-truck"></i> My Orders</a>
		<a href="changeDetails.jsp"><i class="fa-solid fa-user-pen"></i> Change Details</a>
		<a href="messageUs.jsp"><i class="fa-solid fa-message"></i> Message Us</a>
		<a href="aboutUs.jsp"><i class="fa-solid fa-address-card"></i> About Us</a>
		<a href="logout.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
	
		<div id="con2">
			<form action="searchHome" method="post" id="search">
				<input id="searchInput" type="text" name="search" placeholder="Search Products">
				<button type="submit" id="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
			</form>
		</div>
	</div>
	<%} %>
	<% if(email==null){  
		response.sendRedirect("login.jsp");
	}
	%>
	
</body>
</html>