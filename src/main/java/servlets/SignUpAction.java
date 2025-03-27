package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;
@WebServlet("/signupAction")
public class SignUpAction extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		long mobileNumber = Long.parseLong(req.getParameter("mobileNumber"));
		String securityQuestion = req.getParameter("securityQuestion");
		String answer = req.getParameter("answer");
		String password = req.getParameter("password");

		UserDTO user = new UserDTO(name, email, mobileNumber, securityQuestion, answer, password);
		try {
			UserDAO.saveUser(user);
			resp.sendRedirect("signup.jsp?msg=valid");
		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect("signup.jsp?msg=invalid");
		}
		
	}
	
}
