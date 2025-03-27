package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
@WebServlet("/deliveredOrders")
public class DeliveredOrders extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("pid"));
		String email = req.getParameter("email");
		String status = "delivered";
		try {
			CartDAO.updateCartStatusToDelivered(status,id, email);
			resp.sendRedirect("admin/ordersReceived.jsp?msg=delivered");
		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect("admin/orderReceived.jsp?msg=invalid");
		}
	}
	
}
