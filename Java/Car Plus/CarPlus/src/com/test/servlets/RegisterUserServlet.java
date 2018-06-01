package com.test.servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.*;
import com.test.dao.ApplicationDao;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("getting data  from register page");
		boolean iscreated= false;
		// collect all form data
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String secretquestion = req.getParameter("secretquestion");
		String secretanswer = req.getParameter("secretanswer");
		String fname = req.getParameter("fname");
		String mname = req.getParameter("mname");
		String lname = req.getParameter("lname");
		String emailid = req.getParameter("emailid");
		String contact = req.getParameter("contact");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dateofbirth");
		String usertype = req.getParameter("usertypes");
		String carddetail = req.getParameter("carddetail");
		String expiry = req.getParameter("expiry");
		String cardpassword = req.getParameter("cardpassword");
		String dateofbirth = req.getParameter("dateofbirth");
		int serviceid=0;
		int age = Integer.parseInt(req.getParameter("age"));
		
		// fill it up in a Login
		Login login = new Login(username, password,emailid, secretquestion, secretanswer, usertype);
		
		// fill it up in a Users
		Users users = new Users(fname, mname, lname, contact, address, emailid, gender, dateofbirth, usertype, serviceid);

		// fill it up in a Billing data
		BillingData billingdata = new BillingData();
		billingdata.setCarddetails(carddetail);
		billingdata.setExpiry(expiry);
		billingdata.setPassword(cardpassword);

		// call DAO layer 
		ApplicationDao dao = new ApplicationDao();
		// create login
		int  loginrow = dao.createLogin(login);
		
		if (loginrow==0) {
			iscreated = false;
			System.out.println("login not created");
		}else {
			iscreated = true;
			System.out.println("login created");
		}
		
		// register user
		int rows = dao.registerUser(users, billingdata);
		
		if (rows==0) {
			iscreated = false;
			int rowdeleted = dao.deleteLogin(login);
			System.out.println("user not created");
		}else {
			iscreated = true;
			System.out.println("user created");
		}
		
		
		// prepare an information message for user about the success or failure of the operation
		String infoMessage = null;
		if(iscreated){
			String html = "<html><h3>User Registered</h3></html>";
			resp.getWriter().write(html+" ");
			System.out.println("reguster successfull");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
		else{
			String html = "<html><h3>Some Error occured</h3></html>";
			resp.getWriter().write(html+" ");
			System.out.println("register unsuccessfull");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/register.html");
			dispatcher.include(req, resp);
		}

				
	}
	
	public String getHTMLString(String filePath, String message) throws IOException{
		BufferedReader reader = new BufferedReader(new FileReader(filePath));
		String line="";
		StringBuffer buffer = new StringBuffer();
		while((line=reader.readLine())!=null){
			buffer.append(line);
		}
		
		reader.close();
		String page = buffer.toString();
		
		page = MessageFormat.format(page, message);
		
		return page;
		
		
	}
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String html = "<html><h3>Please Register</h3></html>";
		resp.getWriter().write(html+" ");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/register.html");
		dispatcher.include(req, resp);}

	
}
