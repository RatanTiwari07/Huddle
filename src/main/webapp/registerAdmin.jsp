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

/* #radius-shape-1 {
      height: 220px;
      width: 220px;
      top: -60px;
      left: -130px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    }

    #radius-shape-2 {
      border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
      bottom: -60px;
      right: -110px;
      width: 300px;
      height: 300px;
      background: radial-gradient(#44006b, #ad1fff);
      overflow: hidden;
    } */
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
	/* Adjust the height as needed */
	/* font-size: 14px; */
	/* Adjust the font size as needed */
	/* padding: 5px; */
	/* Adjust padding if necessary */
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
	
	String message = (String) request.getParameter("message");
	
	%>

	<jsp:include page="header.jsp"></jsp:include>

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
							<h4 class="mb-4">Register admin page</h4>
							<form>
								<div class="col-md mb-4">
									<div class="form-floating">
										
										<%
											if (message != null) {
										%>			
												
												<p style="color:red;"> <%= message%> </p>
										
										<%
											}
										%>
										
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="email" name="name"
												class="form-control small-input" id="floatingInput"
												placeholder="name@example.com"> <label
												for="floatingInput">Name</label>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="email" name="address"
												class="form-control small-input" id="floatingInput"
												placeholder="name@example.com"> <label
												for="floatingInput">Address</label>
										</div>
									</div>
								</div>

								<div class="col-md">
									<div class="form-floating">
										<input type="email" name="email"
											class="form-control small-input" id="floatingPassword"
											placeholder="Password"> <label for="floatingPassword">E-mail</label>
									</div>
								</div>


								<div class="col-md">
									<div class="form-floating mt-4">
										<input type="password" name="password"
											class="form-control small-input" id="floatingPassword"
											placeholder="Password"> <label for="floatingPassword">Password</label>
									</div>
								</div>



								<button type="submit" formaction="./AdminReg"
									data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block mb-4 mt-4 ">SUBMIT</button>
								<button type="submit" formaction="./adminViewProduct.jsp"
									data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block mb-4 mt-4 ms-4 mr-5">
									ADD</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>