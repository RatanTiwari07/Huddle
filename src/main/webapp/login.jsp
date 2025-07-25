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
	background-image: radial-gradient(650px circle at 0% 0%, hsl(218, 41%, 35%)
		15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%,
		hsl(218, 41%, 19%) 80%, transparent 100%),
		radial-gradient(1250px circle at 100% 100%, hsl(218, 41%, 45%) 15%,
		hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%,
		transparent 100%);
}

#radius-shape-1 {
	height: 220px;
	width: 220px;
	top: -60px;
	left: -130px;
	background: radial-gradient(#44006b, #ad1fff);
	overflow: hidden;
}

#radius-shape-2 {
	border-radius: 38% 62% 63% 37%/70% 33% 67% 30%;
	bottom: -60px;
	right: -110px;
	width: 300px;
	height: 300px;
	background: radial-gradient(#44006b, #ad1fff);
	overflow: hidden;
}

.bg-glass {
	/* height: 550px; */
	width: 90%;
	background-color: hsla(0, 0%, 100%, 0.9) !important;
	backdrop-filter: saturate(200%) blur(25px);
}

.form-outline .form-control {
	height: 55px;
}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>

	<%
	String message = request.getParameter("message");
	%>

	<!--  <div class="container">
		<div class="row">
			<form action="./LoginSrv" method="post"
				class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
				style="border: 2px solid black; border-radius: 10px; background-color: #FFE5CC; padding: 10px;">

				<div style="font-weight: bold;" class="text-center">
					<h2 style="color: green;">Login Form</h2>
				
				</div>
				<div></div>

				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Username</label> <input type="email"
							placeholder="Enter Username" name="username" class="form-control"
							id="last_name" required>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 form-group">
						<label for="password">Password</label> <input type="password"
							placeholder="Enter Password" name="password" class="form-control"
							id="password" required>
					</div>
				</div>
<!--  
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="userrole">Login As</label> <select name="usertype"
							class="form-control" id="userrole" required>
							<option value="customer" selected>CUSTOMER</option>
							<option value="admin">ADMIN</option>
						</select>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 text-centre">
						<button type="submit" class="btn btn-success">Login</button>
					</div>
				</div>

			</form>
		</div>
	</div>-
	
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
							<h4 class="mb-4">Login </h4>
							<form action="./LoginSrv" method="post">
								<div class="col-md mb-4">
									<div class="form-floating">
										%
										
									</div>
								</div>
								<div class="col-md">
									<div class="form-floating">
										<input type="text" 
											class="form-control small-input" id="floatingPassword" name="username"
											placeholder="Password"> <label for="floatingPassword">Username</label>
									</div>
								</div>


								<div class="col-md">
									<div class="form-floating mt-4">
										<input type="password"
											class="form-control small-input" id="floatingPassword" name="password"
											placeholder="Password"> <label for="floatingPassword">Password</label>
									</div>
								</div>

								<button type="submit" 
									data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block mb-4 mt-4 ">LOGIN</button>
						
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section> -->


	<section class="background-radial-gradient overflow-hidden">
		<div
			class="container px-4 py-5 px-md-5 text-center text-lg-start my-5 "
			style="height: 100vh;">
			<div class="row gx-lg-5 align-items-center mb-5">
				<div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
					<h1 class="my-5 display-5 fw-bold ls-tight"
						style="color: hsl(218, 81%, 95%)">
						WELCOME TO <br /> <span style="color: hsl(218, 81%, 75%)">HUBBLE</span>
					</h1>
					<p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
						Thank you very much. At times, he will pardon the just one and, in
						great times, there will be no respite from pains, nor will he
						blame them for their debts, as if from him he had only moderated
						the pain. Which?</p>
				</div>

				<div class="col-lg-6 mb-5 mb-lg-0 position-relative">
					<div id="radius-shape-1"
						class="position-absolute rounded-circle shadow-5-strong"></div>
					<div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

					<div class="card bg-glass">
						<div class="card-body py-5 px-md-5">
							<h4 class="mb-4 text-center">Login</h4>
							<form action="./LoginSrv" method="post">
								<div class="col-md mb-4">
									<div class="form-floating text-center">

										<%
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

								<div class="col-md">
									<div class="form-floating">
										<input type="text" class="form-control small-input"
											id="floatingPassword" name="username" placeholder="Password">
										<label for="floatingPassword">Username</label>
									</div>
								</div>

								<div class="col-md">
									<div class="form-floating mt-4">
										<input type="password" class="form-control small-input"
											id="floatingPassword" name="password" placeholder="Password">
										<label for="floatingPassword">Password</label>
									</div>
								</div>

								<div class="col-md text-center">
									<button type="submit" data-mdb-button-init data-mdb-ripple-init
										class="btn btn-primary  mb-4 mt-4">LOGIN
									</button>
								</div>
								
								<div class="col-md text-center">
									<h5><a href="register.jsp" style="text-decoration:none; color: #088178;">Don't have an account , Register Now !</a></h5>
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