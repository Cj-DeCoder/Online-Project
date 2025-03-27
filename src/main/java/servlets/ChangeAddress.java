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

import dao.UserDAO;
import dto.UserDTO;
@WebServlet("/changeAddress")
public class ChangeAddress extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String country = req.getParameter("country");
		
		ArrayList<UserDTO> user = new ArrayList<UserDTO>();
		try {
			if(address==null) {
				ResultSet rs = UserDAO.retriveAddress(email);
				while(rs.next()) {
					user.add(new UserDTO(rs.getString(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
				}
				req.setAttribute("user", user);
				req.getRequestDispatcher("changeAddress.jsp").include(req, resp);
			}
			else {
				long mobileNumber = Long.parseLong(req.getParameter("mobileNumber"));
				UserDTO u1 = new  UserDTO(email, mobileNumber, address, city, state, country);
				int res = UserDAO.updateAddress(u1);
				ResultSet rs = UserDAO.retriveAddress(email);
				while(rs.next()) {
					user.add(new UserDTO(rs.getString(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
				}
				req.setAttribute("user", user);
				if(res==1)
					req.getRequestDispatcher("changeAddress.jsp?msg=valid").include(req, resp);
				else
					req.getRequestDispatcher("changeAddress.jsp?msg=invalid").include(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
