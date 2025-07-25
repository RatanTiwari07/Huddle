package com.shp.srv;

import java.io.IOException;
import java.sql.Timestamp;

import com.shp.daoImpl.CommentsDaoImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommentsSrv
 */
@WebServlet("/CommentsSrv")
public class CommentsSrv extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		href="./CommentsSrv?id=<%=comment.getEmail()%>"

		String email = request.getParameter("id");
		String time = request.getParameter("com_time");

		Timestamp ts = Timestamp.valueOf(time);

		new CommentsDaoImpl().deleteComment(email , ts);

		RequestDispatcher rs = request.getRequestDispatcher("comments.jsp?message=" + "comment deleted succesfully");
		rs.include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
