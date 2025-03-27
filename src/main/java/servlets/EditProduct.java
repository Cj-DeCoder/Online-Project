package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;
@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String category = req.getParameter("category");
		double price = Double.parseDouble(req.getParameter("price"));
		String status = req.getParameter("status");
		ProductDTO product = new ProductDTO(id, name, category, price, status);
		try {
			int result = ProductDAO.updateProducts(product);
			resp.sendRedirect("admin/addProductEditProduct.jsp?msg=valid");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("hey");
			resp.sendRedirect("admin/addProductEditProduct.jsp?msg=invalid");
		} 
	}
	
}
