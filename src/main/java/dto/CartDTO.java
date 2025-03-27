package dto;

public class CartDTO {
	private String email;
	private int product_id;
	private int quantity;
	private double price;
	private double total;
	private String address;
	private String city;
	private String state;
	private String country;
	private long mobileNumber;
	private String orderDate;
	private String deliveryDate;
	private String paymentMethod;
	private String transactionId;
	private String status;
	public CartDTO(String email, int product_id, int quantity, double price, double total, String address, String city,
			String state, String country, long mobileNumber, String orderDate, String deliveryDate,
			String paymentMethod, String transactionId, String status) {
		super();
		this.email = email;
		this.product_id = product_id;
		this.quantity = quantity;
		this.price = price;
		this.total = total;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.mobileNumber = mobileNumber;
		this.orderDate = orderDate;
		this.deliveryDate = deliveryDate;
		this.paymentMethod = paymentMethod;
		this.transactionId = transactionId;
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
