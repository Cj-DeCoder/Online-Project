package servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.SecurePasswordHashing;
@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = SecurePasswordHashing.hashPassword(req.getParameter("password"));
		if(email.equals("admin@gmail.com") && password.equals("jGl25bVBBBW96Qi9Te4V37Fnqchz/Eu4qB9vKrRIqRg=")) {
			 req.getSession().setAttribute("email", email);
			 resp.sendRedirect("adminHome");
		}
		else {
			try {
				ResultSet result = UserDAO.retrive(email,password);
				int z = 0;
				while(result.next()) {
					z = 1;
					req.getSession().setAttribute("email", email);
					resp.sendRedirect("adminHome");
				}
				if(z==0) {
					resp.sendRedirect("login.jsp?msg=notexists");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
				resp.sendRedirect("login.jsp?msg=invalid");
			}
		}
	}

}
