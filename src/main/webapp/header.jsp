<%@page import="dao.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
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
		color: blue;
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
	#blur {
        display: block;
        height: 100vh;
        background-color: aqua;
        opacity: 0.3;
        width: 100%;
        position: absolute;
      }
      #userDetails {
        position: relative;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        height: fit-content;
        border: 2px solid black;
        width: fit-content;
        background-color: white;
        flex-wrap: wrap;
        padding: 20px;
        line-height: 30px;
      }
      #container{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }
      #box{
        display: none;
        position: absolute;
        height: 80vh;
        width: 100%;
        z-index: 1;
      }
      #uEdit{
        width: 120px;
        height: fit-content;
        padding: 10px;
        font-size: 15px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      #uEdit:hover{
        background-color: rgb(210, 14, 14);
      }
      .ud{
      	color: green;
      }
</style>
</head>
<body>
<%String email =(String) request.getSession().getAttribute("email");%>
<%ResultSet r = UserDAO.retriveDetails(email); %>
<%if(r.next()){ %>
<div id="box">
	    <div id="blur" class="show"></div>
	    <div id="container">
	        <div id="userDetails" class="show">
	            <h2>Name: <span class="ud"><%=r.getString(1) %></span></h2>
	            <h2>Address: <span class="ud"><%=r.getString(7) %>,<%=r.getString(8) %>,<%=r.getString(9) %>,<%=r.getString(10) %></span></h2>
	            <h2>Email: <span class="ud"><%=r.getString(2) %></span></h2>
	            <h2>Mobile Number: <span class="ud"><%=r.getString(3) %></span></h2>
	          	<a href="changeDetails.jsp"><button id="uEdit"><i class="fa-solid fa-file-pen"></i> Edit</button></a>
	        </div>
	    </div>
	    <a>Edit</a>
    </div>
<%} %>
	<!-- Header -->
	<br>
	<div class="topnav sticky">
	
		<% if(email != null){%>
		<h1><i class="fa-solid fa-shop"></i> LEEZ ONLINE SHOPPING</h1>
		<a href="#" id="email" onclick="details()"><i class="fa-solid fa-user"></i> <%out.println(email); %></a>
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
   
  <script>
  function details() {
      let box = document.getElementById("box");
      box.style.display = "block";
      document.body.style.overflow = "hidden";
    }
  let blur = document.getElementById("blur");
  blur.addEventListener("click", function () {
    let box = document.getElementById("box");
    box.style.display = "none";
    document.body.style.overflow = "auto";
  });
  </script>
</body>
</html>