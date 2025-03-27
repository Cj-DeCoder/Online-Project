<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forget Password</title>
<link rel="stylesheet" href="css/signup-style.css">
</head>
<body>
	<div id="container">
		<div class="forgotpwd">
			<form action="forgotPassword" method="post">
				<input type="email" name="email" placeholder="Enter Your Email" required autofocus>
				<input type="number" name="mobileNumber" placeholder="Enter Your Mobile Number" required>
				<select name="securityQuestion">
					<option value="What was your first car?">What was your first car?</option>
					<option value="What is the first name of your pet?">What is the first name of your pet?</option>
					<option value="What was your first school?">What was your first school?</option>
					<option value="Your birth place?">Your birth place?</option>
				</select>
				<input type="text" name="answer" placeholder="Enter Your Answer" required>
				<input type="password" name="newPassword" placeholder="Enter Your New Password" required>
				<input type="submit" value="Save">
				</form>
			<h2><a href="login.jsp">Login</a></h2>
		</div>
		<div class="whyforgotPassword">
		<%	String msg = request.getParameter("msg");
			if("valid".equals(msg)){%>
				<h1>Password changed successfully</h1>
			<%}%>
			<%if("invalid".equals(msg)){%>
				<h1>Something went wrong! Try again!</h1>
			<%}%>
			<h2>Online Shopping</h2>
			<p>Online shopping system is the application that allows the users to shop online without going to the shops to buy them.</p>
		</div>
	</div>
</body>
</html>