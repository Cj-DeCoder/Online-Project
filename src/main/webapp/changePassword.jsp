<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="changeDetailMenu.jsp" %>
<%@ include file="footer.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel="stylesheet" href="css/changeDetails.css">
</head>
<body>
	<%ResultSet rs = UserDAO.retriveDetails(email); %>
	<%String msg = request.getParameter("msg"); %>
	<%if("notMatch".equals(msg)){ %>
	<h3 class="alert">New Password and Confirm Password does not match</h3>
	<%} %>
	<%if("wrong".equals(msg)){ %>
	<h3 class="alert">Your old Password is wrong</h3>
	<%} %>
	<%if("done".equals(msg)){ %>
	<h3 class="alert">Password changed successfully</h3>
	<%} %>
	<%if("invalid".equals(msg)){ %>
	<h3 class="alert">Something went wrong! Try again!</h3>
	<%} %>
	<%while(rs.next()){ %>
		<form action="changePassword" method="post">
			<h3>Enter old Password</h3>
			<input class="input-style" type="text" name="oldPassword" placeholder="Enter old Password" required autofocus>
			<hr>
			<h3>Enter new Password</h3>
			<input class="input-style" type="password" name="newPassword" placeholder="Enter new Password" required>
			<hr>
			<h3>Enter confirm Password</h3>
			<input class="input-style" type="password" name="confirmPassword" placeholder="Enter confirm Password" required>
			<hr>
			<button class="button" type="submit">Save</button>
		</form>
	<%} %>
</body>
</html>