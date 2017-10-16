<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
<style>

.wrapper {
	width: 68em;
}




// Start here

$title-color: #222;
$font-color: #777;
$light-gray: #eee;
$primary: #E91E63;
$secondary: #42A5F5;

// product
$product-box-shadow: 0px 0px 0px 1px $light-gray;





* {
	box-sizing: border-box;
}

body {
	color: $font-color;
	font-family: 'Open Sans', Arial, sans-serif;
}


.product-grid {
	width: 60em;
	margin: 2rem auto;
	// TODO: apply clearfix
	

	// If want a flexbox grid.
	&.product-grid--flexbox {
		.product-grid__wrapper {
			display: flex;
			flex-wrap: wrap;
		}
		
		.product-grid__title {
			height: auto;
			
			&:after { display: none; }
		}
	}
	

	&__wrapper {
		margin-left: -1rem;
		margin-right: -1rem;
		//background: #000;
	}
	
	&__product-wrapper {
		padding: 1rem;
		float: left;
		width: 33.33333%;
	}
	
	
	&__product {
		padding: 1rem;
		// width: 33.33333%;
		// float: left;
		position: relative;
		cursor: pointer;
		background: #fff;
		//box-shadow: $product-box-shadow;
		border-radius: 4px;
		
		&:hover {
			box-shadow: $product-box-shadow;
			z-index: 50;
			
			.product-grid__extend {
				display: block;
			}
		}
	}
	
			
	// product image wrapper
	&__img-wrapper {
		width: 100%;
		text-align: center;
		padding-top: 1rem;
		padding-bottom: 1rem;
		height: 150px;
	}
	
	
		// product image
		&__img {
			max-width: 100%;
			height: auto;
			max-height: 100%;
		}
	
	
	//	product title
	&__title {
		margin-top: .875rem;
		display: block;
		font-size: 1.125em;
		color: $title-color;
		height: 3em;
		overflow: hidden;
		position: relative;
		
		&:after {
			content: "";
			display: block;
			position: absolute;
			bottom: 0;
			right: 0;
			width: 2.4em;
			height: 1.5em; // magic number
			background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 50%);
			//background: red;
		}
	}
	
	&__price {
		color: $primary;
		font-weight: bold;
		letter-spacing: .4px;
	}
	
	
	// extend wrapper
	&__extend-wrapper {
		position: relative;
	}
	
	// extended elements
	// show when hover .product-grid__product
	&__extend {
		display: none;
		position: absolute;
		padding: 0 1rem 1rem 1rem;
		margin: .4375rem -1rem 0;
		box-shadow: $product-box-shadow;
		background: #fff;
		border-radius: 0 0 4px 4px;
		
		&:before {
			content: "";
			height: .875rem;
			width: 100%;
			position: absolute;
			top: -.4375rem;
			left: 0;
			background: #fff;
		}
	}
	
	
	// product description	
	&__description {
		font-size: .875em;
		//margin-top: .875rem;
		margin-top: .4375rem;
		margin-bottom: 0;
	}
	
	
	// buttons
	&__btn {
		display: inline-block;
		font-size: .875em;
		color: $font-color;
		background: $light-gray;
		padding: .5em .625em;
		margin-top: .875rem;
		margin-right: .625rem;
		cursor: pointer;
		border-radius: 4px;
		
		i.fa { margin-right: .3125rem;}
	}
	
	
	&__add-to-cart {
		color: #fff;
		background: $primary;
		
		&:hover { background: lighten($primary, 10%); }
	}
	
	&__view {
		color: $font-color;
		background: $light-gray;
		
		&:hover { background: lighten($light-gray, 10%); }
	}
}

</style>


</head>
<body>
<%@ include file = "header.jsp" %>


<div class="content">
		<!-- content here -->
		<div class="product-grid product-grid--flexbox">
			<div class="product-grid__wrapper">
				<!-- Product list start here -->
				 <c:forEach var="design" items="${productli}">
				<!-- Single product -->
				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="resources/img/${design.img }" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title"> ${design.name}</span>
						<span class="product-grid__price"> ${design.price}</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i><a href="catr1?id=${produc.id}"> Add to cart</a></span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i><a href="prolis?id=${design.id}"> View more </a></span>
							</div>
						</div>
					</div>
				</div>
				<!-- end Single product -->
			</c:forEach>
			</div>
			</div>
			</div>
		

<%@ include file = "footer.jsp" %>
</body>
</html>