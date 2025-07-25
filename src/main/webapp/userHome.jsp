<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.beans.ProductBean , com.shp.daoImpl.* , java.util.List , java.util.ArrayList"%>

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
		response.sendRedirect("login.jsp?message=Session Expired ! Login again");
	}

	String search = request.getParameter("search");
	String type = request.getParameter("type");

	ProductDaoImpl prd = new ProductDaoImpl();
	List<ProductBean> productList = new ArrayList<ProductBean>();

	String message = "All Products";

	if (search != null) {
		productList = prd.searchAllProducts(search);
		message = "Showing products for '" + search + "'";
	} else if (type != null) {
		productList = prd.getAllProductsByType(type);
		message = "Showing products by '" + type + "'";
	} else {
		productList = prd.getAllProducts();
	}

	if (productList.isEmpty()) {
		message = "Sorry, No products find by search '" + search + "' displaying all products";
	}
	%>

	<jsp:include page="header.jsp" />
 
	<div style=" font-weight: bold; color: black; font-size: 14px; text-align:center;"><%=message%></div>

	<div style="font-weight: bold; color: black; font-size: 14px; text-align:center;" id="message"></div>

	<div class="container">
		<div class="row text-centre">

			<%
			for (ProductBean product : productList) {
				int cartItem = new CartDaoImpl().getCartItemsCount(username,product.getProdId());
			%>

			<div class="col-sm-4" style="height: 350px;">
				<div class="thumbnail">

					<img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product" style="max-width: 180px; height: 150px">
					<p class="productname"><%=product.getProdName()%>
					</p>
					<%
					String desc = product.getProdInfo();
					desc = desc.substring(0, Math.min(desc.length(), 100));
					%>
					<p class="productinfo"><%=desc%></p>
					<p class="price">Rs <%=product.getProdPrice()%>.. </p>
					
					<form method="post">
					
						<% 
							if(cartItem == 0)
							{
						%>
						
						<button type="submit" formaction="./AddtoCart?uid=<%=username%>&pid=<%=product.getProdId()%>&pqty=1"
								class="btn btn-success">Add To Cart</button>
						&nbsp;&nbsp;&nbsp;
						
						<button type="submit" formaction="./AddtoCart?uid=<%=username%>&pid=<%=product.getProdId()%>&pqty=1" 
								class="btn btn-primary">Buy Now</button>
						
						<% 
							} else {
						%> 
						
						<button type="submit" formaction="./AddtoCart?uid=<%=username%>&pid=<%=product.getProdId()%>&pqty=1"
								class="btn btn-danger">Remove From Cart</button>
						
						<button type="submit" formaction="cartDetails.jsp" class="btn btn-success">CheckOut</button>
						
						<%	
							} 
						%>
					</form>
					
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
<jsp:include page="footer.html"></jsp:include>
</body>
</html>