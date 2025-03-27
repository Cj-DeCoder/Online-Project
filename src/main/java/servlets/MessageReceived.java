package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MessageUsDAO;
import dto.MessageUsDTO;
//@WebServlet("/messageReceived")
public class MessageReceived extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		try {
			ResultSet rs =  MessageUsDAO.retriveMessages();
			List<MessageUsDTO> msg = new ArrayList<MessageUsDTO>();
			while(rs.next()) {
				msg.add(new MessageUsDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			req.setAttribute("msg", msg);
			req.getRequestDispatcher("admin/messageReceived.jsp").include(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
