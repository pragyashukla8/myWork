package com.test.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.beans.Login;
import com.test.dao.ApplicationDao;

@WebServlet("/forgetpassword")
public class ForgetPassword extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		//dispatch the request to login.jsp resource
		
				String html = "<html><h3>Please login</h3></html>";
				resp.getWriter().write(html+" ");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/forgetpassword.jsp");
				dispatcher.include(req, resp);
}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		boolean isauthorised= false;
		boolean isupdated =false;
		System.out.println("inside forget password do post method");
		//get the input data from forgetpassword form
		String username = req.getParameter("username");
		String emailid = req.getParameter("emailid");
		String secretquestion = req.getParameter("secretquestion");
		String secretanswer = req.getParameter("secretanswer");
		String newpassword = req.getParameter("newpassword");
		
		System.out.println("username :" + username );
		System.out.println("emailid :" + emailid );
		System.out.println("secretquestion :" + secretquestion );
		System.out.println("secretanswer :" + secretanswer );
		System.out.println("newpassword :" + newpassword );
		
		// Authentication of user 
		Login login= new Login();
		login.setUsername(username);
		login.setEmailid(emailid);
		login.setSecretquestion(secretquestion);
		login.setSecretanswer(secretanswer);
		login.setPassword(newpassword);
		ApplicationDao dao= new ApplicationDao();
		isauthorised = dao.forgetPassword(login);
		
		if(isauthorised) {
		
			isupdated = dao.updateLogin(login);
			if(isupdated) {
				String html = "<html><h3>Password updated Please Login</h3></html>";
				resp.getWriter().write(html+" ");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
				dispatcher.include(req, resp);
			}else {
				//forward to forget password jsp
				String html = "<html><h3>Error: Password not updated</h3></html>";
				resp.getWriter().write(html+" ");
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/html/ForgetPassword.jsp");
				dispatcher.include(req, resp);
			}
			
		}else {
			
			String html = "<html><h3>Invalid User details</h3></html>";
			resp.getWriter().write(html+" ");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/login.jsp");
			dispatcher.include(req, resp);
		}
	}


}
