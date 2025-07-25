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
	/* 
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Login Again, Session Expired!");
		}
	*/
	String dAmt = request.getParameter("amount");
	double amount = 0;

	if (dAmt != null) {
		amount = Double.parseDouble(dAmt);
	}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<!--  <div class="container">
		<div class="row"
			style="margin-top: 5px; margin-left: 2px; margin-right: 2px">
			<form action="./OrderSer" method="post"
				class="col-md-6 col-md-offset-3"
				style="background-color: #FFE5CC; padding: 10px; border: 2px solid black; border-radius: 10px;">

				<div class="text-center" style="font-weight: bold;">
					<div class="form-group">
						<img src="images/noimage.jpg" height="50px" width="50px" alt="Payment Processed">
						<h2 style="color: green">Credit Card Payment</h2>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 form-group">
						<label for="name">Name of Card Holder</label> <input id="name"
							required placeholder="Enter Card Holder Name" type="text"
							name="cardname" class="form-control">
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 form-group">
						<label for="number">Enter Card Number</label> <input id="number"
							required value="4242-4242-4242" type="number"
							name="cardnumber" class="form-control">
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 form-group">
						<label for="number">Expiry Month</label> <input id="number"
							required size="2" type="number" name="expmonth" min="00" max="12"
							class="form-control">
					</div>
					<div class="col-md-6 form-group">
						<label for="number">Expiry Year</label> <input id="number"
							required size="4" type="number" name="expyear" min="00" max="12"
							class="form-control">
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 form-group">
						<label for="number">Enter CVV</label> <input id="number" required
							size="2" placeholder="123" type="number" name="cvv" size="3"
							min="100" max="999" class="form-control"> <input
							type="hidden" value= name="amount">
					</div>
					<div class="col-md-6 form-group">
						<label>&nbsp;</label>
						<button class="form-control btn btn-success">
							Pay : Rs.
							</button>
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
							<h4 class="mb-4 ">LOG IN</h4>
							<form action="./OrderSer" method="post">
									<div class="col-md mb-2">
										<div class="form-floating mb-3">
											<input id="floatingInput" required
												placeholder="Enter Card Holder Name" type="text"
												class="form-control small-input"> <label
												for="floatingInput">Name of Card Holder</label>
											<div class="invalid-feedback">Please Enter name!</div>
										</div>
									</div>
							
								<div class="row">
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="number" required class="form-control"
												id="floatingPassword" placeholder="Password"> <label
												for="floatingPassword">Enter CVV</label>
											<div class="invalid-feedback">Please Enter number!</div>
										</div>
									</div>
									<div class="col-md-6 mb-2">
										<div class="form-floating mb-3">
											<input type="number" required class="form-control"
												id="floatingPassword" placeholder="Password"> <label
												for="floatingPassword">Enter card number</label>
											<div class="invalid-feedback">Please Enter number!</div>
										</div>
									</div>
								</div>
								
								

								<div class="col-md">
									<div class="form-floating">

										<input type="number" required size="2" class="form-control"
											id="floatingPassword" min="00" max="999999999"
											placeholder="Password"> <label for="floatingPassword">Expiry
											Month</label>
										<div class="invalid-feedback">Please Enter name!</div>
									</div>
								</div>


								<div class="col-md">
									<div class="form-floating mt-4">
										<input type="number" required size="4" class="form-control"
											id="floatingPassword" min="00" max="999999999" name="amount" value=<%=amount %>
											placeholder="Password"> <label for="floatingPassword">Expiry
											year</label>
										<div class="invalid-feedback">Please Enter name!</div>
									</div>
								</div>

								<button type="reset" data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block  mt-4 ">Sign up</button>
								<button type="submit" data-mdb-button-init data-mdb-ripple-init
									class="btn btn-primary btn-block  mt-4 ms-4 mr-5">Pay : <%=amount %></button>
					
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