package com.shp.srv;

import java.io.IOException;

import com.shp.beans.AdminBean;
import com.shp.daoImpl.AdminDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminReg
 */
@WebServlet("/AdminReg")
public class AdminReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AdminReg() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String status = null;

		AdminBean admin = new AdminBean(name, address, email, password);
		
		status = new AdminDaoImpl().registerAdmin(admin);

		RequestDispatcher rd = request.getRequestDispatcher("registerAdmin.jsp?message="+status);

		rd.include(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
