package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MessageUsDAO;
import dto.MessageUsDTO;

@WebServlet("/messageUs")
public class MessageUs extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		String subject = req.getParameter("subject");
		String body = req.getParameter("body");
		
		try {
			MessageUsDAO.insertMessage(new MessageUsDTO(0, email, subject, body));
			resp.sendRedirect("messageUs.jsp?msg=valid");
		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect("messageUs.jsp?msg=invalid");
		}
	}
	
}
