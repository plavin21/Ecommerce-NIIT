<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}

@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}
</style>
<head>
<title>Shopping cart</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  </head>
<body>
<%@ include file = "header.jsp" %>
<body style=" background-color:#000000">
<c:if test="${fn:length(cartlis) eq 0}">
<div>
<h2 style="text-align:center;color:#ffffff;">YOUR SHOPPING CART IS EMPTY</h2>
<div >
<img src="${pageContext.request.contextPath}/resources/img/cartt.png" alt="Chania" width="100 " height="500 vh" class="img-responsive" style="display: block;
    margin-left: auto;margin-right: auto;"/>
</div>
</div>
</c:if>
<c:if test="${fn:length(cartlis) ge 1}">
  

<div class="container">

	<table id="cart"  style="color:#fff" >
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%">Delete</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="design" items="${cartlis}">
						<tr>
						
							<td data-th="Product">
								<div class="row">
								
									<div class="col-sm-2 "><img src="resources/img/${design.product.img }" alt="Chania" width="100" height="100" class="img-responsive"/></div>
									<div class="col-sm-10">
									 
										<h4 class="nomargin">${design.product.name }</h4>
										<p>paul pogba man utd t shirt NO 6
										</p>	</div>
								</div>
							</td>
							<td data-th="Price">${design.price }</td>
							<td data-th="Quantity" class="text-center">
								${design.quantity }
							</td>
							<td data-th="Subtotal" class="text-center">${design.price * design.quantity}</td>
							<td data-th="Delete"><a href="delcart?id=${design.carid}" class="btn btn-info btn-lg">
          									<span class="glyphicon glyphicon-trash"></span> Trash 
       						 </a>
						</tr>
						</c:forEach>
						
						
						
					</tbody>
					<br>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>${design.price }</strong></td>
						</tr>
						<tr>
							<td><a href="./" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total ${sum }</strong></td>
							<td><a href="checkout" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
</div>
</c:if>
<%@ include file = "footer.jsp" %>
</body>
</html>