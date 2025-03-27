<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
	<div id="container">
		<div class="signup">
			<form action="signupAction" method="get">
				<input type="text" name="name" placeholder="Enter your name" required autofocus>
				<input type="email" name="email" placeholder="Enter your email" required>
				<input type="number" name="mobileNumber" placeholder="+91 XXXXXXXXXX" required oninput="this.value = this.value.replace(/[^0-9+]/g, '').slice(0, 10)">
				<select name="securityQuestion" required>
					<option value="What was your first car?">What was your first car?</option>
					<option value="What is the first name of your pet?">What is the first name of your pet?</option>
					<option value="What was your first school?">What was your first school?</option>
					<option value="Your birth place?">Your birth place?</option>
				</select>
				<input type	="text" name="answer" placeholder="Enter your answer" required>
				<input type="password" name="password" placeholder="Enter your password" required>
				<input type="submit" value="signup" onclick="validatePhone()">
			</form>
			<h2><a href="login.jsp">Login</a></h2>
		</div>
		<div class="whysign">
		<% 
			String msg = request.getParameter("msg");
			if("valid".equals(msg)){
		%>
			<h1>Successfully Registered</h1>
			<%} %>
		<%
			if("invalid".equals(msg)){
		%>
			<h1>Something went wrong! Try again!</h1>
			<%}%>
			<h2>Online shopping</h2>
			<p>Online shopping system is the application that allows the users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
	<script type="text/javascript" src="script/script.js"></script>
</body>
</html>