package com.test.beans;

public class Cart {
	
	// fields from CarInventory tables
	private int cartid;
	private int customerid;
	private int providerid;
	private int serviceid;
	private String itemname;
	private int quantity;
	private float cost;
			
	// constructor
	public Cart(int cartid, int customerid, int providerid, int serviceid, String itemname, int quantity, float cost) {
		this.cartid=cartid;
		this.customerid=customerid;
		this.providerid=providerid;
		this.serviceid=serviceid;
		this.itemname=itemname;
		this.quantity=quantity;
		this.cost=cost;
	}
		public Cart() {
				// TODO Auto-generated constructor stub
	}
		
		public int getCartid() {
			return cartid;
		}
		public void setCartid(int cartid) {
			this.cartid = cartid;
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
	
	

}
