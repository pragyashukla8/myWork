package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
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
import com.test.beans.Login;
import com.test.beans.PartInventory;
import com.test.beans.Users;
import com.test.dao.ApplicationDao;

@WebServlet("/accountedit")
public class AccountEdit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("In car Details dopost method");
		List<Users> userdetail= new ArrayList<Users>();
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		List<Login> logindetail= new ArrayList<Login>();
		List<BookingData> bookingdetail1= new ArrayList<BookingData>();
		List<BookingData> bookingdetail2= new ArrayList<BookingData>();
		
		int rowupdateduser =0;
		int rowupdatedlogin =0;
		String contact = req.getParameter("contact");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		//set up the HTTP session
		HttpSession session = req.getSession();
					
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
				
		//Calling ApplicationDao to get userid
		int userid=0;
		ApplicationDao dao= new ApplicationDao();
		userid = dao.getUserID(username);
				
		if(userid ==0) {
					
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
					
	    	RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		// Updating car detail 
		rowupdateduser = dao.updateUser(contact, email, address, userid);
		
		if(rowupdateduser ==0) {
			String html = "<html><h3>Error: Userdetail not updates</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		rowupdatedlogin = dao.updateLoginEmail(email, username);
		
		if(rowupdatedlogin ==0) {
			String html = "<html><h3>Error: Userdetail not updates</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		
		logindetail= dao.getLogin(username);
		String role = null;
		Iterator<Login> iterator = logindetail.iterator();
		while (iterator.hasNext()) {
			Login login = iterator.next();
			role = login.getUsertype();
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
		
		
		String html = "<html><h3>User details updated</h3></html>";
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
