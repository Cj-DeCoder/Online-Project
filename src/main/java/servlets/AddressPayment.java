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

import dao.CartDAO;
import dao.UserDAO;
import dto.UserDTO;

@WebServlet("/addressPayment")
public class AddressPayment extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = (String)req.getSession().getAttribute("email");
		try {
			double total = CartDAO.sumCart(email);
			req.setAttribute("total", total);
			req.getRequestDispatcher("addressPaymentForOrder.jsp").include(req, resp);
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String country = req.getParameter("country");
			String paymentMethod = req.getParameter("paymentMethod");
			String transactionId = req.getParameter("transactionId");
			long mobileNumber = Long.parseLong(req.getParameter("mobileNumber"));
			String status = "bill";
			
			if(address!=null && city!=null && state!=null && country!=null) {
				UserDTO user = new UserDTO(email,mobileNumber,address, city, state, country);
				ArrayList<Object> objects = new ArrayList<Object>();
				objects.add(paymentMethod);
				objects.add(transactionId);
				objects.add(status);
				int res1 = UserDAO.updateAddress(user);
				int res2 = CartDAO.updateAddress(user,objects);
				resp.sendRedirect("bill");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
}
