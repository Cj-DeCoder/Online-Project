package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.ProductDTO;

public class ProductDAO {
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
	public static int productsCount() {
		int id = 1;
		try {
			Statement st = getConnection().createStatement();
			ResultSet result = st.executeQuery("select max(id) from products");
			while(result.next()) {
				id = result.getInt(1);
				id +=1;
			}
			return id;
		}
		catch(Exception e) {
			return -1;
		}
	}
	public static int storeProducts(ProductDTO products) throws SQLException {
			PreparedStatement pst = getConnection().prepareStatement("insert into products values (?,?,?,?,?)");
			pst.setInt(1, products.getId());
			pst.setString(2, products.getName());
			pst.setString(3, products.getCategory());
			pst.setDouble(4, products.getPrice());
			pst.setString(5, products.getStatus());
			return pst.executeUpdate();	
	}
	public static ResultSet retriveProducts() throws SQLException{
		Statement st = getConnection().createStatement();
		return st.executeQuery("select * from products");
	}
	public static ResultSet selectUser(int id) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from products where id=? ");
		pst.setInt(1, id);
		return pst.executeQuery();
	}
	public static int updateProducts(ProductDTO products) throws SQLException{
		PreparedStatement pst = getConnection().prepareStatement("update products set name = ?, category = ?, price = ?, status = ? where id=?");
		pst.setString(1, products.getName());
		pst.setString(2, products.getCategory());
		pst.setDouble(3, products.getPrice());
		pst.setString(4, products.getStatus());
		pst.setInt(5, products.getId());
		return pst.executeUpdate();	
	}
	public static ResultSet activeProducts() throws SQLException{
		Statement st = getConnection().createStatement();
		return st.executeQuery("select * from products where status = 'Yes'");
	}
	public static ResultSet searchProducts(String name) throws SQLException{
		PreparedStatement pst = getConnection().prepareStatement("select * from products where name like ? and status = 'Yes'");
		pst.setString(1,"%"+name+"%");
		return pst.executeQuery();
	}
	public static ResultSet searchProductById(int id) throws SQLException{
		PreparedStatement pst = getConnection().prepareStatement("select * from products where id = ?");
		pst.setInt(1, id);
		return pst.executeQuery();
	}
	public static ResultSet selectProductInnerCart(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from products,cart where products.id = cart.product_id and cart.email = ? and cart.address is NULL");
		pst.setString(1, email);
		return pst.executeQuery();
	}
	public static ResultSet selectProductInnerCartBill(String email) throws SQLException {
		PreparedStatement pst = getConnection().prepareStatement("select * from products,cart where products.id = cart.product_id and cart.email = ? and cart.status = 'bill'");
		pst.setString(1, email);
		return pst.executeQuery();
	}
}
