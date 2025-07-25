<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.daoImpl.OrderDaoImpl , com.shp.beans.OrderBean, java.util.List, java.util.ArrayList, 
				 com.shp.daoImpl.UserDaoImpl , com.shp.daoImpl.TransactionDaoImpl"%>

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

	if (userType == null || !userType.equalsIgnoreCase("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
	}

	if (userName == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
	}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="text-center"
		style="font-weight: bold; font-size: 24px; color: green;">Shipped
		Orders</div>

	<div class="container-fluid">
		<div class="table-responsive">
			<table class="table table-hover table-sm">
				<thead
					style="background-color: #700fb7; color: white; font-size: 18px;">
					<tr>
						<th>TransactionId</th>
						<th>ProductId</th>
						<th>Username</th>
						<th>Address</th>
						<th>Quantity</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody style="background-color: white; font-size: 16px;">

					<%
					List<OrderBean> ordList = new OrderDaoImpl().getAllUnshippedOrders();

					for (OrderBean order : ordList) {
						String userId = new TransactionDaoImpl().getUserId(order.getTransactionId());
					%>
					<tr>
						<td><%=order.getTransactionId()%></td>
						<td><a
							href="./updateProduct.jsp?prodid=<%=order.getProductId()%>"><%=order.getProductId()%></a></td>
						<td><%=userId%></td>
						<td><%=new UserDaoImpl().getUserAddr(userId)%></td>
						<td><%=order.getQuantity()%></td>
						<td>READY_TO_SHIP</td>
						<td><a
							href="./ShipmentSrv?orderid=<%=order.getTransactionId()%>&amount=<%=order.getAmount()%>&userid=<%=userId%>&prodid=<%=order.getProductId()%>"
							class="btn btn-success">SHIP NOW</a></td>
			
					</tr>
					<%
					}
					if (ordList.size() == 0) {
					%>
						<tr style="background-color:grey; color:white;" >
							<td class="text-center" colspan="7">No Items Available</td>
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












