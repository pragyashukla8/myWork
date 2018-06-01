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

@WebServlet("/carform")
public class CarForm extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		System.out.println("In car form do get method");
		String html = "<html><h3>Car details</h3></html>";
		resp.getWriter().write(html+" ");
				
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carform.jsp");
		dispatcher.include(req, resp);
}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Users> userdetail= new ArrayList<Users>();
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		List<Login> logindetail= new ArrayList<Login>();
		List<BookingData> bookingdetail1= new ArrayList<BookingData>();
		List<BookingData> bookingdetail2= new ArrayList<BookingData>();
		
		//get the input data from car form
		String description = req.getParameter("description");
		String yearmake = req.getParameter("yearmake");
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		String color = req.getParameter("color");
		String mileage = req.getParameter("mileage");
		String status = req.getParameter("status");
		float kmrun = Float.parseFloat(req.getParameter("kmrun"));
		float price = Float.parseFloat(req.getParameter("price"));
		String imagepath = null;
		if(model.equals("Camry"))
		{
			if(color.equals("Black")) {
				imagepath = "images/camry-black.jpeg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/camry-grey.jpg";
				}else {
					imagepath = "images/camry-white.jpg";
				}
			}
			
		}
		if(model.equals("Civic"))
		{
			if(color.equals("Black")) {
				imagepath = "images/civic-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/civic-grey.jpg";
				}else {
					imagepath = "images/civic-white.jpg";
				}
			}
			
		}
		if(model.equals("Corolla"))
		{
			if(color.equals("Black")) {
				imagepath = "images/corolla-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/corolla-grey.jpg";
				}else {
					imagepath = "images/corolla-white.jpg";
				}
			}
			
		}
		if(model.equals("CRV"))
		{
			if(color.equals("Black")) {
				imagepath = "images/crv-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/crv-grey.jpg";
				}else {
					imagepath = "images/crv-white.jpg";
				}
			}
			
		}
		if(model.equals("K900"))
		{
			if(color.equals("Black")) {
				imagepath = "images/k900-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/k900-grey.jpg";
				}else {
					imagepath = "images/k900-white.jpg";
				}
			}
			
		}
		if(model.equals("Rio"))
		{
			if(color.equals("Black")) {
				imagepath = "images/rio-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/rio-grey.jpg";
				}else {
					imagepath = "images/rio-white.jpg";
				}
			}
			
		}
		if(model.equals("V90"))
		{
			if(color.equals("Black")) {
				imagepath = "images/v90-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/v90-grey.jpg";
				}else {
					imagepath = "images/v90-white.jpg";
				}
			}
			
		}
		if(model.equals("XC60"))
		{
			if(color.equals("Black")) {
				imagepath = "images/xc60-black.jpg";
			}else {
				if(color.equals("Grey")) {
					imagepath = "images/xc60-grey.jpg";
				}else {
					imagepath = "images/xc60-white.jpg";
				}
			}
			
		}

		
		// moving variables for carinventory
		CarInventory carinventory= new CarInventory();
		carinventory.setDescription(description);
		carinventory.setYearmake(yearmake);
		carinventory.setCarmake(make);
		carinventory.setCarmodel(model);
		carinventory.setColor(color);
		carinventory.setMileage(mileage);
		carinventory.setStatus(status);
		carinventory.setKmrun(kmrun);
		carinventory.setCost(price);
		carinventory.setImagepath(imagepath);
		int serviceid = 1;
		carinventory.setServiceid(serviceid);
		//set up the HTTP session
		HttpSession session = req.getSession();
			
		//get the username as an attribute
		String username = (String) session.getAttribute("username");
		
		//Calling ApplicationDao to get userid
		int providerid=0;
		ApplicationDao dao= new ApplicationDao();
		providerid=dao.getUserID(username);
		
		if(providerid ==0) {
			
			String html = "<html><h3>Cannot find user</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}else {
			
			carinventory.setProviderid(providerid);
		}
		
		//Calling ApplicationDao to create a car ad
		int row= dao.addCarInventory(carinventory);
		
		if(row==0) {

			String html = "<html><h3>Some error in creating car ad</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carform.jsp");
			dispatcher.include(req, resp);			
		}
		
		logindetail= dao.getLogin(username);
		String role = null;
		Iterator<Login> iterator = logindetail.iterator();
		while (iterator.hasNext()) {
			Login login = iterator.next();
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
		
		String html = "<html><h3>Car Ad created</h3></html>";
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

