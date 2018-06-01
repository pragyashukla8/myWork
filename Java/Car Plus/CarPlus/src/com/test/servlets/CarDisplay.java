package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.BookingData;
import com.test.beans.CarInventory;
import com.test.beans.Cart;
import com.test.beans.Login;
import com.test.beans.PartInventory;
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/cardisplay")
public class CarDisplay extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In car display dopost method");
		List<Users> userdetail= new ArrayList<Users>();
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		List<Login> logindetail= new ArrayList<Login>();
		List<BookingData> bookingdetail1= new ArrayList<BookingData>();
		List<BookingData> bookingdetail2= new ArrayList<BookingData>();
		int rowinserted =0;
		int carid = Integer.parseInt(req.getParameter("carid"));
		String description = req.getParameter("description");
		String yearmake = req.getParameter("yearmake");
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		String color = req.getParameter("color");
		String mileage = req.getParameter("mileage");
		String status = req.getParameter("status");
		float kmrun = Float.parseFloat(req.getParameter("kmrun"));
		float price = Float.parseFloat(req.getParameter("price"));
		
		// moving variables for cart
		ApplicationDao dao= new ApplicationDao();
		Cart cart= new Cart();
		List<CarInventory> cardetail1= new ArrayList<CarInventory>();
		
		cardetail1= dao.getCarInventory(carid);
		
		Iterator<CarInventory> iterator = cardetail1.iterator();
		while (iterator.hasNext()) {
			CarInventory carinventory = iterator.next();
			cart.setProviderid(carinventory.getProviderid());
			cart.setServiceid(carinventory.getServiceid());
			cart.setItemname(carinventory.getCarmodel());
			cart.setCost(carinventory.getCost());
		}
		
		cart.setQuantity(1);
		
		//set up the HTTP session
		HttpSession session = req.getSession();
					
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
				
		//Calling ApplicationDao to get userid
		int customerid=0;
		customerid=dao.getUserID(username);
				
		if(customerid ==0) {
					
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
					
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}else {
					
			cart.setCustomerid(customerid);
		}
		
		// Updating car detail 
		rowinserted = dao.addCart(cart);
		
		if(rowinserted ==0) {
			String html = "<html><h3>Error: cart not updated</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		
		logindetail= dao.getLogin(username);
		String role = null;
		Iterator<Login> iterator1 = logindetail.iterator();
		while (iterator1.hasNext()) {
			Login login = iterator1.next();
			role = login.getUsertype();
		}
		//write the products data back to the client browser
		int userid=0;
		userid=dao.getUserID(username);
		//System.out.println("userid" + userid);
				
		if(userid ==0) {
			
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
					
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		
		//call DAO layer and get all products for search criteria
		userdetail = dao.getUserDetail(userid);
		cardetail = dao.getCarInventory(userid);
		partdetail = dao.getPartAdUser(userid);
		bookingdetail1 = dao.getBookingbyCustomer(userid);
		bookingdetail2 = dao.getBookingbyProvider(userid);
				
		//write the products data back to the client browser
		req.setAttribute("userdetail", userdetail);
		req.setAttribute("partdetail", partdetail);
		req.setAttribute("cardetail", cardetail);
		req.setAttribute("bookingdetail1", bookingdetail1);
		req.setAttribute("bookingdetail2", bookingdetail2);
				
				
		String html = "<html><h3>Added to Cart</h3></html>";
		resp.getWriter().write(html+" ");
				
		if(role.equals("Customer")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerhome.jsp");
			dispatcher.include(req, resp);
		}
		if(role.equals("Provider")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/providerhome.jsp");
			dispatcher.include(req, resp);
		}
		
	}


}
