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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		
		String html = "<html><h3>Please login</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
		dispatcher.include(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		boolean isauthorised= false;
		//get the username and password from the login form
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		// Authentication of user and password
		Login login= new Login();
		login.setUsername(username);
		login.setPassword(password);
		ApplicationDao dao= new ApplicationDao();
		isauthorised = dao.authenticateLogin(login);
		
		if(isauthorised) {
		
			//set up the HTTP session
			HttpSession session = req.getSession();
			
				
			//set the username as an attribute
			session.setAttribute("username", username);
			System.out.println("Login successfull");
			
			List<Users> userdetail= new ArrayList<Users>();
			List<CarInventory> cardetail= new ArrayList<CarInventory>();
			List<PartInventory> partdetail= new ArrayList<PartInventory>();
			List<Login> logindetail= new ArrayList<Login>();
			List<Users> userdetail1= new ArrayList<Users>();
			List<CarInventory> cardetail1= new ArrayList<CarInventory>();
			List<PartInventory> partdetail1= new ArrayList<PartInventory>();
			List<Login> logindetail1= new ArrayList<Login>();
			List<BookingData> bookingdetail1= new ArrayList<BookingData>();
			List<BookingData> bookingdetail2= new ArrayList<BookingData>();
			List<BookingData> bookingdetail3= new ArrayList<BookingData>();
			
			int caradcount1=0;
			int partadcount1 = 0;
			int totaladcount1=0;
			int carordercount1=0;
			int partordercount1 = 0;
			int totalordercount1=0;
			int customercount1=0;
			int providercount1 = 0;
			
			String caradcount;
			String partadcount;
			String totaladcount;
			String carordercount;
			String partordercount;
			String totalordercount;
			String customercount;
			String providercount;
			
			//collect the carid from screen
			//int carid = Integer.parseInt(req.getParameter("carid"));
			
			//get the username as an attribute
			//String username = (String) session.getAttribute("username");
				
			//Calling ApplicationDao to get userid
			int userid=0;
			userid=dao.getUserID(username);
			//System.out.println("userid" + userid);
					
			if(userid ==0) {
				
				String html = "<html><h3>Cannot find user</h3></html>";
				resp.getWriter().write(html+" ");
						
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
				dispatcher.include(req, resp);
			}
			logindetail= dao.getLogin(username);
			String role = null;
			Iterator<Login> iterator = logindetail.iterator();
			while (iterator.hasNext()) {
				Login login1 = iterator.next();
				role = login1.getUsertype();
			}
			
			//call DAO layer and get all products for search criteria
			userdetail = dao.getUserDetail(userid);
			cardetail = dao.getCarAdUser(userid);
			partdetail = dao.getPartAdUser(userid);
			cardetail1 = dao.getCarDetailAdmin();
			partdetail1 = dao.getPartDetailAdmin();
			logindetail1 = dao.getLoginAdmin();
			caradcount1 = dao.getCaradCount();
			partadcount1 = dao.getPartadCount();
			bookingdetail1 = dao.getBookingbyCustomer(userid);
			bookingdetail2 = dao.getBookingbyProvider(userid);
			bookingdetail3 = dao.getBookingAdmin();
			carordercount1 = dao.getCarorderCount();
			partordercount1 = dao.getPartorderCount();
			customercount1= dao.getCustomerCount();
			providercount1 = dao.getProviderCount();
			totalordercount1 = carordercount1 + partordercount1;
			totaladcount1 = caradcount1 + partadcount1;
			caradcount = String.valueOf(caradcount1);
			partadcount = String.valueOf(partadcount1);
			totaladcount = String.valueOf(totaladcount1);
			carordercount = String.valueOf(carordercount1);
			partordercount = String.valueOf(partordercount1);
			totalordercount = String.valueOf(totalordercount1);
			customercount = String.valueOf(customercount1);
			providercount = String.valueOf(providercount1);
			
			//write the products data back to the client browser
			req.setAttribute("userdetail", userdetail);
			req.setAttribute("partdetail", partdetail);
			req.setAttribute("cardetail", cardetail);
			req.setAttribute("partdetail1", partdetail1);
			req.setAttribute("cardetail1", cardetail1);
			req.setAttribute("logindetail1", logindetail1);
			req.setAttribute("caradcount", caradcount);
			req.setAttribute("partadcount", partadcount);
			req.setAttribute("totaladcount", totaladcount);
			req.setAttribute("carordercount", carordercount);
			req.setAttribute("partordercount", partordercount);
			req.setAttribute("totalordercount", totalordercount);
			req.setAttribute("bookingdetail1", bookingdetail1);
			req.setAttribute("bookingdetail2", bookingdetail2);
			req.setAttribute("bookingdetail3", bookingdetail3);
			req.setAttribute("customercount", customercount);
			req.setAttribute("providercount", providercount);
			
			if(role.equals("Customer")) {
				System.out.println("customerpage");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/customerhome.jsp");
				dispatcher.include(req, resp);
			}
			
			if(role.equals("Provider")) {
				System.out.println("providerpage");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/providerhome.jsp");
				dispatcher.include(req, resp);
			}
			
			if(role.equals("Admin")) {
				System.out.println("adminpage");
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/adminhome.jsp");
				dispatcher.include(req, resp);
			}
			
			
			//forward to home jsp
			//RequestDispatcher dispatcher = req.getRequestDispatcher("/html/adminhome.jsp");
			//dispatcher.include(req, resp);
		}else {
			
			String html = "<html><h3>Invalid User name or password</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
	}

}
