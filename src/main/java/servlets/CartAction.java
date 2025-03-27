package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
@WebServlet("/myCart")
public class CartAction extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		try {
			double total = CartDAO.sumCart(email);
			req.setAttribute("total", total);
			req.setAttribute("email", email);
			req.getRequestDispatcher("myCart.jsp").include(req, resp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
