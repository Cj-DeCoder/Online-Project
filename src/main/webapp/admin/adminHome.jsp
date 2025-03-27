<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<link rel="stylesheet" href="../css/signup-style.css">
<style type="text/css">
	h1{
		color: darkblue;
		text-align: center;
		line-height: 340px;
		font-size: 50px;
	}
</style>
</head>
<body>
	<h1>WELCOME ADMIN</h1>
	<%String email = (String) request.getSession().getAttribute("email"); 
		if((email == null)){
			System.out.println("adminHome");
			response.sendRedirect("../login.jsp");
		}
	%>
</body>
</html>