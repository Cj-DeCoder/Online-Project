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
import dao.ProductDAO;
@WebServlet("/addToCart")
public class AddToCart extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int product_id = Integer.parseInt(req.getParameter("id"));
		String email = req.getSession().getAttribute("email").toString();
		int quantity = 1;
		double product_price = 0;
		double product_total = 0;
		double cart_total = 0;
		int z = 0;
		try {
			ResultSet rs1 = ProductDAO.searchProductById(product_id);
			while(rs1.next()) {
				product_price = rs1.getDouble(4);
				product_total = product_price;
				System.out.println("search");
			}
			ResultSet rs2 = CartDAO.verifyCart(product_id, email);
			while(rs2.next()) {
				cart_total = rs2.getInt(5);
				cart_total = cart_total+product_total;
				quantity = rs2.getInt(3);
				quantity = quantity +1;
				z = 1;
				System.out.println("verifyCart");
			}
			if(z==1) {
				CartDAO.updateCart(cart_total,quantity,product_id,email);
				System.out.println("updating");
				resp.sendRedirect("home.jsp?msg=exist");
			}
			if(z==0) {
				CartDAO.insertCart(email,product_id,quantity,product_price,product_total);
				System.out.println("inserting");
				resp.sendRedirect("home.jsp?msg=added");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect("home.jsp?msg=invalid");
		}
	}
	
}
