package com.test.beans;

public class Services {
	
	// fields from Login tables
		private int serviceid;
		private String servicename;
		private String description;
				
		// constructor
		public Services(String servicename, String description) {
			this.servicename=servicename;
			this.description=description;
			
		}
		public Services() {
			// TODO Auto-generated constructor stub
		}

		// getters and Setters for all the fields
		public int getServiceid() {
			return serviceid;
		}
		public void setServiceid(int serviceid) {
			this.serviceid = serviceid;
		}
		public String getServicename() {
			return servicename;
		}
		public void setServicename(String servicename) {
			this.servicename = servicename;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}

}
