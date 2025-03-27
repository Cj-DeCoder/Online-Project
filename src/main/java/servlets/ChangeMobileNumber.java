package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.SecurePasswordHashing;
@WebServlet("/changeMobileNumber")
public class ChangeMobileNumber extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		long newMobileNumber = Long.parseLong(req.getParameter("newMobileNumber"));
		String password = SecurePasswordHashing.hashPassword(req.getParameter("password"));
		int check = 0;
		try {
			ResultSet rs = UserDAO.retriveWithPassword(email, password);
			while(rs.next()) {
				check = 1;
				UserDAO.updateMobileNumber(newMobileNumber, email);
				resp.sendRedirect("changeMobileNumber.jsp?msg=done");
			}
			if(check==0) {
				resp.sendRedirect("changeMobileNumber.jsp?msg=wrong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
