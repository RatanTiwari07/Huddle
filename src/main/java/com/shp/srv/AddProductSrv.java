package com.shp.srv;

import java.io.IOException;
import java.io.InputStream;

import com.shp.daoImpl.ProductDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AddProductSrv
 */
@WebServlet("/AddProductSrv")
@MultipartConfig(maxFileSize = 16177215)
public class AddProductSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddProductSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String usertype = (String) session.getAttribute("usertype");

		if (usertype == null || !usertype.equalsIgnoreCase("admin")) {
			response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
			return;
		}

		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login again!");
			return;
		}

		String status = "Product Registration Failed";
		String prodName = request.getParameter("name");
		String prodType = request.getParameter("type");
		String pinfo = request.getParameter("info");
		double pprice = Double.parseDouble(request.getParameter("price"));
		int qty = Integer.parseInt(request.getParameter("quantity"));

		Part part = request.getPart("image");

		InputStream inputStream = part.getInputStream();

		InputStream prodImage = inputStream;

		status = new ProductDaoImpl().addProduct(prodName, prodType, pinfo, pprice, qty, prodImage);

		RequestDispatcher rs = request.getRequestDispatcher("addProduct.jsp?message=" +status);
		rs.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
