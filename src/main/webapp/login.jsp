<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
	<% request.getRequestDispatcher("adminHome").include(request, response);	
	%>
	<div id="container">
		<div class="login">
			<form action="login" method="post">
				<input type="email" name="email" placeholder="Enter Your Email" required autofocus>
				<input type="password" name="password" placeholder="Enter Your Password" required>
				<input type="submit" value="login">
			</form>
				<h2><a href="signup.jsp">SignUp</a></h2>
				<h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
		</div>
		<div class="whysignLogin">
		<%
			String msg = request.getParameter("msg");
			if("notexists".equals(msg)){ %>
				<h1>Incorrect Username or Password</h1>
			<%}%>
			<%if("invalid".equals(msg)){ %>
				<h1>Something went wrong! Try Again!</h1>	
			<%}%>
			<h2>LEEZ ONLINE SHOPPING</h2>
			<p>Online shopping system is the application that allows the users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>