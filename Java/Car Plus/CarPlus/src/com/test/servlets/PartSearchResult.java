package com.test.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.beans.PartInventory;
import com.test.dao.ApplicationDao;

@WebServlet("/partsearchresult")
public class PartSearchResult extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		
		System.out.println("carsearchresult doget.....");
		String criteria = "";
		String search1 = "";
		String search2 = "";
		
		//dispatch the request to login.jsp resource
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		ApplicationDao dao= new ApplicationDao();
		partdetail = dao.searchPart(criteria, search1, search2);
		
		//write the products data back to the client browser
		req.setAttribute("partdetail", partdetail);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/partsearchresult.jsp");
		dispatcher.include(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In partsearchresult post method");
		String criteria = "";
		String search1 = "";
		String search2 = "";
		
		List<PartInventory> partdetail= new ArrayList<PartInventory>();
		ApplicationDao dao= new ApplicationDao();
		int partid = Integer.parseInt(req.getParameter("partid"));
		String name = req.getParameter("name");
		String status = req.getParameter("status");
		Float price = Float.parseFloat(req.getParameter("price"));
		criteria = req.getParameter("pricerange");
		search1 = req.getParameter("categoryoption");
		search2 = req.getParameter("nameoption");
		
		System.out.println("part id view detail :" + partid);
		
		if(search1.equals(null)) {
			search1 = "";
		}
		if(search2.equals(null)) {
			search2 = "";
		}
		System.out.println("criteria " + criteria);
		System.out.println("search1 " + search1);
		System.out.println("search2 " + search2);
		if(criteria.equals("2")) {
			criteria = "Asc";
		}else {
			criteria = "Desc";
		}
		
		if(req.getParameter("search") != null) {
			
			System.out.println("Search button");
			partdetail = dao.searchPart(criteria, search1, search2);
			
			//write the products data back to the client browser
			req.setAttribute("partdetail", partdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/partsearchresult.jsp");
			dispatcher.include(req, resp);
			
		}
		
		if(req.getParameter("refresh") != null) {
			
			System.out.println("refesh button");
			criteria ="";
			search1 = "";
			search2 = "";
			partdetail = dao.searchPart(criteria, search1, search2);
			
			//write the products data back to the client browser
			req.setAttribute("partdetail", partdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/partsearchresult.jsp");
			dispatcher.include(req, resp);
			
		}
		
		if(req.getParameter("viewdetail") != null) {
			
			
			System.out.println("view detail button");
			partdetail = dao.getPartInventory(partid);
			//write the products data back to the client browser
			req.setAttribute("partdetail", partdetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carpartdisplay.jsp");
			dispatcher.include(req, resp);
			
		}
	
	}



}
