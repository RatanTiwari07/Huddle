<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.shp.daoImpl.CommentsDaoImpl , com.shp.beans.CommentsBean , java.util.List , java.util.ArrayList " %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
	String userName = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("usertype");
	String password = (String) session.getAttribute("password");
	
	String message = request.getParameter("message");
	
	if (userType == null || !userType.equalsIgnoreCase("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
		return;
	}
	
	if (userName==null || password==null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
	} 
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="text-center" style="font-weight:bold; font-size:24px; color:green;">Comments</div>



<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-hover table-sm">
			<thead style="background-color: #2c6c4b; color:white; font-size:18px;" >
				<tr>
					<th class="text-center" >Time</th>
					<th class="text-center" >Email</th>
					<th class="text-center" colspan=3 >Comment</th>
					<th class="text-right" >Action</th>
				</tr>
			</thead>
			<tbody style="background-color:white; font-size:16px;">
				
				<% 
					List<CommentsBean> comList = new ArrayList<CommentsBean>();
					
					comList = new CommentsDaoImpl().getAllComments();
				
					if (comList.size() == 0) {
						%>
								<tr style="background-color: grey; color: white;">
									<td colspan="7" style="text-align: center;">No Items Available</td>
								</tr>
						<%
					} else {			
					for (CommentsBean comment : comList) {
					
				%>
						<tr>
							<td><%= comment.getComment_date()%></td>
							<td><a href="www.google.com"><%=comment.getEmail()%></a></td>
							<td colspan=3 ><%= comment.getComment() %></td>
							<td class="text-right"><a href="./CommentsSrv?id=<%=comment.getEmail()%>&com_time=<%=comment.getComment_date()%>" class="btn btn-success">Delete</a></td>
						</tr>	
				<%
						}
					}
				%>
				
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="footer.html"></jsp:include>

</body>
</html>