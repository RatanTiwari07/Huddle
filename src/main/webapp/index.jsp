<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.beans.ProductBean , com.shp.daoImpl.* , java.util.List , java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

	    .shop p {
      vertical-align: middle;
      padding-left: 45.8%;
      position: relative;
      top: -240px;
    }
	
</style>

</head>
<body>
	<%
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String usertype = (String) session.getAttribute("usertype");

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
		message = "Sorry, No products find by search : '" + search + "' or type : '" + type +"' displaying all products";
		productList = prd.getAllProducts();
	}
	
	%>

	<jsp:include page="header.jsp" />

	<div class="text-center"
		style="font-weight: bold; color: black; font-size: 14px;"><%=message%></div>

	<div class="text-center"
		style="font-weight: bold; color: black; font-size: 14px;" id="message"></div>



	<main class="cd__main">
		<div class="container-fluid bg-trasparent p-3" style="position: relative">
			<div class="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3">
			
				<%
				for (ProductBean product : productList) {
					int cartItem = new CartDaoImpl().getCartItemsCount(username, product.getProdId());
				%>
			
				<div class="col hp">
					<div class="card h-100 shadow-sm" >
						<div class="card-image" style="height:250px; white-space:nowrap; text-align:center;">
							<span style="display: inline-block; height:100%; vertical-align: middle;"></span>
							
			            <a href="singleProduct.jsp?prodId=<%=product.getProdId()%>">
              				<img src="./ShowImage?pid=<%=product.getProdId()%>" style="border-radius:10px; verical-align:middle; width:90%; max-height:100%;" alt="product.title"/>
            			</a>
							
						</div>
						<div class="card-body">
							<div class="clearfix mb-3">
								<span class="float-start"><a href="singleProduct.jsp?prodId=<%=product.getProdId()%>"
									class="text-uppercase text-dark"><%=product.getProdName()%></a></span>
								<span class="float-end badge bg-dark" style="padding: 10px;">Rs <%=product.getProdPrice()%>..</span>
							</div>
						
				<%
					String desc = product.getProdInfo();
					desc = desc.substring(0, Math.min(desc.length(), 100));
				%>
							
							<h5 class="card-title">
								<a class="text-decoration-none text-dark" href="singleProduct.jsp?prodId=<%=product.getProdId()%>"><%=desc%>..</a>
							</h5>
							
				<%
					if (cartItem == 0) {
				%>
							
							<div class="d-grid gap-2 my-4">
								<a href="./AddtoCart?uid=<%=username%>&pid=<%=product.getProdId()%>&pqty=1" class="btn btn-warning bold-btn">Add to Cart</a>
							</div>
						
				<%
					}	else {
				%>		
							<div class="d-grid gap-2 my-4">
								<a href="./AddtoCart?uid=<%=username%>&pid=<%=product.getProdId()%>&pqty=1" class="btn btn-danger bold-btn">Remove from Cart</a>
							</div>
				<%
					}
				%>	
						   <!-- <a href="main_Display.jsp" class=" stretched-link"></a> -->
						</div>
					</div>
				</div>
				
				<%
				}
				%>	
			</div>
		</div>
	</main>

	<jsp:include page="footer.html"></jsp:include>

</body>
</html>











