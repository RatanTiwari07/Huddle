<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<%@ include file="header.jsp"%>

	<!-- 
	
	<div class="container">
		<div class="row" style="margin-top:5px ; margin-left:2px ; margin-right:2px;">
			<form action="./RegisterSrv" method="post"
				class="col-md-6 col-md-offset-3"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">
				
				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Registration Form</h2>
			
				</div>
				<div></div>
				
				<div class="row">
					<div class="form-group col-md-6">
						<label for="first_name">Name : </label>
						<input type="text" id="first_name" name="username" class="form-control" name="first_name" required>
					</div>
					
					<div class="form-group col-md-6">
						<label for="last_name" >Email : </label>
						<input type="email" id="last_name" name="email" class="form-control" name="last_name" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="last_name" >Address : </label>
					<textarea id="last_name" name="address" class="form-control" name="last_name" required></textarea>
				</div>			
				
				<div class="row">
					<div class="form-group col-md-6">
						<label for="last_name">Mobile : </label>
						<input type="number" id="last_name" name="mobile" class="form-control" name="last_name" required>
					</div>
					
					<div class="form-group col-md-6">
						<label for="last_name" >Pin Code : </label>
						<input type="number" id="last_name" name="pincode" class="form-control" name="last_name" required>
					</div>
				</div>
				
				<div class="row">
					<div class="form-group col-md-6">
						<label for="last_name">Password : </label>
						<input type="password" id="last_name" name="password" class="form-control" name="first_name" required>
					</div>
					
					<div class="form-group col-md-6">
						<label for="last_name" >Confirm Password : </label>
						<input type="password" id="last_name" name="confirmPassword" class="form-control" name="last_name" required>
					</div>
				</div>
				
				<div class="row text-center mt-3">
					<div class="col-md-6" style="margin-bottom:2px;">
						<button type="Reset" class="btn btn-danger">Reset</button>
					</div>
					
					<div class="col-md-6">
						<button type="submit" class="btn btn-success">Register</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	-->

	<section class="background-radial-gradient overflow-hidden">
		<div
			class="container px-4 py-5 px-md-5 align-items-center  text-lg-start my-5">
			<div class="row gx-lg-5 align-items-center text-center mb-5">
				<div class="col-lg-6 mb-5 mb-lg-0 position-relative ">
					<div id="radius-shape-1"
						class="position-absolute rounded-circle shadow-5-strong"></div>
					<div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>
					<div class="card bg-glass">
						<div class="card-body  py-5 px-md-5 ">
							<h4 class="mb-4">Registration page</h4>
							<form action="./RegisterSrv" method="post">
								<div class="col-md mb-4">
									<div class="form-floating">

										<%
										
										String message = request.getParameter("message");
										
										if (message != null) {
										%>

										<p style="color: red;">
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
											<input type="text" name="first_name"
												class="form-control small-input" id="floatingInput"
												placeholder="name@example.com" required> <label
												for="floatingInput">Name</label>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="email" name="email"
												class="form-control small-input" id="floatingInput2"
												placeholder="name@example.com"> <label
												for="floatingInput2">Email</label>
										</div>
									</div>
								</div>

								<div class="mb-3">
								
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="3" placeholder="Address : " name="address"></textarea>
								</div>

								<div class="row">
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="number" name="mobile"
												class="form-control small-input" id="floatingInput3"
												placeholder="name@example.com" max="9999999999" min="1000000000" required> <label
												for="floatingInput3">Mobile</label>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="number" name="pincode"
												class="form-control small-input" id="floatingInput4" placeholder="hii" required
												max="999999" min="100000" >
											<label for="floatingInput4">Pincode</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="password" name="password"
												class="form-control small-input" id="floatingInput5"
												placeholder="name@example.com" 
												pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
												title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required> <label
												for="floatingInput5">Password</label>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="password" name="confirmPassword"
												class="form-control small-input" id="floatingInput6" placeholder="hii"  required>
											<label for="floatingInput6">Confirm Password</label>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6 ">
										<button type="reset" data-mdb-button-init data-mdb-ripple-init
											class="btn btn-primary btn-block mb-4 mt-4 ">Reset</button>
									</div>
									<div class="col-md-6 ">
										<button type="submit" data-mdb-button-init
											data-mdb-ripple-init
											class="btn btn-primary btn-block mb-4 mt-4 ms-4">
											Register</button>
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




















