<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Header</title>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style type="text/css">
	#head{
		color: white;
		text-align: center;
	}

	.cancelled{
		color: red;
	}
	.delivered{
		color: green;
	}
	.processing{
		color: blue;
	}
</style>
</head>
<body>
	<div class="topnav sticky">
		
		<h2 class="head"><i class="fa-solid fa-shop"></i> LEEZ ONLINE SHOPPING</h2>
		<a href="addNewProduct.jsp"><i class="fa-solid fa-circle-plus"></i> Add New Product</a>
		<a href="addProductEditProduct.jsp"><i class="fa-solid fa-pen-to-square"></i> Edit Product</a>
		<a href="messageReceived.jsp"><i class="fa-solid fa-file-arrow-down"></i> Message Received</a>
		<a href="ordersReceived.jsp"><i class="fa-solid fa-truck"></i> Orders Received</a>
		<a href="ordersCancelled.jsp"><i class="fa-solid fa-rectangle-xmark"></i> Orders Cancelled</a>
		<a href="ordersDelivered.jsp"><i class="fa-solid fa-square-check"></i> Orders Delivered</a>
		<a href="../logout.jsp"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
	</div>
</body>
</html>