package com.test.beans;

import java.util.Date;

public class Users {
	
	// fields Users tables
		private int userID;
		private String fname;
		private String mname;
		private String lname;
		private String contact;
		private String address;
		private String emailid;
		private String gender;
		private String dateofbirth;
		private String role;
		private int serviceid;
		
		// constructor
		public Users(String fname,String mname, String lname, String contact, String address, String emailid, String gender, String dateofbirth, String role, int serviceid  ) {
			this.fname=fname;
			this.mname=mname;
			this.lname=lname;
			this.contact=contact;
			this.address=address;
			this.emailid=emailid;
			this.gender=gender;
			this.dateofbirth=dateofbirth;
			this.role=role;
			this.serviceid=serviceid;
		}
		public Users() {
			// TODO Auto-generated constructor stub
		}

		// Getters and Setters for all fields
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public String getFname() {
			return fname;
		}
		public void setFname(String fname) {
			this.fname = fname;
		}
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getLname() {
			return lname;
		}
		public void setLname(String lname) {
			this.lname = lname;
		}
		public String getContact() {
			return contact;
		}
		public void setContact(String contact) {
			this.contact = contact;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getEmailid() {
			return emailid;
		}
		public void setEmailid(String emailid) {
			this.emailid = emailid;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getDateofbirth() {
			return dateofbirth;
		}
		public void setDateofbirth(String dateofbirth) {
			this.dateofbirth = dateofbirth;
		}
		public String getRole() {
			return role;
		}
		public void setRole(String role) {
			this.role = role;
		}
		public int getServiceid() {
			return serviceid;
		}
		public void setServiceid(int serviceid) {
			this.serviceid = serviceid;
		}
}
