package com.shp.srv;

import java.io.IOException;

import com.shp.beans.UserBean;
import com.shp.daoImpl.UserDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterSrv
 */
@WebServlet("/RegisterSrv")
public class RegisterSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegisterSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String status = null;

		if(password != null && password.equals(confirmPassword)) {

			String userName = request.getParameter("first_name");
			Long mobile = Long.parseLong(request.getParameter("mobile"));
			String emailId = request.getParameter("email");
			String address = request.getParameter("address");
			int pincode = Integer.parseInt(request.getParameter("pincode"));

			UserBean user = new UserBean (userName, mobile, emailId, address, pincode, password);

			status = new UserDaoImpl().registerUser(user);
		} else {
			status = "Password not matching";
		}

		RequestDispatcher rd = request.getRequestDispatcher("register.jsp?message="+status);

		rd.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
