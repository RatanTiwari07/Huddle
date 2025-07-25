package com.shp.srv;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CallBack
 */
@WebServlet("/CallBack")
public class CallBack extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CallBack() {
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("We came in callback servlet");
		
		String code = (String) request.getParameter("code");
		
		System.out.println("In callback servlet : " + code);
		
		

//		response.sendRedirect("https://accounts.google.com/o/oauth2/token?code=code&client_id=130847715672-6el7dig21gn5n7ar5j1g098ep6b8u45h.apps.googleusercontent.com&client_secret=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&redirect_uri=http://localhost:8080/Shopping-Cart/CallBackSec&grant_type=authorization_code");
		
		response.sendRedirect("trial.jsp?code=" + code);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
