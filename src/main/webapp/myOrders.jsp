<%@page import="dto.CartDTO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<%@ include file = "footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>
<style type="text/css">
	#head{
		color: white;
		text-align: center;
	}
	.cancelled{
		color: red;
	}
	.delivered{
		color: green;
	}
	.processing{
		color: blue;
	}
</style>
</head>
<body>
	<h2 id="head"><i class="fa-solid fa-truck"></i> My Orders</h2>
	<table>
		<thead>
			<tr>
				<th scope="col">S.NO</th>
				<th scope="col">PRODUCT NAME</th>
				<th scope="col">CATEGORY</th>
				<th scope="col">PRICE</th>
				<th scope="col">QUANTITY</th>
				<th scope="col">SUB TOTAL</th>
				<th scope="col">ORDER DATE</th>
				<th scope="col">EXPECTED DELIVERY</th>
				<th scope="col">PAYMENT METHOD</th>
				<th scope="col">STATUS</th>
			</tr>
		</thead>
		<tbody>
		<%List<CartDTO> cart = (ArrayList<CartDTO>) request.getAttribute("cart"); %>
		<%List<ProductDTO> products = (ArrayList<ProductDTO>) request.getAttribute("products"); %> 
		<%int sno=1, i=0, len = products.size(); %>
		<%while(i<len){ %>
			<tr>
				<td><%=sno++ %></td>
				<td><%=products.get(i).getName() %></td>
				<td><%=products.get(i).getCategory() %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=products.get(i).getPrice() %></td>
				<td><%=cart.get(i).getQuantity() %></td>
				<td><i class="fa-solid fa-indian-rupee-sign"></i> <%=cart.get(i).getTotal() %></td>
				<td><%=cart.get(i).getOrderDate() %></td>
				<td><%=cart.get(i).getDeliveryDate() %></td>
				<td><%=cart.get(i).getPaymentMethod() %></td>
				<%if(cart.get(i).getStatus().equals("cancelled")){ %>
				<td class="cancelled"><i class="fa-solid fa-rectangle-xmark"></i> <%=cart.get(i).getStatus()%></td>
				<%} %>
				
				<%if(cart.get(i).getStatus().equals("delivered")){ %>
				<td class="delivered"><i class="fa-solid fa-square-check"></i> <%=cart.get(i).getStatus() %></td>
				<%} %>
				
				<%if(cart.get(i).getStatus().equals("processing")){ %>
				<td class="processing"> <i class="fa-solid fa-rotate"></i> <%=cart.get(i).getStatus() %></td>
				<%} %>
			</tr>
		<% i++;
		} %>
		</tbody>
	</table>
	<br><br><br><br>
</body>
</html>