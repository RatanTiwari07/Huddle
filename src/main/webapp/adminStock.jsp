<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.shp.daoImpl.ProductDaoImpl , com.shp.beans.ProductBean, java.util.List, java.util.ArrayList, 
				com.shp.daoImpl.OrderDaoImpl" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<body>

<%
	String userName = (String) session.getAttribute("username");
	String userType = (String) session.getAttribute("usertype");
	String password = (String) session.getAttribute("password");
	
	if (userType == null || !userType.equalsIgnoreCase("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
	}
	
	if (userName==null || password==null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
	}
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="text-center" style="font-weight:bold; font-size:24px; color:green;">Stock Products</div>

<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-hover table-sm">
			<thead style="background-color: #2c6c4b; color:white; font-size:18px;" >
				<tr>
					<th>Image</th>
					<th>Product</th>
					<th>Name</th>
					<th>Type</th>
					<th>Price</th>
					<th>Sold Quantity</th>
					<th>Stock Quantity</th>
				</tr>
			</thead>
			<tbody style="background-color:white; font-size:16px;">
				
				<%
					ProductBean product = new ProductBean ();
					ProductDaoImpl pdao = new ProductDaoImpl();
					
					List<ProductBean> prodList = new ArrayList<ProductBean>();
					
					prodList = pdao.getAllProducts();
					
					for (ProductBean prod : prodList) {
						String name = prod.getProdName();
						name = name.substring(0, Math.min(25, name.length())); 
				%>
						<tr>
							<td><img src="./ShowImage?pid=<%= prod.getProdId() %>" style="width:50px; height:50px;"></td>
							<td><a href="./updateProduct.jsp?prodid=<%=prod.getProdId()%>"><%=prod.getProdId()%></a></td>
							<td><%= name %></td>
							<td><%= prod.getProdType().toUpperCase() %></td>
							<td><%= prod.getProdPrice() %></td>
							<td><%= new OrderDaoImpl().countSoldItems(prod.getProdId()) %></td>
							<td><%= prod.getProdQuantity() %>
							<td>
								<form method="post">
									<button formaction="updateProduct.jsp?prodid=<%=prod.getProdId()%>" type="submit"
											class="btn btn-primary">Update</button>
								</form>
							</td>
							<td>
								<form method="post">
									<button formaction="./RemoveProductSrv?prodid=<%=prod.getProdId()%>" type="submit"
											class="btn btn-danger">Remove</button>
								</form>
							</td>
						</tr>	
				<%
					}
					
					if (prodList.size() == 0) {
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












