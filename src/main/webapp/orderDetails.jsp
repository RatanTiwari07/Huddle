<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "com.shp.daoImpl.OrderDaoImpl, com.shp.beans.OrderDetails, java.util.List, java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		
		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}
		
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
		
	<div class="text-center" style="font-size: 16px; color: green; font-weight: bold; margin: 0px 20px;"> <h2>Order Details</h2></div>
	
	<div class="container-fluid" >
		<div class="table-responsive">
			<table class="table table-hover table-sm">
				<thead style="background-color: #088152; color: white; font-size: 18px;">
					<tr>
						<td>Picture</td>
						<td>ProductName</td>
						<td>OrderId</td>
						<td>Quantity</td>
						<td>Price</td>
						<td>Time</td>
						<td>Status</td>
					</tr>
				</thead>
				<tbody>
				<%
					OrderDaoImpl orderDao = new OrderDaoImpl();
					List<OrderDetails> orderList = orderDao.getAllOrderDetails(username);
					
					for (OrderDetails order : orderList) {
				%>
					<tr>
						<td><img src="./ShowImage?pid=<%= order.getProductId() %>" style="height:50px; width:50px;"></td>
						<td><%= order.getProdName() %></td>
						<td><%= order.getOrderID() %></td>
						<td><%= order.getQuantity() %></td>
						<td><%= order.getAmount() %></td>
						<td><%= order.getTime() %></td>
						<td class="text-success"><%= order.getShipped() == 0 ? "ORDER PLACED" : "ORDER SHIPPED" %></td>
					</tr>
				<% 
					}
					
					if (orderList.size() == 0) {
				%>
						<tr style="background-color: grey; color: white;">
							<td colspan="7" style="text-align: center;">No Items Available</td>
						</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
		<jsp:include page="footer.html"></jsp:include>
</body>
</html>
















