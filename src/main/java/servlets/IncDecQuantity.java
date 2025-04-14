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

@WebServlet("/inc_dec_quantity")
public class IncDecQuantity extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		int id = Integer.parseInt(req.getParameter("id"));
		String operation = req.getParameter("quantity");
		double price = 0;
		double total = 0;
		int quantity = 0;
		
		try {
			
			ResultSet rs = CartDAO.verifyCart(id, email);
			while(rs.next()) {
				quantity = rs.getInt(3);
				price = rs.getDouble(4);
				total = rs.getDouble(5);	
			}
			if(quantity==1 && operation.equals("dec")) {
				req.setAttribute("total", CartDAO.sumCart(email));
				req.getRequestDispatcher("myCart.jsp?msg=notPossible").forward(req, resp);;
			}
			else if(quantity!=1 && operation.equals("dec")) {
				total = total - price;
				quantity--;
				CartDAO.updateCart(total, quantity, id, email);
				req.setAttribute("total", CartDAO.sumCart(email));
				req.getRequestDispatcher("myCart.jsp?msg=dec").forward(req, resp);;
			}
			else {
				total = total + price;
				quantity++;
				CartDAO.updateCart(total, quantity, id, email);
				req.setAttribute("total", CartDAO.sumCart(email));
				req.getRequestDispatcher("myCart.jsp?msg=inc").forward(req, resp);;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
