<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.shp.daoImpl.CartDaoImpl,com.shp.beans.CartBean,java.util.List,java.util.ArrayList,
				 com.shp.beans.ProductBean,com.shp.daoImpl.ProductDaoImpl"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/7d4c2ac8c6.js" crossorigin="anonymous"></script>

<style>

		.card-body img {
            width: 50px;
            height: 50px;/
        }

        .head .text-center {
            /* background-color: grey; */
            color: white;
        }

        .head {
            background-color: grey;
        }

        #cart-banner {
            background-image: url(cartbg.jpg);
            height: 35vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #cart-banner h2 {
            color: #fff;
        }

        #cart-banner p {
            color: #cce7d0;
        }

        #cart-banner p span {
            color: yellowgreen;
        }

        #cart-table table thead {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        #cart-table table tr {
            padding: 20px;
        }
	
</style>

</head>
<body>

	<%
	String username = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (username == null || password == null) {
		response.sendRedirect("login.jsp?message=Session Expired, Login Again!");
	}

	String addS = request.getParameter("add");

	if (addS != null) {

		int add = Integer.parseInt(addS);
		String uid = request.getParameter("uid");
		String pid = request.getParameter("pid");

		int avail = Integer.parseInt(request.getParameter("avail"));
		int cartQty = Integer.parseInt(request.getParameter("qty"));

		CartDaoImpl cart = new CartDaoImpl();

		if (add == 1) {
			cartQty = 1;

			if (cartQty <= avail) {
		cart.addProductToCart(uid, pid, 1);
			} else {
		response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
			}

		} else if (add == 0) {
			cart.removeProductFromCart(uid, pid);
		}
	}
	%>

	<jsp:include page="header.jsp" />

		
	<div class="container-fluid mt-5">
        <div class="row">
            <div class="col-12">
                <table class="table table-bordered table-centered mb-0 d-none d-md-table" style="vertical-align:middle;">
                    <thead>
                        <tr class="head">
							<th class="text-center" >Picture</th>
							<th class="text-center" >Products</th>
							<th class="text-center" >Price</th>
							<th class="text-center" >Quantity</th>
							<th class="text-center" >Add</th>
							<th class="text-center" >Remove</th>
							<th class="text-center" >Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    	<%
                    	
        				CartBean cart = new CartBean();
        				CartDaoImpl cartDao = new CartDaoImpl();
        				double totAmt = 0;

        				List<CartBean> cartItems = new ArrayList<CartBean>();

        				cartItems = cartDao.getAllCartItems(username);

        				for (CartBean item : cartItems) {
        					String prodId = item.getProdId();

        					int prodQuantity = item.getQuantity();

        					ProductBean product = new ProductDaoImpl().getProductDetails(prodId);

        					double currAmt = product.getProdPrice() * prodQuantity;

        					totAmt += currAmt;

        					if (prodQuantity > 0) {
                    	
                    	%>
                    
                        <tr>
                            <td class="table-user text-center">
                                <img src="./ShowImage?pid=<%=product.getProdId()%>" height="50ox" width="80px" alt="img" class="me-2" />
                            </td>
                            <td class="table-action text-center">
                                <div class=""><%=product.getProdName()%></div>
                            </td>
                            <td class="table-action text-center">
                                <div class=""><%=product.getProdPrice()%></div>
                            </td>
                            <td class="table-action text-center">
								<form method="post" action="./UpdateToCart">
									<input type="number" name="pqty" value="<%=prodQuantity%>"
										style="max-width: 70px;" min="0"> <input type="hidden"
										name="pid" value="<%=product.getProdId()%>"> <input
										type="submit" name="Update" value="Update"
										style="max-width: 80px;">
								</form>
                            </td>                            
                            <td class="table-action text-center">
								<a href="cartDetails.jsp?add=1&amp;uid=<%=username%>&amp;pid=<%=product.getProdId()%>
										 &amp;avail=<%=product.getProdQuantity()%>&amp;qty=<%=prodQuantity%>">
									<i class="fa fa-plus"></i>
								</a>
                            </td>
                            <td class="table-action text-center">
                                <a href="cartDetails.jsp?add=0&amp;uid=<%=username%>&amp;pid=<%=product.getProdId()%>
								 &amp;avail=<%=product.getProdQuantity()%>&amp;qty=<%=prodQuantity%>">
									<i class="fa fa-minus"></i>
								</a>
							</td>
							<td class="table-action text-center">
                                <div class=""><%=currAmt%></div>
                            </td>
                            
                            
                        </tr>
                        
                        <%
                        
        					}
        					
        				}
                        %>
                        
		            	<tr style="background-color: grey; color:white;">
							<td colspan="6" style="text-align:center;">Total Amount to pay (in rupees)</td>
							<td><%= totAmt %></td>
						</tr>
				
						<%
							if (totAmt != 0) {
						%>
						<tr style="background-color : grey; color : white;">
							
							<td colspan="4" style="text-align:center;">
								<form method="post">
									<button formaction="userHome.jsp" style="background-color:black; color:white;">Cancel</button>
								</form>
							</td>
							
							<td colspan="2" align="center">
								<form method="post">
									<button style="background-color:blue; color:white;" 
											formaction="payment.jsp?amount=<%=totAmt%>">Pay Now</button>
								</form>
							</td>
							
						</tr>
						<%
						} 
						%>	
                        
                    </tbody>
                </table>


            </div>
        </div>
    </div>


	
<jsp:include page="footer.html"></jsp:include>
</body>
</html>








