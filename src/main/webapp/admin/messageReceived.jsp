<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.MessageUsDAO"%>
<%@ page import="dto.MessageUsDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="adminHeader.jsp" %>
<%@ include file = "../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Received</title>
<link rel="stylesheet" href="css/home-style.css">
<style type="text/css">
	#head{
		text-align: center;
		color: white;
	}
</style>
</head>
<body>
	<%ResultSet rs =  MessageUsDAO.retriveMessages(); %>
	<%List<MessageUsDTO> msg = new ArrayList<MessageUsDTO>();%>
	<%while(rs.next()){
		msg.add(new MessageUsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
	} %>
	<h2 id="head"><i class="fa-solid fa-file-arrow-down"></i> Message Received</h2>
	<table>
		<thead>
			<tr>
				<th scope="col">S.No</th>
				<th scope="col">Email</th>
				<th scope="col">Subject</th>
				<th scope="col">Body</th>
			</tr>
		</thead>
		<tbody>
		<%for(MessageUsDTO m : msg){ %>
			<tr>
				<td><%=m.getId() %></td>
				<td><%=m.getEmail() %></td>
				<td><%=m.getSubject() %></td>
				<td><%=m.getBody() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<br><br><br><br>
</body>
</html>