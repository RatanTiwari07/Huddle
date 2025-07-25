<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
	.background-radial-gradient {

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
		}
		
		if (usertype == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}
		
		String message = request.getParameter("message");
	%>
	
	<jsp:include page="header.jsp"></jsp:include>

	<section class="background-radial-gradient overflow-hidden">
    <div class="container px-4 py-5 px-md-5 align-items-center  text-lg-start my-5">
      <div class="row gx-lg-5 align-items-center text-center mb-5">
        <div class="col-lg-6 mb-5 mb-lg-0 position-relative ">
          <!-- <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
          <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div> -->
          <div class="card bg-glass">
            <div class="card-body  py-5 px-md-5 ">
              <h4 class="mb-4">Add Product</h4>
              <form action="./AddProductSrv" method="post" enctype="multipart/form-data">
              
      		<%
				if (message != null) {
			%>
	                <div class="col-md mb-4">
	                  <div class="form-floating">
	                    <p style="color: blue;">
							<%=message%>
						</p>
	                  </div>
	                </div>
			<%
				}
			%>
              
				<div class="col-md">
                  <div class="form-floating">
                    <input type="text" class="form-control small-input" id="floatingPassword"
                      placeholder="Password" name="name">
                    <label for="floatingPassword">Product Name</label>
                  </div>
                </div>
	
				<select class="form-select mt-3" aria-label="Default select example" name="type">
					<option value="mobile">MOBILE</option>
					<option value="tv">TV</option>
					<option value="camera">CAMERA</option>
					<option value="laptop">LAPTOP</option>
					<option value="tablet">TABLET</option>
					<option value="speaker">SPEAKER</option>
					<option value="other">SOME OTHER APPLIANCES</option>
                </select>
	
               <!--   
               		<div class="form-group">
						<label for="desc">Product Description</label>
						<textarea id="desc" name="info" class="form-control" required></textarea>
					</div>
				-->
				
				<div class="mb-3">
                  <label for="exampleFormControlTextarea1" class="form-label" ></label>
                  <textarea class="form-control" name="info" id="exampleFormControlTextarea1" placeholder="Product Description" rows="3"></textarea>
                </div>
           
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-floating">
                      <input type="number" class="form-control small-input" id="floatingUnit"
                        placeholder="name@example.com" name="price">
                      <label for="floatingUnit">Unit Price</label>
                    </div>
                  </div>
                  <div class="col-md-6 ">
                    <div class="form-floating ">
                      <input type="number" class="form-control small-input" id="floatingStock"
                        placeholder="name@example.com" name="quantity">
                      <label for="floatingStock">Stock Quantity</label>
                    </div>
                  </div>
                </div>
              <!--    
              		<div class="row">
						<div class="col-md-12 form-group">
							<label for="img">Product Image</label>
							<input type="file" placeholder="Select Image" name="image" class="form-control" id="img" required>
						</div>
					</div>
				-->
				
				
				
                <div class="mb-3">
                  <label for="formFile" class="form-label"></label>
                  <input class="form-control" type="file" id="formFile" name="image">
                </div>

                <!-- Submit button -->
                
                <div class="row">
                    <div class="col-md-6 ">
		                <button type="reset" data-mdb-button-init data-mdb-ripple-init
		                  class="btn btn-primary btn-block mb-4 mt-4 ">
							Reset
		                </button>
	            	</div>
	            	<div class="col-md-6 ">    
		                <button type="submit" data-mdb-button-init data-mdb-ripple-init
		                  class="btn btn-primary btn-block mb-4 mt-4 ms-4">
		                   Add Product
		                </button>
	                </div>
                </div>
                
	<!--  
                <div class="row ">
                  <div class="col-12">
                    <p class="mb-4">Or continue with</p>
                    <div class="d-flex gap-3 flex-column">
                      <a href="#!" class="btn bsb-btn-xl btn-primary">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                          class="bi bi-google" viewBox="0 0 16 16">
                          <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                        </svg>
                        <span class="ms-2 fs-6 text-uppercase">Sign in With Google</span>
                      </a>
                    </div>
                  </div>
                 </div> -->
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
<!-- 
	<div class="container">
		<div class="row"
			style="margin-top: 5px; margin-right: 2px; margin-left: 2px;">
			<form action="./AddProductSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; padding: 10px; border-radius: 10px; background-color: #FFE5CC;"
				enctype="multipart/form-data">
				<div style="font-weight: bold;" class="text-center">
					<div class="form-group">
						<h2 style="color: green;">Product Add Form</h2>
					
					</div>
					<div class="form-group">
						<label for="pname">Product Name</label>
						<input type="text" Placeholder="Enter product name" name="name"
							class="form-control" id="pname" required>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="ptype">Product Type</label> 
							<select name="type" id="ptype" class="form-control">
								<option value="mobile">MOBILE</option>
								<option value="tv">TV</option>
								<option value="camera">CAMERA</option>
								<option value="laptop">LAPTOP</option>
								<option value="tablet">TABLET</option>
								<option value="speaker">SPEAKER</option>
								<option value="other">SOME OTHER APPLIANCES</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="desc">Product Description</label>
						<textarea id="desc" name="info" class="form-control" required></textarea>
					</div>
					<div class="row">
						<div class="col-md-6 form-group">
							<label for="unprice">Unit Price</label> <input type="number" id="unprice"
								class="form-control" name="price" placeholder="Enter unit price" required>
						</div>
						<div class="col-md-6 form-group">
							<label for="qty">Stock Quantity</label> <input type="number" id="qty"
								class="form-control" name="quantity" placeholder="Enter unit price" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 form-group">
							<label for="img">Product Image</label>
							<input type="file" placeholder="Select Image" name="image" class="form-control" id="img" required>
						</div>
					</div>
					<div class="row text-center">
						<div class="col-md-6 text-center" style="margin-bottom:2px;"> 
						</div>
							<button type="reset" class="btn btn-danger">Reset</button>
						<div class="col-md-6 text-center">
							<button type="submit" class="btn btn-success">Add Product</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>  -->
	
<jsp:include page="footer.html"></jsp:include>

</body>
</html>