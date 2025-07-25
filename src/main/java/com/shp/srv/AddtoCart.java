package com.shp.srv;

import java.io.IOException;
import java.io.PrintWriter;

import com.shp.beans.DemandBean;
import com.shp.beans.ProductBean;
import com.shp.daoImpl.CartDaoImpl;
import com.shp.daoImpl.DemandDaoImpl;
import com.shp.daoImpl.ProductDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddtoCart() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String username = (String) session.getAttribute("username");
		String usertype = (String) session.getAttribute("usertype");
		String password = (String) session.getAttribute("password");

		if(username == null || password == null || usertype == null || !usertype.equalsIgnoreCase("customer")) {
			response.sendRedirect("login.jsp?message=You must login to continue");
			return;
		}
		
		System.out.println("I am here");

		String userId  = username;
		String prodId = request.getParameter("pid");
		int pQty = Integer.parseInt(request.getParameter("pqty"));

		CartDaoImpl cart = new CartDaoImpl();

		ProductDaoImpl productdao = new ProductDaoImpl();

		ProductBean product = productdao.getProductDetails(prodId);

		String status = null;

		int availQty = product.getProdQuantity();

		int cartQty = cart.getProductCount(userId, prodId);

		pQty += cartQty;

		PrintWriter pw = response.getWriter();

		response.setContentType("text/html");

		if (pQty == cartQty) {

			status = cart.removeProductFromCart(userId, prodId);

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

			rd.include(request, response);

			pw.println ("<script> document.getElementById('message').innerHTML='" + status + "' </script>");

		} else if (availQty < pQty) {

			if (availQty == 0) {
				status = "Product is out of stock";
			} else {

				cart.updateProductToCart(userId, prodId, availQty);

				status = "only " + availQty + " no of " + product.getProdName() + " are available in the shop! So, we are "
						+ "adding only " + availQty + " no of products into your cart " + "";
			}

			DemandBean demandBean = new DemandBean (userId , prodId , pQty - availQty);

			DemandDaoImpl demand = new DemandDaoImpl ();

			boolean flag = demand.addProduct(demandBean);

			if (flag) {
				status += "<br>Later, We will MAIL you when " + product.getProdName() + " will be available in the shop!";
			}
			
			pw.println ("<script> document.getElementById('message').innerHTML='" + status + "' </script>");

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

			rd.include(request, response);


		} else {

			status = cart.updateProductToCart(userId, prodId, pQty);

			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

			rd.include(request, response);

			pw.println ("<script> document.getElementById('message').innerHTML='" + status + "' </script>");

		}
		
		System.out.println("I am here");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
