<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
        </script>
  
</head>

<script >
var today = new Date;
document.getElementById('date').innerHTML= today.toDateString();

window.history.forward();
function noBack() {
	window.history.forward(); 
	}



</script>
  
<style>

input[type=text],input[type=number]{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
.check { 
	position:relative ;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	margin-top: 20px;
	width:300px;
	height:300px;
}
.check h1 { 
color: #fff;
 letter-spacing:1px; 
 text-align:center;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}


* {margin: 0; padding: 0;}

.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody {

color:#000000
}
.table > thead {

color:#000000
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}

body {
	text-align: center;
	
	background: #000000;
	color: #ffffff
	
}

.breadcrumb {
	/*centering*/
	display: inline-block;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.35);
	overflow: hidden;
	border-radius: 5px;
	/*Lets add the numbers for each link using CSS counters. flag is the name of the counter. to be defined using counter-reset in the parent element of the links*/
	counter-reset: flag; 
}

.breadcrumb a {
	text-decoration: none;
	outline: none;
	display: block;
	float: left;
	font-size: 12px;
	line-height: 36px;
	color: white;
	/*need more margin on the left of links to accomodate the numbers*/
	padding: 0 10px 0 60px;
	background: #666;
	background: linear-gradient(#666, #333);
	position: relative;
}
/*since the first link does not have a triangle before it we can reduce the left padding to make it look consistent with other links*/
.breadcrumb a:first-child {
	padding-left: 46px;
	border-radius: 5px 0 0 5px; /*to match with the parent's radius*/
}
.breadcrumb a:first-child:before {
	left: 14px;
}
.breadcrumb a:last-child {
	border-radius: 0 5px 5px 0; /*this was to prevent glitches on hover*/
	padding-right: 20px;
}

/*hover/active styles*/
.breadcrumb a.active, .breadcrumb a:hover{
	background: #333;
	background: linear-gradient(#333, #000);
}
.breadcrumb a.active:after, .breadcrumb a:hover:after {
	background: #333;
	background: linear-gradient(135deg, #333, #000);
}

/*adding the arrows for the breadcrumbs using rotated pseudo elements*/
.breadcrumb a:after {
	content: '';
	position: absolute;
	top: 0; 
	right: -18px; /*half of square's length*/
	/*same dimension as the line-height of .breadcrumb a */
	width: 36px; 
	height: 36px;
	/*as you see the rotated square takes a larger height. which makes it tough to position it properly. So we are going to scale it down so that the diagonals become equal to the line-height of the link. We scale it to 70.7% because if square's: 
	length = 1; diagonal = (1^2 + 1^2)^0.5 = 1.414 (pythagoras theorem)
	if diagonal required = 1; length = 1/1.414 = 0.707*/
	transform: scale(0.707) rotate(45deg);
	/*we need to prevent the arrows from getting buried under the next link*/
	z-index: 1;
	/*background same as links but the gradient will be rotated to compensate with the transform applied*/
	background: #666;
	background: linear-gradient(135deg, #666, #333);
	/*stylish arrow design using box shadow*/
	box-shadow: 
		2px -2px 0 2px rgba(0, 0, 0, 0.4), 
		3px -3px 0 2px rgba(255, 255, 255, 0.1);
	/*
		5px - for rounded arrows and 
		50px - to prevent hover glitches on the border created using shadows*/
	border-radius: 0 5px 0 50px;
}
/*we dont need an arrow after the last link*/
.breadcrumb a:last-child:after {
	content: none;
}
/*we will use the :before element to show numbers*/
.breadcrumb a:before {
	content: counter(flag);
	counter-increment: flag;
	/*some styles now*/
	border-radius: 100%;
	width: 20px;
	height: 20px;
	line-height: 20px;
	margin: 8px 0;
	position: absolute;
	top: 0;
	left: 30px;
	background: #444;
	background: linear-gradient(#444, #222);
	font-weight: bold;
}

  /* Arrow styles */
  &:after {
    content: '';
    
    position: absolute;
    top: -3px;
    right: -12px;
    z-index: 1;
    
    width: 23px;
    height: 23px;
    
    //border: 1px solid black;
    background: $grey;
    border-top: 5px solid $white;
    border-right: 5px solid $white;
    border-radius: 0 2px 0 50px;
    
    @include transform(rotate(45deg) scale(0.707) skew(15deg,15deg));
    @inckude backface-visibility(hidden); //so that rendering won't look pixelated in Chrome
    @include transition(.3s ease all);
  }
  
  &:last-child:after {
    content: none;
  }
  
  &:hover, &.active,
  &:hover:after, &.active:after {
    background: $red;
  }
}


/* */

</style>
</head>
<body onload="noBack();"  onpageshow="if (event.persisted) noBack();" onunload="">

<%@ include file = "header.jsp" %>
<!-- 
 -->
<div class="container">

<!-- a simple div with some links -->
<div class="breadcrumb">
	<a >Address</a>
	<a >Payment</a>
	
	<a class="active">place your order</a>
</div>
<br /><br />

    <div class="row">
        <div class="col-xs-12">
           <div class="invoice-title">
    			<h2 style="text-align:center" >SPORTZ ARENA</h2>
    		</div>
        <hr>
        <div class="invoice-title">
    			<h4 style="text-align:center" >ORDER CONFIRMATION</h4>
    		</div>
    		
        <div class="invoice-title">
    			<p style="text-align:left" >Hello ${orders.name } ,<br/>
    			Thank you for purchasing from Sportz Arena. This is a confirmation that we have received your order with the details below,
    			</p>
    		</div>
        
        
    		
    		<br><br>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<p style="color:aqua;">Shipped To:</p><br>
    				
    					${orders.name } <br>
    					${orders.mobno } <br>
       					 ${orders.address } <br>
      				   ${orders.email }  <br>
       				   ${orders.state } <br>
       				 ${orders.zip } 
       				 
    				</address>
    			</div>
    			<div class="col-xs-6">
    				<address>
    					<p style="color:aqua;">Payment Method:</p><br>
    					Visa ending **** 4242<br>
    					${orders.email } 
    				</address>
    				<address>
    					<p style="color:aqua;">Order Date:</p><br><p class="marquee">
    							<span id="dtText"></span>
									</p>
						<br><br>
    				</address>
    			</div>
    			
    		</div>
    				
    		
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Order summary</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Item</strong></td>
        							<td class="text-center"><strong>Price</strong></td>
        							<td class="text-center"><strong>Quantity</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<c:forEach var="design" items="${cartlis}"><!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td>${design.product.name }</td>
    								<td class="text-center">${design.price }</td>
    								<td class="text-center">${design.quantity }</td>
    								<td class="text-right">${design.price * design.quantity}</td>
    							</tr>
    							</c:forEach>
                               
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right">${sum }</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right"> <span>&#8377;</span>100</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">${sum + 100 }</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
    <div class="col-xs-12">
     <div class="col-xs-6">
    <a href="cancelord?id=${orders.ordid }" class="btn btn-danger" role="button">Cancel Your Order</a>
   </div>
   <div class="col-xs-6">
  
    <a href="checkord" class="btn btn-info" role="button">Place Your Order</a>
   </div>
   </div>
   
   
</div>
 
<%@ include file = "footer.jsp" %>
</body>

</html>