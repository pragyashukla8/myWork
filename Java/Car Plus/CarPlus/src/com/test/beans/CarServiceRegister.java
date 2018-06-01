package com.test.beans;

import java.sql.Date;

public class CarServiceRegister {

	// fields from PartInventory tables
				private int customerid;
				private int providerid;
				private int serviceid;
				private int carid;
				private String carmodel;
				private Date bookingdate;
				private Date updationdate;
				private String status;
				private float cost;
				
				// constructor
				public CarServiceRegister(int customerid, int providerid, int serviceid, int carid, String carmodel, Date bookingdate, Date updationdate, String status, float cost) {
					this.customerid=customerid;
					this.providerid=providerid;
					this.serviceid=serviceid;
					this.carid=carid;
					this.carmodel=carmodel;
					this.bookingdate=bookingdate;
					this.updationdate=updationdate;
					this.status=status;
					this.cost=cost;
				}
				public CarServiceRegister() {
					// TODO Auto-generated constructor stub
				}

				// Geeters and Setters for all fields
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
				public int getCarid() {
					return carid;
				}
				public void setCarid(int carid) {
					this.carid = carid;
				}
				public String getCarmodel() {
					return carmodel;
				}
				public void setCarmodel(String carmodel) {
					this.carmodel = carmodel;
				}
				public Date getBookingdate() {
					return bookingdate;
				}
				public void setBookingdate(Date bookingdate) {
					this.bookingdate = bookingdate;
				}
				public Date getUpdationdate() {
					return updationdate;
				}
				public void setUpdationdate(Date updationdate) {
					this.updationdate = updationdate;
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
}
