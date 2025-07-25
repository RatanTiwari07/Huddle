<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		} 
		
		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}
		
		String message = request.getParameter("message");
	 
	 %>
	 
	
	
	<jsp:include page="header.jsp"></jsp:include>
	
	 <!--   <div class="container">
		<div class="row" style="margin-top:5px; margin-right:2px; margin-left:2px;">
			<form action="./RemoveProductSrv" method="post" class="col-md-4 col-md-offset-4"
				style="border:2px solid black; border-radius:10px; padding:10px; background-color:#FFE5CC;">
				<div class="text-center" style="font-weight:bold;">
					<h3 style="color: green;" >Product Deletion Form</h3>
					<!--  
					
						//if (message != null) {
					
							<p style="color : blue;" >her eis msg tag</p>
					 --
				</div>
				
				<div class="row">
					<div class="col-md-12 form-group form-floating mb-3">
						<label for="last_name" style="font-weight:bold;" >Product ID</label>
						<input id="last_name" name="prodid" type="text" class="form-control" placeholder="Enter Product ID" required>
					</div>
				</div>
				<div class="row" style="margin-top: 15px;">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;" >
						<a href="adminViewProduct.jsp" class="btn btn-info">Cancel</a>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-danger">Remove</button>
					</div>
				</div>
			</form>
		</div>
	</div>--->
	
	  <section class="background-radial-gradient overflow-hidden">
    <div class="container px-4 py-5 px-md-5 align-items-center  text-lg-start my-5">
      <div class="row gx-lg-5 align-items-center text-center mb-5">
        <div class="col-lg-6 mb-5 mb-lg-0 position-relative ">
          <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
          <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div> 
          <div class="card bg-glass">
            <div class="card-body  py-5 px-md-5 ">
              <h4 class="mb-4">LOG IN </h4>
              <form>
                <div class="row">
                  <div class="col-md-6 mb-2">
                    <div class="form-floating mb-3">
                      <!--  <input type="email" class="form-control small-input" id="floatingInput" placeholder="name@example.com">
                      <label for="floatingInput">First Name</label>-->
                      
					  <input id="last_name" name="prodid" type="text" class="form-control small-input" placeholder="Enter Product ID" required>
                      <label for="last_name floatingInput" style="font-weight:bold;" >Product ID</label>
                    </div>
                  </div>
                  
                  <div class="row" style="margin-top: 15px;">
					<div class="col-md-6 text-center" style="margin-bottom: 2px;" >
						<a href="adminViewProduct.jsp" class="btn btn-info">Cancel</a>
					</div>
					<div class="col-md-6 text-center">
						<button type="submit" class="btn btn-danger">Remove</button>
					</div>
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















