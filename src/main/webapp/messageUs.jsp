<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Us</title>
<link rel="stylesheet" href="css/messageUs.css">
<style type="text/css">
	#head{
		text-align: center;
		color: white;

	}
	.alert{
		color: yellow;
		text-align: center;
	}
</style>
</head>
<body>
	<h2 id="head">
		<i class="fa-solid fa-message"></i> Message Us
	</h2>
	<%String msg = request.getParameter("msg"); %>
	<%if("valid".equals(msg)){ %>
	<h3 class="alert">Message successfully sent. Our team will contact you soon!</h3>
	<%} %>
	<%if("invalid".equals(msg)){ %>
	<h3 class="alert">Something went wrong! Try Again!</h3>
	<%} %>
	<form action="messageUs" method="post">
		<input class="input-style" type="text" name="subject" placeholder="Subject" required autofocus>
		<hr>
		<textarea class="input-style" name="body" placeholder="Enter Your Message" required>
		</textarea>
		<hr>
		<button class="button" type="submit">Send</button>
	</form>
</body>
</html>