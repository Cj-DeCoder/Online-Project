<%@page import="java.sql.ResultSet"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="changeDetailMenu.jsp" %>
<%@ include file="footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Details</title>
<link rel="stylesheet" href="css/changeDetails.css">
</head>
<body>
	<%ResultSet rs = UserDAO.retriveDetails(email); %>
	<%while(rs.next()){ %>
	<h3>Name: <%=rs.getString(1) %></h3>
	<hr>
	<h3>Email: <%=rs.getString(2) %></h3>
	<hr>
	<h3>Mobile Number: <%=rs.getLong(3) %></h3>
	<hr>
	<h3>Security Questions: <%=rs.getString(4) %></h3>
	<hr>
	<%} %>
</body>
</html>