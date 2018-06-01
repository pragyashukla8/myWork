package com.test.beans;

public class Login {

	// fields from Login tables
	private String username;
	private String password;
	private String emailid;
	private String secretquestion;
	private String secretanswer;
	private String usertype;
	
	// constructor
	public Login(String username, String password, String emailid, String secretquestion, String secretanswer, String usertype) {
		this.username=username;
		this.password=password;
		this.emailid=emailid;
		this.secretquestion=secretquestion;
		this.secretanswer=secretanswer;
		this.usertype=usertype;
	}
	public Login() {
		// TODO Auto-generated constructor stub
	}

	// getters and setters for all the fields in Logiin Table
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getSecretquestion() {
		return secretquestion;
	}
	public void setSecretquestion(String secretquestion) {
		this.secretquestion = secretquestion;
	}
	public String getSecretanswer() {
		return secretanswer;
	}
	public void setSecretanswer(String secretanswer) {
		this.secretanswer = secretanswer;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
		
}
