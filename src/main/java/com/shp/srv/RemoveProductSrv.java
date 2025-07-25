package com.shp.srv;

import java.io.IOException;

import com.shp.daoImpl.ProductDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveProduct
 */
@WebServlet("/RemoveProductSrv")
public class RemoveProductSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoveProductSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String usertype = (String) session.getAttribute("usertype");
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (usertype == null || !usertype.equalsIgnoreCase("admin")) {
			response.sendRedirect("login.jsp?message=Access Denied, Login as admin!");
		} else if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}

		String prodId = request.getParameter("prodid");

		ProductDaoImpl prodao = new ProductDaoImpl();

		String status = prodao.removeProduct(prodId);

		RequestDispatcher rd = request.getRequestDispatcher("removeProduct.jsp?message=" + status);

		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
