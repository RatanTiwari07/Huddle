package com.shp.srv;

import java.io.IOException;

import com.shp.beans.ProductBean;
import com.shp.daoImpl.ProductDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProductSrv")
public class UpdateProductSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateProductSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("usertype");
		String userName = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (userType == null || !userType.equals("admin")) {
			response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
			return;
		} else if (userName == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}

		String prodId = request.getParameter("pid");
		String prodName = request.getParameter("name");
		String prodType = request.getParameter("type");
		String prodInfo = request.getParameter("info");
		double prodPrice = Double.parseDouble(request.getParameter("price"));
		int prodQuantity = Integer.parseInt(request.getParameter("quantity"));

		ProductBean product = new ProductBean ();
		product.setProdId(prodId);
		product.setProdInfo(prodInfo);
		product.setProdName(prodName);
		product.setProdPrice(prodPrice);
		product.setProdType(prodType);
		product.setProdQuantity(prodQuantity);

		ProductDaoImpl dao = new ProductDaoImpl();

		String status = dao.updateProductWithoutImage(prodId, product);

		RequestDispatcher rd = request.getRequestDispatcher("updateProduct.jsp?prodid=" + prodId + "&message=" + status);

		rd.forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
