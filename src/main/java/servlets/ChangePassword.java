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
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		String oldPassword = SecurePasswordHashing.hashPassword(req.getParameter("oldPassword"));
		String newPassword = SecurePasswordHashing.hashPassword(req.getParameter("newPassword"));
		String confirmPassword = SecurePasswordHashing.hashPassword(req.getParameter("confirmPassword"));
		if(!confirmPassword.equals(newPassword)) {
			resp.sendRedirect("changePassword.jsp?msg=notMatch");
			return;
		}
		int check = 0;
		try {
			ResultSet rs = UserDAO.retriveWithPassword(email, oldPassword);
			while(rs.next()) {
				check = 1;
				UserDAO.updateNewPassword(newPassword, email);
				resp.sendRedirect("changePassword.jsp?msg=done");
			}
			if(check==0) {
				resp.sendRedirect("changePassword.jsp?msg=wrong");
			}
		} catch (SQLException e) {
			resp.sendRedirect("changePassword.jsp?msg=invalid");
			e.printStackTrace();
		}
		
	}
	
}
