package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;
@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		Long mobileNumber = Long.parseLong(req.getParameter("mobileNumber"));
		String securityQuestion = req.getParameter("securityQuestion");
		String answer = req.getParameter("answer");
		String newPassword = req.getParameter("newPassword");
		UserDTO user = new UserDTO(email, mobileNumber, securityQuestion, answer, newPassword);
		int res = UserDAO.forgetPassword(user);
		if(res==1) {
			resp.sendRedirect("forgotPassword.jsp?msg=valid");
		}
		if(res==0) {
			resp.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	}
	
}
