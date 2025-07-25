package com.shp.srv;

import java.io.IOException;
import java.io.PrintWriter;

import com.shp.daoImpl.OrderDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class OrderSer
 */
@WebServlet("/OrderSer")
public class OrderSer extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderSer() {
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

		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}

		double paidAmt = Double.parseDouble(request.getParameter("amount"));
		String status = new OrderDaoImpl().paymentSuccess(username,paidAmt);

		PrintWriter pw = response.getWriter();

		response.setContentType("text/html");

		RequestDispatcher rd = request.getRequestDispatcher("orderDetails.jsp");

		rd.include(request, response);

		pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);

	}

}
