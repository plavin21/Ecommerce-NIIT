<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style>

@import '../../shared/mixins',
        '../../shared/reset',
        '../../shared/about-dark';


body {
  font: 13px/20px 'Lucida Grande', Verdana, sans-serif;
  color: #404040;
  background: #dbe0eb;
}

.checkout {
  width: 270px;
  margin: 50px auto;
  padding: 15px;
  background: #f3f6fa;
  border: 1px solid;
  border-color: #c2cadb #bbc5d6 #b7c0cd;
  border-radius: 7px;
  @include box-shadow(0 1px 5px rgba(black, .15));

  > p { @include clearfix; }
  > p + p { margin-top: 15px; }
}

.checkout-header {
  position: relative;
  margin: -15px -15px 15px;
}

.checkout-title {
  padding: 0 15px;
  line-height: 38px;
  font-size: 13px;
  font-weight: bold;
  color: #7f889e;
  text-shadow: 0 1px rgba(white, .7);
  background: #eceff5;
  border-bottom: 1px solid #c5ccdb;
  border-radius: 7px 7px 0 0;
  @include linear-gradient(top, #f5f8fb, #e9edf3);
  @include box-shadow(inset 0 1px white);

  &:before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 2px;
    @include box-shadow(0 1px 2px rgba(black, .08));
  }
}

.checkout-price {
  position: absolute;
  top: -14px;
  right: -14px;
  width: 40px;
  font: 14px/40px Helvetica, Arial, sans-serif;
  color: white;
  text-align: center;
  text-shadow: 0 -1px 1px rgba(black, .3);
  text-indent: -1px;
  letter-spacing: -1px;
  background: #e54930;
  border: 1px solid;
  border-color: #b33323 #ab3123 #982b1f;
  border-radius: 21px;
  @include user-select(none);
  @include linear-gradient(top, #f75a3b, #d63b29);
  @include box-shadow(inset 0 1px 1px rgba(white, .3),
                      0 1px 2px rgba(black, .2));

  &:before {
    content: '';
    position: absolute;
    top: 3px;
    bottom: 3px;
    left: 3px;
    right: 3px;
    border: 2px solid #f5f8fb;
    border-radius: 18px;
    @include box-shadow(inset 0 1px 1px rgba(white, .2),
                        inset 0 -1px 1px rgba(black, .25),
                        0 -1px 1px rgba(black, .25));
  }
}

input {
  margin: 0;
  line-height: normal;
  font-family: inherit;
  font-size: 100%;
  @include box-sizing(border-box);
}

.checkout-input {
  float: left;
  padding: 0 7px;
  height: 32px;
  color: #525864;
  background: white;
  border: 1px solid;
  border-color: #b3c0e2 #bcc5e2 #c0ccea;
  border-radius: 4px;
  @include linear-gradient(top, #f6f8fa, white);
  @include box-shadow(inset 0 1px 2px rgba(black, .1),
                      0 1px rgba(white, .5));

  &:focus {
    border-color: #46aefe;
    outline: none;
    @include box-shadow(inset 0 1px 2px rgba(black, .1),
                        0 0 5px #46aefe);
  }

  .lt-ie9 & { line-height: 30px; }
}

.checkout-name { width: 150px; }
.checkout-card { width: 210px; }

.checkout-exp,
.checkout-cvc {
  margin-left: 15px;
  width: 45px;
}

.checkout-btn {
  width: 100%;
  height: 34px;
  padding: 0;
  font-weight: bold;
  color: white;
  text-align: center;
  text-shadow: 0 -1px 1px rgba(black, .2);
  border: 1px solid;
  border-color: #1486f9 #0f7de9 #0d6acf;
  background: #1993fb;
  border-radius: 4px;
  @include linear-gradient(top, #4cb1fe, #229afc 40%, #138df6);
  @include box-shadow(inset 0 1px rgba(white, .2),
                      0 1px 2px rgba(black, .2));

  &:active {
    text-shadow: 0 1px 1px rgba(black, .2);
    border-color: #075bba #0c69d2 #0f7de9;
    @include linear-gradient(top, #1281dc, #1593fc);
    @include box-shadow(inset 0 1px 4px rgba(black, .1),
                        0 1px rgba(white, .5));
  }
}

:-moz-placeholder { color: #acb6c8 !important; }
::-moz-placeholder { color: #acb6c8 !important; opacity: 1; }
::-webkit-input-placeholder { color: #acb6c8; }
:-ms-input-placeholder { color: #acb6c8; }

::-moz-focus-inner {
  padding: 0 !important;
  border: 0 !important;
} 



* {margin: 0; padding: 0;}



body {
	text-align: center;
	
	background: #689976;
	background: linear-gradient(#689976, #ACDACC);
	
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


/* .flat a, .flat a:after {
	background: white;
	color: black;
	transition: all 0.5s;
}
.flat a:before {
	background: white;
	box-shadow: 0 0 0 1px #ccc;
}
.flat a:hover, .flat a.active, 
.flat a:hover:after, .flat a.active:after{
	background: #9EEB62;
}
 */







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

</style>

</head>
<body>
<%@ include file = "header.jsp" %>
<!-- a simple div with some links -->
<div class="breadcrumb">
	<a >Address</a>
	<a  class="active">Payment</a>
	<a >Order Confirmation</a>
	<a >Place your order</a>
</div>
<br /><br />
<form class="checkout">
    <div class="checkout-header">
      <h1 class="checkout-title">
        Checkout
        <span class="checkout-price">$10</span>
      </h1>
    </div>
    <p>
      <input type="text" class="checkout-input checkout-name" placeholder="Your name" autofocus>
      <input type="text" class="checkout-input checkout-exp" placeholder="MM">
      <input type="text" class="checkout-input checkout-exp" placeholder="YY">
    </p>
    <p>
      <input type="text" class="checkout-input checkout-card" placeholder="4111 1111 1111 1111">
      <input type="text" class="checkout-input checkout-cvc" placeholder="CVC">
    </p>
    <p>
      <input type="submit" value="Purchase" class="checkout-btn">
    </p>
  </form>
  
  <%@ include file = "footer.jsp" %>
</body>

</html>