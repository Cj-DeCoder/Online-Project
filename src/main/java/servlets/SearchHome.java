package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProductDTO;
import dao.ProductDAO;

@WebServlet("/searchHome")
public class SearchHome extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search = req.getParameter("search");
		try {
			ResultSet rs = ProductDAO.searchProducts(search);
			ArrayList<ProductDTO> arr = new ArrayList<ProductDTO>();
			while(rs.next()) {
				arr.add(new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5)));
			}
			req.setAttribute("value", 1);
			if(arr.isEmpty()) {
				req.setAttribute("value", 0);
			}
			req.setAttribute("arr", arr);
			req.getRequestDispatcher("searchHome.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
