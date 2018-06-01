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

import com.test.beans.CarInventory;
import com.test.beans.Login;
import com.test.beans.PartInventory;
import com.test.dao.ApplicationDao;

@WebServlet("/carsearchresult")
public class CarSearchResult extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse   resp) throws ServletException, IOException {
		
		System.out.println("carsearchresult doget.....");
		String criteria = "";
		String search1 = "";
		String search2 = "";
		String search3 = "";
		
		//dispatch the request to login.jsp resource
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		ApplicationDao dao= new ApplicationDao();
		cardetail = dao.searchCar(criteria, search1, search2, search3);
		
		//write the products data back to the client browser
		req.setAttribute("cardetail", cardetail);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carsearchresult.jsp");
		dispatcher.include(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("In carsearchresult post method");
		String criteria = "";
		String search1 = "";
		String search2 = "";
		String search3 = "";
		List<CarInventory> cardetail= new ArrayList<CarInventory>();
		ApplicationDao dao= new ApplicationDao();
		int carid = Integer.parseInt(req.getParameter("carid"));
		String carmake = req.getParameter("make");
		String carmodel = req.getParameter("model");
		String status = req.getParameter("status");
		Float price = Float.parseFloat(req.getParameter("price"));
		criteria = req.getParameter("pricerange");
		search1 = req.getParameter("modeloption");
		search2 = req.getParameter("makeoption");
		search3 = req.getParameter("coloroption");
		if(search1.equals(null)) {
			search1 = "";
		}
		if(search2.equals(null)) {
			search2 = "";
		}
		System.out.println("criteria " + criteria);
		System.out.println("search1 " + search1);
		System.out.println("search2 " + search2);
		System.out.println("search3 " + search3);
		if(criteria.equals("2")) {
			criteria = "Asc";
		}else {
			criteria = "Desc";
		}
		
		if(req.getParameter("search") != null) {
			
			System.out.println("Search button");
			cardetail = dao.searchCar(criteria, search1, search2, search3);
			
			//write the products data back to the client browser
			req.setAttribute("cardetail", cardetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carsearchresult.jsp");
			dispatcher.include(req, resp);
			
		}
		
		if(req.getParameter("refresh") != null) {
			
			System.out.println("refesh button");
			criteria ="";
			search1 = "";
			search2 = "";
			search3 = "";
			cardetail = dao.searchCar(criteria, search1, search2, search3);
			
			//write the products data back to the client browser
			req.setAttribute("cardetail", cardetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/carsearchresult.jsp");
			dispatcher.include(req, resp);
			
		}
		
		if(req.getParameter("viewdetail") != null) {
			
			System.out.println("view detail button");
			cardetail = dao.getCarInventory(carid);
			//write the products data back to the client browser
			req.setAttribute("cardetail", cardetail);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/html/cardisplay.jsp");
			dispatcher.include(req, resp);
			
		}
	
	}

	
	
}
