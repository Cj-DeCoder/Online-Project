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

@WebServlet("/securityQuestion")
public class SecurityQuestion extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		String securityQuestion = req.getParameter("securityQuestion");
		String answer = req.getParameter("answer");
		String password = SecurePasswordHashing.hashPassword(req.getParameter("password"));
		int check = 0;
		try {
			ResultSet rs = UserDAO.retriveWithPassword(email, password);
			while(rs.next()) {
				check = 1;
				UserDAO.updateSecurityQuestion(securityQuestion, answer, email);
				resp.sendRedirect("changeSecurityQuestion.jsp?msg=done");
			}
			if(check==0) {
				resp.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
