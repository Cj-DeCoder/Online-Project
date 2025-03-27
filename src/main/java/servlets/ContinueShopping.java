package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
@WebServlet("/continueShopping")
public class ContinueShopping extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		String status = "processing";
		try {
			CartDAO.updateCartStatus(email, status);
			resp.sendRedirect("home.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
