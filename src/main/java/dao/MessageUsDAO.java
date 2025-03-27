package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.MessageUsDTO;

public class MessageUsDAO {
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
	public static int insertMessage(MessageUsDTO msg) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("insert into message(email,subject,body) values(?,?,?)");
		pst.setString(1, msg.getEmail());
		pst.setString(2, msg.getSubject());
		pst.setString(3, msg.getBody());
		return pst.executeUpdate();
	}
	public static ResultSet retriveMessages() throws SQLException {
		Statement st = getConnection().createStatement();
		return st.executeQuery("select * from message");
	}
	
}
