<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.beans.ProductBean, com.shp.daoImpl.ProductDaoImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
	.background-radial-gradient {
	height:100vh;
      background-color: hsl(218, 41%, 15%);
      background-image: radial-gradient(650px circle at 0% 0%,
          hsl(218, 41%, 35%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,
          transparent 100%),
        radial-gradient(1250px circle at 100% 100%,
          hsl(218, 41%, 45%) 15%,
          hsl(218, 41%, 30%) 35%,
          hsl(218, 41%, 20%) 75%,
          hsl(218, 41%, 19%) 80%,                                                           
          transparent 100%);
    }

    .bg-glass {
      background-color: hsla(0, 0%, 100%, 0.9) !important;
      backdrop-filter: saturate(200%) blur(25px);
    }

    .row {
      justify-content: center;
    }

    .col-lg-6 {
      display: flex;
      justify-content: center;
    }

    .card {
      width: 100%;
      max-width: 800px;
    }

    .small-input {
      height: 20px;
    }
    
 
    
</style>

</head>

<body>

	<%
	
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");
	String usertype = (String) session.getAttribute("usertype");
	
	if (usertype == null || !usertype.equalsIgnoreCase("admin")) {
		response.sendRedirect("login.jsp?message=Access Denied, Login as ADMIN!");
		return;
	}
	if (username == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		return;
	}
	
	String prodid = request.getParameter("prodid");
	String message = request.getParameter("message");

	ProductBean product = new ProductBean();
	ProductDaoImpl pdao = new ProductDaoImpl();
	product = pdao.getProductDetails(prodid);

	String ptype = product.getProdType();
	
	if (prodid == null || product == null) {
		response.sendRedirect("updateProductById.jsp?message=Please enter a valid product Id");
		return;
	}
		
	%>


	
	

	<jsp:include page="header.jsp"></jsp:include>

<!--  

	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-right: 2px; margin-left: 2px;">
			<form action="./UpdateProductSrv" method="post"
				class="col-md-6 offset-md-3"
				style="border: 2px soli
		
					</div>
					<div class="form-group">
						<label for="desc">Product Description</label>
						<textarea id="desc" name="info"
							class="form-control text-align-left" required></textarea>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="unprice">Unit Price</label> <input type="number" id="unprice"
								class="form-control" value=""
								name="price" placeholder="Enter unit price" required>
						</div>
						<div class="col-md-6 form-group">
							<label for="qty">Stock Quantity</label> <input type="number" id="qty"
								class="form-control" value="<"
								name="quantity" placeholder="Enter unit price" required>
						</div>
					</div>
					<div class="row text-center">
						<div class="col-md-4">
							<button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-success">Update Product</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div> 
	
	-->
	
	<section class="background-radial-gradient overflow-hidden">
	    <div class="container px-4 py-5 px-md-5 align-items-center  text-lg-start my-5">
	      <div class="row gx-lg-5 align-items-center text-center mb-5">
	        <div class="col-lg-6 mb-5 mb-lg-0 position-relative ">
	          <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
	          <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div> 
	          <div class="card bg-glass">
	            <div class="card-body  py-5 px-md-5 ">
	              <h4 class="mb-4">	Product Update Form </h4>				

	              <form action="./UpdateProductSrv" method="post"> 
	              	                <input type="hidden" value=<%=product.getProdId()%> name="pid"
							class="form-control" required>
	                <div class="col-md mb-4">
	                  <div class="form-floating">
		                <%
							if (message != null) {
						%>
							<p style="color: blue;">
								<%=message%>
							</p>
						<%
							}
						%>
	                  </div>
	                </div>

	                <div class="row">
	                  <div class="col-md-6 mb-2">
	                    <div class="form-floating mb-3">
	                      <input type="text" class="form-control small-input" id="floatingPName" name="name" 
	                      	value="<%=product.getProdName()%>" required>
	                      <label for="floatingPName">Product Name</label>
	                    </div>
	                  </div>
	                  <div class="col-md-6 mb-2">
	                    <div class="form-floating mb-3">
						  <select class="form-select " aria-label="Default select example" id="random" name="type" required>
							<option value="mobile" <%="mobile".equalsIgnoreCase(ptype) ? "selected" : ""%>>MOBILE</option>
							<option value="tv" <%="tv".equalsIgnoreCase(ptype) ? "selected" : ""%>>TV</option>
							<option value="camera" <%="camera".equalsIgnoreCase(ptype) ? "selected" : ""%>>CAMERA</option>
							<option value="laptop" <%="laptop".equalsIgnoreCase(ptype) ? "selected" : ""%>>LAPTOP</option>
							<option value="tablet" <%="tablet".equalsIgnoreCase(ptype) ? "selected" : ""%>>TABLET</option>
							<option value="speaker" <%="speaker".equalsIgnoreCase(ptype) ? "selected" : ""%>>SPEAKER</option>
							<option value="other" <%="other".equalsIgnoreCase(ptype) ? "selected" : ""%>>SOME OTHER APPLIANCES</option>
			              </select>
			              <label for="random">Product Name</label>
	                    </div>
	                  </div>
	                </div>
	                
            	    <div class="mb-3">
	                  <textarea class="form-control" name="info" id="exampleF" rows="3"><%=product.getProdInfo()%></textarea>
	                  <label for="exampleF" >Product Description</label>
	                </div>
	                
					<div class="row">
	                  <div class="col-md-6 mb-2">
	                    <div class="form-floating mb-3">
	                      <input type="number" class="form-control small-input" id="floatingUnit" name="name" 
	                      	value="<%=product.getProdQuantity()%>" required>
	                      <label for="floatingUnit">Stock Quantity</label>
	                    </div>
	                  </div>
	                  <div class="col-md-6 mb-2">
	                    <div class="form-floating mb-3">
							<input type="number" class="form-control small-input" id="floatingPrice" name="name" 
	                      	value="<%=product.getProdPrice()%>" required>
	                      <label for="floatingPrice">Unit Price</label>
	                    </div>
	                  </div>
	                </div>
	                
	                <div class="row text-centre">
	                	<div class="col-md-4">
							<button formaction="adminViewProduct.jsp" class="btn btn-danger">Cancel</button>
						</div>
						<div class="col-md-4">
							<button type="submit" class="btn btn-success">Update Product</button>
						</div>
	                </div>
	                
	               </form>
	 
	              </div> 
	            
	            </div>
	          </div>
	        </div>
	      </div>
	</section> 

	
	<jsp:include page="footer.html"></jsp:include>

</body>
</html>

















