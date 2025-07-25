package com.shp.srv;

import java.io.IOException;

import com.shp.daoImpl.CommentsDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FansMessage
 */
@WebServlet("/FansMessage")
public class FansMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FansMessage() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String comment = request.getParameter("comments");

		new CommentsDaoImpl().addComment(email, comment,name);

		String status = "Message sent successfully!";

//		System.out.println("In fans message");

		response.getWriter().print("<script> alert('"+status+"') </script>");

		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
