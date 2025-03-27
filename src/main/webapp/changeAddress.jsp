<%@page import="dto.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="changeDetailMenu.jsp" %>
<%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Address </title>
<link rel="stylesheet" href="css/changeDetails.css">
</head>
<body>
	<%String msg = request.getParameter("msg"); %>
	<%if("valid".equals(msg)){ %>
		<h3 class="alert">Address Successfully Updated.</h3>
	<%} %>
	<%if("invalid".equals(msg)){ %>
		<h3 class="alert">Something went wrong! Try again!</h3>
	<%} %>
	<%ArrayList<UserDTO> user = (ArrayList<UserDTO>) request.getAttribute("user");%>
	<%for(UserDTO u : user){ %>
	<form action="changeAddress" method="post">
	<h3>Enter Address</h3>
	<input class="input-style" type="text" name="address" value="<%=u.getAddress()%>" placeholder="Enter your address" required>
	<hr>
	<h3>Enter City</h3>
	<input class="input-style" type="text" name="city" value="<%=u.getCity()%>" placeholder="Enter your city" required>
	<hr>
	<h3>Enter State</h3>
	<input class="input-style" type="text" name="state" value="<%=u.getState()%>" placeholder="Enter your state" required>
	<hr>
	<h3>Enter Country</h3>
	<input class="input-style" type="text" name="country" value="<%=u.getCountry()%>" placeholder="Enter your country" required>
	<hr>
	<input type="hidden" name="mobileNumber" value="<%=u.getMobileNumber()%>">
	<button class="button" type="submit">Save</button>
	</form>
	<%} %>
</body>
</html>