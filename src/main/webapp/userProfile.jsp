<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.shp.daoImpl.UserDaoImpl, com.shp.beans.UserBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String password = (String) session.getAttribute("password");
		String username = (String) session.getAttribute("username");
		
		if (username == null || password == null) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
		}
		
		UserDaoImpl udao = new UserDaoImpl();
		UserBean user = udao.getUserDetails(username, password);
		
		if (user == null) {
			user = new UserBean ("Test User", 1234567890L , "Test@gmail.com", "ABC colony, Indore, M.P.", 452015, "pswd");
		}
	%>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="bg-secondary container">
		<div class="row">
			<div class="col">
				<nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="index.jsp">HOME</a></li>
						<li class="breadcrumb-item"><a href="profile.jsp">User Profile</a></li>
					</ol>
				</nav>
			</div> 
		</div>
		
		<div class="row">
			<div class="col-log-4">
				<div class="card mb-4">
					<div class="card-body text-center">
						<img src="images/profile.jpg" class="rounded-circle image-fluid" style="width:150px;">
						<h5 class="ny-3">
							Hello
							<%= user.getName()%>
							here!!
						</h5>
					</div>
				</div>
				<div class="card-mb-4 mb-log-0">
					<div class="card-body p-0">
						<ul class="list-group list-group-flush rounded-3"> 
							<li class="text-center list-group-item d-flex justify-content-between align-items-center p-3">
								<h1>My Profile</h1>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="col-lg-8">
				<div class="card mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9" >
								<p class="text-muted mb-0"><%=user.getName()%></p>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Email</p>
							</div>
							<div class="col-sm-9" >
								<p class="text-muted mb-0"><%=user.getEmail()%></p>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9" >
								<p class="text-muted mb-0"><%=user.getMobile()%></p>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address</p>
							</div>
							<div class="col-sm-9" >
								<p class="text-muted mb-0"><%=user.getAddress()%></p>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Pin Code</p>
							</div>
							<div class="col-sm-9" >
								<p class="text-muted mb-0"><%=user.getPincode()%></p>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	
	<jsp:include page="footer.html"></jsp:include>
	
</body>
</html>













