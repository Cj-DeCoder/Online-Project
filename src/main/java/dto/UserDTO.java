package dto;

public class UserDTO {
	private String name;
	private String email;
	private Long mobileNumber;
	private String securityQuestion;
	private String answer;
	private String password;
	private String address;
	private String city;
	private String state;
	private String country;
	
	public UserDTO(String name, String email, Long mobileNumber, String securityQuestion, String answer,
			String password, String address, String city, String state, String country) {
		super();
		this.name = name;
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.password = password;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
	}
	
	public UserDTO(String name, String email, Long mobileNumber, String securityQuestion, String answer,
			String password) {
		this(name, email, mobileNumber, securityQuestion, answer, password, "", "", "", "");
	}
	

	public UserDTO(String email, Long mobileNumber, String securityQuestion, String answer, String password) {
		this("", email, mobileNumber, securityQuestion, answer, password);
	}
	
	public UserDTO(String address, String city, String state, String country) {
		super();
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
	}
	
	public UserDTO(String email, Long mobileNumber, String address, String city, String state, String country) {
		super();
		this.email = email;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(Long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getSecurityQuestion() {
		return securityQuestion;
	}
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPassword() {
		return SecurePasswordHashing.hashPassword(password);
	}
	public void setPassword(String password) {
		this.password = password;
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
}
