package com.test.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.BillingData;
import com.test.beans.Cart;
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/billing")
public class Billing extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int rowinserted=0;
		int rowdeleted =0;
		List<Cart> cartdetail= new ArrayList<Cart>();
		List<Users> userdetail= new ArrayList<Users>();
		List<BillingData> billingdetail= new ArrayList<BillingData>();
		ApplicationDao dao= new ApplicationDao();
		
		int customerid;
		
		//set up the HTTP session
		HttpSession session = req.getSession();
							
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
						
		//Calling ApplicationDao to get userid
		customerid=dao.getUserID(username);
						
		if(customerid ==0) {
							
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
							
		   	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		// Getting current date 
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		Date dateWithoutTime = cal.getTime();
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		String orderdate = df.format(dateWithoutTime);
		System.out.println("orderdate" + orderdate);
		
		//creating order
		rowinserted = dao.addBookingData(orderdate, customerid);
		
		if(rowinserted == 0) {
			
			userdetail = dao.getUserDetail(customerid);
			cartdetail = dao.getCartUser(customerid);
			billingdetail = dao.getBillingDetail(customerid);
			
			float subtotal1 = 0;
			float tax1 = 0;
			float total1 = 0;
			
			Iterator<Cart> iterator = cartdetail.iterator();
			while (iterator.hasNext()) {
			
				Cart cart = iterator.next();
				subtotal1 = subtotal1 + (cart.getQuantity() * cart.getCost());
			}
			
			tax1 = (float) (subtotal1 * .1);
			total1 = subtotal1 + tax1;
			
			System.out.println("subtotal1 " + subtotal1);
			System.out.println("tax1 " + tax1);
			System.out.println("total1 " + total1);
			
			String subtotal = String.valueOf(subtotal1);
			String tax = String.valueOf(tax1);
			String total = String.valueOf(total1);
			System.out.println("total " + total);
			
			req.setAttribute("userdetail", userdetail);
			req.setAttribute("cartdetail", cartdetail);
			req.setAttribute("billingdetail", billingdetail);
			req.setAttribute("subtotal", subtotal);
			req.setAttribute("tax", tax);
			req.setAttribute("total", total);
			
			String html = "<html><h3>Some Error occured please try again</h3></html>";
			resp.getWriter().write(html+" ");
							
		   	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/billingpage.jsp");
			dispatcher.include(req, resp);
		}else {
		
			rowdeleted = dao.deleteCartBooking(customerid);
		
			if(rowdeleted == 0) {
			
				userdetail = dao.getUserDetail(customerid);
				cartdetail = dao.getCartUser(customerid);
				billingdetail = dao.getBillingDetail(customerid);
			
				float subtotal1 = 0;
				float tax1 = 0;
				float total1 = 0;
			
				Iterator<Cart> iterator = cartdetail.iterator();
				while (iterator.hasNext()) {
			
					Cart cart = iterator.next();
					subtotal1 = subtotal1 + (cart.getQuantity() * cart.getCost());
				}
			
				tax1 = (float) (subtotal1 * .1);
				total1 = subtotal1 + tax1;
			
				System.out.println("subtotal1 " + subtotal1);
				System.out.println("tax1 " + tax1);
				System.out.println("total1 " + total1);
			
				String subtotal = String.valueOf(subtotal1);
				String tax = String.valueOf(tax1);
				String total = String.valueOf(total1);
				System.out.println("total " + total);
			
				req.setAttribute("userdetail", userdetail);
				req.setAttribute("cartdetail", cartdetail);
				req.setAttribute("billingdetail", billingdetail);
				req.setAttribute("subtotal", subtotal);
				req.setAttribute("tax", tax);
				req.setAttribute("total", total);
			
				String html = "<html><h3>Some Error occured please try again</h3></html>";
				resp.getWriter().write(html+" ");
							
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/billingpage.jsp");
				dispatcher.include(req, resp);
			}else{
				
			
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/summary.jsp");
				dispatcher.include(req, resp);
			}	
		}
	}	
}
