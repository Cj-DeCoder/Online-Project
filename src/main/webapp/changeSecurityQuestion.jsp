<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="changeDetailMenu.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Security Question</title>
<link rel="stylesheet" href="css/changeDetails.css">
</head>
<body>
	<%String msg = request.getParameter("msg"); %>
	<%if("done".equals(msg)){ %>
	<h3 class="alert">Your security question successfully changed!</h3>
	<%} %>
	<%if("wrong".equals(msg)){ %>
	<h3 class="alert">Password is wrong!</h3>
	<%} %>
	<form action="securityQuestion">
	<h3>Select your security question</h3>
	<select class="input-style" name="securityQuestion" autofocus> 
			<option value="What was your first car?">What was your first car?</option>
			<option value="What is the first name of your pet?">What is the first name of your pet?</option>
			<option value="What was your first school?">What was your first school?</option>
			<option value="Your birth place?">Your birth place?</option>
	</select>
	<hr>
	<h3>Enter your answer</h3>
	<input class="input-style" type="text" name="answer" placeholder="Enter Your Answer" required>
	<hr>
	<h3>Enter Password (Security Purpose)</h3>
	<input class="input-style" type="password" name="password" placeholder="Enter Your Password" required>
	<hr>
	<button class="button" type="submit">Save</button>
	</form>
</body>
</html>