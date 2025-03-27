package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.UserDTO;
@WebServlet("/bill")
public class BillGenerator extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		try {
			double total = CartDAO.sumCartBill(email);
			ResultSet rs = CartDAO.billDetails(email);
			ArrayList<UserDTO> user = new ArrayList<UserDTO>();
			ArrayList<CartDTO> cart = new ArrayList<CartDTO>();
			while(rs.next()) {
				user.add(new UserDTO(rs.getString(1), rs.getString(2), rs.getLong(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
				cart.add(new CartDTO(rs.getString(11), rs.getInt(12), rs.getInt(13), rs.getDouble(14), rs.getDouble(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getLong(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25)));
			}
			Map<Integer, List<Object>> map = new HashMap<Integer, List<Object>>();
			ResultSet res =  ProductDAO.selectProductInnerCartBill(email);
			int i = 1;
			while(res.next()) {
				map.put(i++, Arrays.asList(res.getString(2),res.getString(3),res.getDouble(4),res.getInt(8),res.getDouble(9)));
			}
			System.out.println(user.size());
			System.out.println(cart.size());
			req.setAttribute("user", user);
			req.setAttribute("cart", cart);
			req.setAttribute("map", map);
			req.setAttribute("total", total);
			req.getRequestDispatcher("bill.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
