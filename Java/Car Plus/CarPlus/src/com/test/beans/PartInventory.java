package com.test.beans;

public class PartInventory {

	// fields from PartInventory tables
			private int partid;
			private int providerid;
			private int serviceid;
			private String name;
			private String description;
			private String status;
			private float cost;
			private String category;
			private String imagepath;
			
			// constructor
			public PartInventory(int providerid, int serviceid, String name, String description, String status, float cost, String category, String imagepath) {
				this.providerid=providerid;
				this.serviceid=serviceid;
				this.name=name;
				this.description=description;
				this.status=status;
				this.cost=cost;
				this.category=category;
				this.imagepath=imagepath;
			}
			

			public PartInventory() {
				// TODO Auto-generated constructor stub
			}

			// getters and Setters for all the fileds
			public int getPartid() {
				return partid;
			}
			public void setPartid(int partid) {
				this.partid = partid;
			}
			public int getProviderid() {
				return providerid;
			}
			public void setProviderid(int providerid) {
				this.providerid = providerid;
			}
			public int getServiceid() {
				return serviceid;
			}
			public void setServiceid(int serviceid) {
				this.serviceid = serviceid;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getDescription() {
				return description;
			}
			public void setDescription(String description) {
				this.description = description;
			}
			public String getStatus() {
				return status;
			}
			public void setStatus(String status) {
				this.status = status;
			}
			public float getCost() {
				return cost;
			}
			public void setCost(float cost) {
				this.cost = cost;
			}
			public String getCategory() {
				return category;
			}
			public void setCategory(String category) {
				this.category = category;
			}
			public String getImagepath() {
				return imagepath;
			}

			public void setImagepath(String imagepath) {
				this.imagepath = imagepath;
			}

}

