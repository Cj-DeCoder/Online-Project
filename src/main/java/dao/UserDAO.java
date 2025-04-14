package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.UserDTO;

public class UserDAO {
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
	public static int saveUser(UserDTO user) throws SQLException {
		PreparedStatement ps = getConnection().prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, user.getName());
		ps.setString(2, user.getEmail());
		ps.setLong(3, user.getMobileNumber());
		ps.setString(4, user.getSecurityQuestion());
		ps.setString(5, user.getAnswer());
		ps.setString(6, user.getPassword());
		ps.setString(7, user.getAddress());
		ps.setString(8, user.getCity());
		ps.setString(9, user.getState());
		ps.setString(10, user.getCountry());
		return ps.executeUpdate();
	}
	public static ResultSet retrive(String email,String password)  {
		try {
			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery("select * from users where email = '"+email+"'and password='"+password+"'");
			return result;
		} catch (SQLException e) {
			System.out.println(1);	
			e.printStackTrace();
			return null;
		}
	}
	public static ResultSet retriveDetails(String email) throws SQLException{
			PreparedStatement pst = getConnection().prepareStatement("select * from users where email = ?");
			pst.setString(1, email);
			return pst.executeQuery();
	}
	public static int forgetPassword(UserDTO user) {
		try {
			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery("select * from users where email='"+user.getEmail()+"'and mobileNumber='"+user.getMobileNumber()+"'and securityQuestion='"+user.getSecurityQuestion()+"'and answer='"+user.getAnswer()+"'");
			int res = 0;
			while(result.next()) {
				res = st.executeUpdate("update users set password = '"+user.getPassword()+"' where email='"+user.getEmail()+"'");
				return res;
			}
			return res;
		}catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	public static int updateAddress(UserDTO user) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update users set address = ?, city = ?, state = ?, country = ?, mobileNumber = ? where email = ? ");
		pst.setString(1, user.getAddress());
		pst.setString(2, user.getCity());
		pst.setString(3, user.getState());
		pst.setString(4, user.getCountry());
		pst.setLong(5, user.getMobileNumber());
		pst.setString(6, user.getEmail());
		return pst.executeUpdate();
	}
	public static ResultSet retriveWithPassword(String email,String oldPassword) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from users where email = ? and password = ?");
		pst.setString(1, email);
		pst.setString(2, oldPassword);
		return pst.executeQuery();
	}
	public static int updateNewPassword(String newPassword,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update users set password = ? where email = ?");
		pst.setString(1, newPassword);
		pst.setString(2, email);
		return pst.executeUpdate();
	}
	public static ResultSet retriveAddress(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select email,mobileNumber,address,city,state,country from users where email = ?");
		pst.setString(1, email);
		return pst.executeQuery();
	}
	public static int updateSecurityQuestion(String securityQuestion,String answer,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update users set securityQuestion = ?, answer = ? where email = ?");
		pst.setString(1, securityQuestion);
		pst.setString(2, answer);
		pst.setString(3, email);
		return pst.executeUpdate();
	}
	public static int updateMobileNumber(long mobileNumber,String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("update users set mobileNumber = ? where email = ?");
		pst.setLong(1, mobileNumber);
		pst.setString(2, email);
		return pst.executeUpdate();
	}
}
