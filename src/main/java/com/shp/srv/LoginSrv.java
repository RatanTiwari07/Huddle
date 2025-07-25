package com.shp.srv;

import java.io.IOException;

import com.shp.daoImpl.AdminDaoImpl;
import com.shp.daoImpl.UserDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginSrv
 */
@WebServlet("/LoginSrv")
public class LoginSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		String status = "Login Denied, Invalid username or password";
		
		System.out.println(userName + " " + password );
		
		AdminDaoImpl adminDao = new AdminDaoImpl();
		UserDaoImpl userDao = new UserDaoImpl();

		if (adminDao.isRegistered(userName)) {
			
			status = adminDao.isValidCredentials(userName, password);
			
			if (status.equals("valid")) {

				HttpSession session = request.getSession();

				session.setAttribute("username", userName);
				session.setAttribute("password", password);
				session.setAttribute("usertype", "admin");

				RequestDispatcher rd = request.getRequestDispatcher("adminViewProduct.jsp") ;
				rd.forward(request, response);
				
			} else {
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);
				rd.include(request, response);				
				
			}
			
		} else if (userDao.isRegistered(userName)) {
		
			status = userDao.isValidCredentials(userName, password);
			
			if (status.equals("valid")) {

				HttpSession session = request.getSession();

				session.setAttribute("username", userName);
				session.setAttribute("password", password);
				session.setAttribute("usertype", "customer");

				RequestDispatcher rd = request.getRequestDispatcher("main_Display.jsp") ;
				rd.forward(request, response);
				
			} else {
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);
				rd.include(request, response);				
				
			}
			
		} else {
			
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + "Login Denied ! Email is not yet registered");
			rd.include(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
