package com.test.beans;

import java.sql.Date;

public class BookingData {
	
	// fields from CarInventory tables
	private int orderid;
	private int customerid;
	private int providerid;
	private int serviceid;
	private String itemname;
	private int quantity;
	private float cost;
	private String orderdate;
			
	// constructor
	public BookingData(int orderid, int customerid, int providerid, int serviceid, String itemname, int quantity, float cost, String orderdate) {
		this.orderid=orderid;
		this.customerid=customerid;
		this.providerid=providerid;
		this.serviceid=serviceid;
		this.itemname=itemname;
		this.quantity=quantity;
		this.cost=cost;
		this.orderdate=orderdate;
	}
		public BookingData() {
				// TODO Auto-generated constructor stub
	}

		public int getOrderid() {
			return orderid;
		}
		public void setOrderid(int orderid) {
			this.orderid = orderid;
		}
		public int getCustomerid() {
			return customerid;
		}
		public void setCustomerid(int customerid) {
			this.customerid = customerid;
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
		public String getItemname() {
			return itemname;
		}
		public void setItemname(String itemname) {
			this.itemname = itemname;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public float getCost() {
			return cost;
		}
		public void setCost(float cost) {
			this.cost = cost;
		}
		public String getOrderdate() {
			return orderdate;
		}
		public void setOrderdate(String orderdate) {
			this.orderdate = orderdate;
		}


}
