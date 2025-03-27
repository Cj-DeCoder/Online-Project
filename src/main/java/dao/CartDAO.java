package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.UserDTO;


public class CartDAO {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","root");
			return con;
		}
		catch(ClassNotFoundException| SQLException e) {
			return null;
 		}    
	}
	public static ResultSet verifyCart(int product_id, String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from cart where product_id = ? and email = ? and address is NULL");
		pst.setInt(1, product_id);
		pst.setString(2, email);
		return pst.executeQuery();
	}
	public static int updateCart(double cart_total,int quantity,int product_id,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update cart set total=? ,quantity=? where product_id=? and email=? and address is NULL");
		pst.setDouble(1, cart_total);
		pst.setInt(2, quantity);
		pst.setInt(3, product_id);
		pst.setString(4, email);
		return pst.executeUpdate();
	}
	public static int insertCart(String email,int product_id,int quantity,double price,double total) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("insert into cart (email,product_id,quantity,price,total) values(?,?,?,?,?)");
		pst.setString(1, email);
		pst.setInt(2, product_id);
		pst.setInt(3, quantity);
		pst.setDouble(4, price);
		pst.setDouble(5, total);
		return pst.executeUpdate();
	}
	public static double sumCart(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select sum(total) from cart where email = ? and address is NULL");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		int total = 0;
		while(rs.next()) {
			total = rs.getInt(1);
		}
		return total;
	}
	public static double sumCartBill(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select sum(total) from cart where email = ? and status='bill'");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		int total = 0;
		while(rs.next()) {
			total = rs.getInt(1);
		}
		return total;
	}
	public static int removeCart(String email,int product_id) {
		try {
			PreparedStatement pst = getConnection().prepareStatement("delete from cart where email = ? and product_id = ? and address is NULL");
			pst.setString(1, email);
			pst.setInt(2, product_id);
			return pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}	
	}
	public static int updateAddress(UserDTO user,ArrayList<Object> ob) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update cart set address = ?, city = ?, state = ?, country = ?, mobileNumber = ?,orderDate = now(),deliveryDate = DATE_ADD(orderDate, INTERVAL 7 DAY), paymentMethod = ?, transactionId = ?, status = ? where email = ? and address is NULL");
		pst.setString(1, user.getAddress());
		pst.setString(2, user.getCity());
		pst.setString(3, user.getState());
		pst.setString(4, user.getCountry());
		pst.setLong(5, user.getMobileNumber());
		pst.setString(6,(String)ob.get(0));
		pst.setString(7,(String)ob.get(1));
		pst.setString(8,(String)ob.get(2));
		pst.setString(9, user.getEmail());
		return pst.executeUpdate();
	}
	public static ResultSet billDetails(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("SELECT * FROM onlineshopping.users ,onlineshopping.cart where users.email = cart.email and cart.email = ? and cart.status='bill'");
		pst.setString(1, email);
		return pst.executeQuery();
	}
	public static int updateCartStatus(String email,String status) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update cart set status = ? where email = ? and status = 'bill'");
		pst.setString(1, status);
		pst.setString(2, email);
		return pst.executeUpdate();
	}
	public static ResultSet retriveOrderDetails(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from onlineshopping.cart inner join onlineshopping.products where cart.product_id = products.id and cart.email = ? and cart.orderDate is not NULL order by orderDate desc");
		pst.setString(1, email);
		return pst.executeQuery();
	}
	public static ResultSet ordersReceived() throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from onlineshopping.cart inner join onlineshopping.products where cart.product_id = products.id and cart.orderDate is not NULL and cart.status = 'processing'");
		return pst.executeQuery();
	}
	public static ResultSet ordersCancelled() throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from onlineshopping.cart inner join onlineshopping.products where cart.product_id = products.id and cart.orderDate is not NULL and cart.status = 'cancelled'");
		return pst.executeQuery();
	}
	public static ResultSet ordersDelivered() throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from onlineshopping.cart inner join onlineshopping.products where cart.product_id = products.id and cart.orderDate is not NULL and cart.status = 'delivered'");
		return pst.executeQuery();
	}
	public static int updateCartStatusToCancel(String status, int pId,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update cart set status = ? where product_id = ? and email = ? and address is not NULL	");
		pst.setString(1, status);
		pst.setInt(2, pId);
		pst.setString(3, email);
		return pst.executeUpdate();
	}
	public static int updateCartStatusToDelivered(String status, int pId,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update cart set status = ? where product_id = ? and email = ? and address is not NULL	");
		pst.setString(1, status);
		pst.setInt(2, pId);
		pst.setString(3, email);
		return pst.executeUpdate();
	}
}
