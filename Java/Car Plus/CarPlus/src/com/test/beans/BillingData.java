package com.test.beans;

public class BillingData {
	
	// fields from Login tables
		private int userid;
		private String carddetails;
		private String expiry;
		private String password;
		
		// constructor
		public BillingData(int userid, String carddetails, String expiry, String password) {
			this.userid=userid;
			this.carddetails=carddetails;
			this.expiry=expiry;
			this.password=password;
			
		}
		public BillingData() {
			// TODO Auto-generated constructor stub
		}

		// Getters and Setters for all the fields
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getCarddetails() {
			return carddetails;
		}
		public void setCarddetails(String carddetails) {
			this.carddetails = carddetails;
		}
		public String getExpiry() {
			return expiry;
		}
		public void setExpiry(String expiry) {
			this.expiry = expiry;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}

}
