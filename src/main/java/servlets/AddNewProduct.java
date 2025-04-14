package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dao.UserDAO;
import dto.ProductDTO;
@WebServlet("/addNewProduct")
public class AddNewProduct extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String category = req.getParameter("category");
		double price = Double.parseDouble(req.getParameter("price"));
		String active = req.getParameter("active");
		ProductDTO products = new ProductDTO(id, name, category, price, active);
		try {
			ProductDAO.storeProducts(products);
			resp.sendRedirect(("admin/addNewProduct.jsp?msg=valid"));
		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect("admin/addNewProduct.jsp?msg=invalid");
		}
	}
	
}
