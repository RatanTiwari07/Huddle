package com.shp.srv;

import java.io.IOException;
import java.io.PrintWriter;

import com.shp.daoImpl.OrderDaoImpl;
import com.shp.daoImpl.UserDaoImpl;
import com.shp.util.MailMessage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ShipmentSrv
 */
@WebServlet("/ShipmentSrv")
public class ShipmentSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShipmentSrv() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 HttpSession session = request.getSession();

		 String usertype = (String) session.getAttribute("usertype");

		 if (usertype == null) {
			 response.sendRedirect("login.jsp?message=Access Denied, Login Again!");
		 }

		 String orderid = request.getParameter("orderid");
		 String prodid = request.getParameter("prodid");
		 String username = request.getParameter("userid");
		 String amount = request.getParameter("amount");
		 String status = new OrderDaoImpl().shipNow(orderid, prodid);

		 String pagename = "shippedItems.jsp";

		 System.out.println( orderid + " " + prodid + " " + username + " " +  amount + " " + status);

		 if ("FAILURE".equalsIgnoreCase(status)) {
			 pagename="unshippedItems.jsp";
		 } else {
			 MailMessage.orderShipped(username, new UserDaoImpl().getFName(username), orderid , amount);
		 }

		 PrintWriter pw = response.getWriter();
		 response.setContentType("text/html");

		 RequestDispatcher rd = request.getRequestDispatcher(pagename);

		 rd.include(request, response);

		 pw.println("<script>document.getElementById('messge').innerHTML="+status+"</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





