<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.beans.ProductBean , com.shp.daoImpl.ProductDaoImpl "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
#sproduct {
	display: flex;
	justify-content: space-between;
	/* border: 1px solid black; */
}

#sproduct img {
	width: 100%;
	border-radius: 15px;
}

#sproduct .smallimg img {
	border-radius: 10px;
}

#sproduct #proimage {
	width: 40%;
	height: fit-content;
	border-radius: 20px;
	padding: 12px;
	border: 1px solid lightgray;
	box-shadow: 0px 0px 15px lightslategray, -0px -0px 15px lightslategray;
}



#sproduct #imggrp {
	display: flex;
	justify-content: space-between;
	margin-top: 5px;
}

#sproduct #proimage .smallimg {
	flex-basis: 24%;
	cursor: pointer;
}

#sproduct #desc {
	width: 55%;
}

#sproduct #desc h5 {
	margin: 10px 0;
	font-weight: 800;
}

#sproduct #desc h4 {
	margin: 15px 0;
}

#sproduct #desc h3 {
	margin: 15px 0px;
	font-size: 30px;
}

#sproduct #desc select {
	padding: 3px 5px;
	display: block;
	margin: 20px 0px;
}

#sproduct #desc p {
	margin: 50px 0px;
	line-height: 30px;
	font-size: 18px;
}

#pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

#pagination button {
	font-size: 18px;
	font-weight: 700;
	margin: 2px;
	background-color: #0881799f;
	border: none;
	border-radius: 5px;
	height: 40px;
	width: 40px;
	color: #cdebbc;
	cursor: pointer;
}

#pagination button:hover {
	transform: scale(0.9);
}

#pagination button i {
	font-style: normal;
}

.normal {

    background-color: #fff;
    color: #000;
    padding: 15px 25px;
    outline: none;
    border: 1px solid black ;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    border-radius: 4px;
    transition: all 0.4s;
    display:inline-block;
    text-decoration:none;
    color:black;
    text-color:black;
}

.normal:hover{
	background-color:#088178;
	color:white;
}

h1 {
    font-size: 50px;
    line-height: 64px;
    columns: #222;
}

h2 {
    font-size: 46px;
    line-height: 54px;
    columns: #222;
}

h4 {
    font-size: 20px;
    columns: #222;
}

h6 {
    font-weight: 700;
    font-size: 12px;
}

p {
    font-size: 16px;
    color: #465b52;
    margin: 15px 0px 20px 0;
    text-align:justify;
}

.section-m1 {
    margin: 40px 0;
}

.section-p1 {
    padding: 40px 80px;
}
</style>

</head>
<body>

	<%
		String prodId = request.getParameter("prodId");
	
		ProductBean prd = new ProductDaoImpl().getProductDetails(prodId);
		
		double prdPrice = prd.getProdPrice();
	%>

	<jsp:include page="header.jsp" />

	<section id="sproduct" class="section-p1" style="padding : 50px;">
	
		<div id="proimage">
			<a href="#"> <img src="./ShowImage?pid=<%=prd.getProdId()%>" id="bigimg"> </a>
		</div>
		<div id="desc">
			<h5>Product / <%=prd.getProdType()%></h5>
			<h4>
				<b><%=prd.getProdName() %></b>
			</h4>
			<h3>
				<strike><%=(prdPrice-100)%></strike> <%=prdPrice%> $
			</h3>
			
			<!-- <button class="normal"  >Add To Cart</button> -->
			
			<a class="normal" href="./AddtoCart?uid=null&pid=<%=prd.getProdId()%>&pqty=1">Add To Cart</a>
			
			<p> <%=prd.getProdInfo()%> Lorem, ipsum dolor sit amet coialiquam perspiciatis veniam sit similique nobis epe aliquid magni cupiditate. Nostrum sit aut exercitationem neque, voluptatum provident. Eveniet ut esse sunt similique. Nam veritatis, explicabo fuga labore tempora maiores omnis maxime eaque similique. Quam ratione atque, quas dolorum consectetur autem labore expedita tempore quibusdam, placeat dolorem, aliquam quos eveniet nisi quidem accusamus voluptatibus. Quibusdam, consequuntur excepturi? Repellendus nemo voluptas totam qui laboriosam quod expedita, voluptatibus eveniet aliquam recusandae impedit error officia magnam, maiores quasi debitis nobis reprehenderit?</p>
		</div>
	</section>
	
	<jsp:include page="footer.html" />

</body>
</html>