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

/**
 * Servlet implementation class UpdateToCart
 */
@WebServlet("/UpdateToCart")
public class UpdateToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateToCart() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		String userId = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (userId == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}

		String prodId = request.getParameter("pid");
		int pqty = Integer.parseInt(request.getParameter("pqty"));
		String status = "";

		ProductBean product = new ProductBean();

		CartDaoImpl cart = new CartDaoImpl();
		ProductDaoImpl pdao = new ProductDaoImpl();

		product = pdao.getProductDetails(prodId);

		int availqty = product.getProdQuantity();

		PrintWriter pw = response.getWriter();

		if (availqty < pqty) {

			status = cart.updateProductToCart(userId,prodId,availqty);

			 status += " only " + availqty + " no of " + product.getProdName() + " are available in the shop!"
			 		+ " So, we are adding only " +availqty +"";

			 DemandBean demandBean = new DemandBean(userId, product.getProdId(), pqty-availqty);

			 DemandDaoImpl demand = new DemandDaoImpl();

			 boolean flag = demand.addProduct(demandBean);

			 if (flag)
				 status += "<br>Later, We will MAIL you when "+product.getProdName()+" will be available into the Store!";

			 RequestDispatcher rd = request.getRequestDispatcher("cartDetails.jsp");

			 rd.include(request, response);

			 pw.println("<script> document.getElementById('message').innerHTML=" + status + " </script>");

		} else {

			status = cart.updateProductToCart(userId, prodId, pqty);

			RequestDispatcher rd = request.getRequestDispatcher("cartDetails.jsp");

			rd.include(request, response);

			pw.println("<script> document.getElementById('message').innerHTML=" + status + " </script>");
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
