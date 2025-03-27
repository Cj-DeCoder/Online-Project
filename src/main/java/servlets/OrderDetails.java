package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dto.CartDTO;
import dto.ProductDTO;

@WebServlet("/orderDetails")
public class OrderDetails extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String) req.getSession().getAttribute("email");
		ResultSet rs;
		try {
			rs = CartDAO.retriveOrderDetails(email);
			List<CartDTO> cart = new ArrayList<CartDTO>();
			List<ProductDTO> products = new ArrayList<ProductDTO>();
			while(rs.next()) {
				cart.add(new CartDTO(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getLong(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15)));
				products.add(new ProductDTO(rs.getInt(16), rs.getString(17), rs.getString(18), rs.getDouble(19), rs.getString(20)));
			}
			req.setAttribute("cart", cart);
			req.setAttribute("products", products);
			req.getRequestDispatcher("myOrders.jsp").include(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
}
