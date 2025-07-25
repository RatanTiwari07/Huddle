<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.shp.daoImpl.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/STYLESS.css">

<script src="https://kit.fontawesome.com/7d4c2ac8c6.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/aa63d55fe6.js" crossorigin="anonymous"></script>


</head>
<body>

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Real Navbar -->

	<nav class="navbar navbar-expand-lg  sticky-top ">
		<div class="container-fluid ">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item mr-3" style="width:40px;">
						<a href="main_Display.jsp" class="nav-link nav-icon iconClass" style="color:black;">
							<i class="fa-solid fa-house"></i>
						</a>
					</li>
				
					<li class="nav-item">
						<a class="nav-link active text-dark" aria-current="page" href="login.jsp">Login</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="register.jsp">Register</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="index.jsp">Product</a>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
						<ul class="dropdown-menu mt-2"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="index.jsp?type=mobile">Mobile</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=laptop">Laptops</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tv">Televisions</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=camera">camera's</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=speaker">Speakers</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tablet">Tablets</a></li>
						</ul></li>
				</ul>
			</div>

			<form class="d-flex" action="index.jsp">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="search" name="search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>

		</div>
	</nav>

	<%
	} else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

	int notf = new CartDaoImpl().getCartCount((String) session.getAttribute("username"));
	%>

	<!-- Real Navbar -->

	<nav class="navbar navbar-expand-lg  sticky-top ">
		<div class="container-fluid ">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item mr-3" style="width:40px;">
						<a href="main_Display.jsp" class="nav-link nav-icon iconClass" style="color:black;">
							<i class="fa-solid fa-house"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active text-dark" aria-current="page" href="index.jsp">Products</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
						<ul class="dropdown-menu mt-2"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="index.jsp?type=mobile">Mobile</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=laptop">Laptops</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tv">Televisions</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=camera">camera's</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=speaker">Speakers</a></li>
							<li><a class="dropdown-item" href="index.jsp?type=tablet">Tablets</a></li>
						</ul>
					</li>
					
					<%
						if (notf == 0) {
					%>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="cartDetails.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
					</li>
					
					<%
						} else {
					%>
					
					<li class="nav-item">
                		<a href="cartDetails.jsp" class="nav-link"><i class="fa-solid fa-cart-shopping"></i><span class="badge badge-pill badge-secondary" style="color:black; "><%=notf %></span></a>
            		</li>
					
					<%
						}
					%>	
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="orderDetails.jsp">Orders</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="userProfile.jsp">Profile</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="./LogoutSrv">Logout</a>
					</li>

				</ul>
			</div>

			<form class="d-flex" action="index.jsp">
				<input class="form-control me-2" type="search" placeholder="search"
					aria-label="Search" name="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>

		</div>
	</nav>

	<%
	} else { //ADMIN HEADER
	%>
	
		<nav class="navbar navbar-expand-lg  sticky-top ">
		<div class="container-fluid ">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item mr-3" style="width:40px;">
						<a href="main_Display.jsp" class="nav-link nav-icon iconClass" style="color:black;">
							<i class="fa-solid fa-house"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active text-dark" aria-current="page" href="adminViewProduct.jsp">Products</a>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Category </a>
						<ul class="dropdown-menu mt-2"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=mobile">Mobile</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=tv">Televisions</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=camera">camera's</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
							<li><a class="dropdown-item" href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
						</ul>
					</li>					
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="adminStock.jsp">Stock</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="shippedItems.jsp">Shipped</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link text-dark" href="unshippedItems.jsp">Orders</a>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Actions </a>
						<ul class="dropdown-menu mt-2"
							aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="addProduct.jsp">Add Product</a></li>
							<li><a class="dropdown-item" href="removeProduct.jsp">Remove Product</a></li>
							<li><a class="dropdown-item" href="updateProductById.jsp">Update Product</a></li>
							<li><a class="dropdown-item" href="registerAdmin.jsp">Register admin</a></li>
						</ul>
					</li>
		
							
					<li class="nav-item">
						<a class="nav-link text-dark" href="./LogoutSrv">Logout</a>
					</li>			

				</ul>
			</div>

			<form class="d-flex" action="index.jsp">
				<input class="form-control me-2" type="search" placeholder="search"
					aria-label="Search" name="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>

		</div>
	</nav>
	
		<%
			}
		%>
	
	<!--  logo navbar  -->

	<nav class="navbar all">
        <div class="container ">
            <a class="navbar-brand" href="main_Display.jsp">
                <img src="images/logo.PNG" alt="" width="160" height="44">
            </a>
            <span class="navbar-text text-white">
                Synchronize with Innovation
            </span>
        </div>
    </nav>
	
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
    <script
							src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
    <script src="https://unpkg.com/scrollreveal"></script>
    <script
							src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>



    <script>

    </script>


    <!-- navbar script  -->
    <script>
        const navE1 = document.querySelector('.navbar');
        window.addEventListener('scroll', () => {

            if (window.scrollY >= 60) {
                navE1.classList.add('navbar-scrolled');
            } else if (window.scrollY < 56) {
                navE1.classList.remove('navbar-scrolled');
            }
        });
    </script>

					</body>
</html>
