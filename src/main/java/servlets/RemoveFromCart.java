package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
@WebServlet("/removeFromCart")
public class RemoveFromCart extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String) req.getSession().getAttribute("email");
		int id = Integer.parseInt(req.getParameter("id"));
		CartDAO.removeCart(email, id);
		resp.sendRedirect("myCart");
	}
	
}
