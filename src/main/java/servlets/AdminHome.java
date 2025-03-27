package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/adminHome")
public class AdminHome extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		if(email !=null ) {
			if(email.equals("admin@gmail.com")) {
				resp.sendRedirect("admin/adminHome.jsp");
			}
			else {
				resp.sendRedirect("home.jsp");
			}
		}
		else {
			System.out.println("not work");
			resp.sendRedirect("login.jsp");
		}
	}

}
