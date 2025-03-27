<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="changeDetailMenu.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Mobile Number</title>
<link rel="stylesheet" href="css/changeDetails.css">
</head>
<body>
<%String msg = request.getParameter("msg"); %>
<%if("done".equals(msg)){ %>
	<h3 class="alert">Your Mobile Number was Changed Successfully!</h3>
<%} %>	
<%if("wrong".equals(msg)){ %>
	<h3 class="alert">Your password is wrong!</h3>
<%} %>

<form action="changeMobileNumber" method="post">
	<h3>Enter your new mobile number</h3>
	<input class="input-style" type="text" name="newMobileNumber" placeholder="Enter your new Mobile Number" required oninput="this.value = this.value.replace(/[^0-9+]/g, '').slice(0, 10)" autofocus>
	<hr>
	<h3>Enter your Password(Security Purpose)</h3>
	<input class="input-style" type="password" name="password" placeholder="Enter your Password" required>
	<hr>
	<button class="button" type="submit">Save</button>
</form>
</body>
</html>