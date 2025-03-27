<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Detail Menu</title>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<style type="text/css">
	#head{
		text-align: center;
		color: Red;
	}
	#back{
		color: blue;
	}
	
</style>
</head>
<body>
	<div class="topnav sticky">
		<h2 id="head"><i class="fa-solid fa-file-pen"></i> Change Details</h2>
		<%String email = session.getAttribute("email").toString(); %>
		<h3><a href="home.jsp" id="back"><i class="fa-solid fa-arrow-left"></i>  Back</a></h3>
		<h3><a href=""><i class="fa-solid fa-user"></i> Your Profile : <%=email %></a></h3>
		<a href="changePassword.jsp"><i class="fa-solid fa-key"></i> Change Password</a>
		<a href="changeAddress"><i class="fa-solid fa-user-pen"></i> Add or Change Address</a>
		<a href="changeSecurityQuestion.jsp"><i class="fa-solid fa-shield-halved"></i> Change Security Question</a>
		<a href="changeMobileNumber.jsp"><i class="fa-solid fa-phone"></i> Change Mobile Number</a>
	</div>
</body>
</html>