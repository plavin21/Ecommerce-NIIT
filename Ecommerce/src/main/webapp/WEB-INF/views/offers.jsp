<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
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
<script>
var cartCount = 0,
buy = $('.btn'),
span = $('.number'),
cart = $('.cart'),
quickview = $('.quickviewContainer'),
quickViewBtn = $('.quickview'),
close = $('.quickviewContainer .close'),
minicart = [],
totalPrice = [],
miniCartPrice;

buy.on('click', addToCart);
quickViewBtn.on('click', quickView);
cart.on('click', showMiniCart);
close.on('click', function(){
quickview.removeClass('active');
});

function quickView() {
var description = $(this).parent().find('.description').text(),
	 header = $(this).parent().find('.header').text(),
	 price = $(this).find('.price'),
	 quickViewHeader = $('.quickviewContainer .headline'),
	 quickViewDescription = $('.quickviewContainer .description');
clearTimeout(timeQuick);
	if(quickview.hasClass('active')){
		quickview.removeClass('active');
		var timeQuick = setTimeout(function(){
			quickview.addClass('active');
		}, 300);
	} else{
		quickview.addClass('active');
	}

quickViewHeader.text(header);
quickViewDescription.text(description);
}

function showMiniCart() {
$('.mini').toggleClass('visible');
}

function addToCart() {
var self = $(this),
	 productName = $(this).parent().find('.header').text(),
	 miniCartNames = $('.products'),
	 names = $('.names'),
	 price = $(this).parent().find('.price').text(),
	 priceInt = parseInt(price);

totalPrice.push(priceInt);
miniCartPrice = totalPrice.reduce(function(a,b){  return a+b });
$('.miniprice').text('Total amount: ' + miniCartPrice + ",-");
minicart.push(productName);
lastProduct = minicart[minicart.length - 1];
miniCartNames.text('Your cart lines: ');
names.append('<p>' + lastProduct + '</p>');

cartCount++;
span.text(cartCount);
clearTimeout(time);
if(span.hasClass('update')){
	span.removeClass('update');
	span.addClass('updateQuantity');
	var time = setTimeout(function(){
		span.removeClass('updateQuantity');
		span.addClass('update');
	}, 700);
} else{
	span.addClass('update');
}
if (cartCount == 1){
	cart.toggleClass('icon-basket icon-basket-loaded');
}

$(this).addClass('ok');
var timeOk = setTimeout(function(){
	self.removeClass('ok');
}, 1000);
}
</script>
<body>
<div class="wrapper">
	<div class="desc">
		<h1>Ecommerce product list/grid</h1>
		<p>Simple html/css  ecommerce product grid with a hover effect.</p>

		<div class="todo">
			<span>TODO list:</span>
			<ul>
				<li>Make it responsive folk!</li>
			</ul>
		</div>
	</div>

	<div class="content">
		<!-- content here -->
		<div class="product-grid product-grid--flexbox">
			<div class="product-grid__wrapper">
				<!-- Product list start here -->

				<!-- Single product -->
				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/1.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end Single product -->

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/2.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/3.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/4.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/6.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/BC.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/BD.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/CR.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>

				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="img/FT.jpg" alt="Img" class="product-grid__img" />
						</div>
						<span class="product-grid__title">Product title</span>
						<span class="product-grid__price">1.399€</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
							 <p class="product-grid__description">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis velit itaque odit.</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>

	<footer class="footer" >
		<div class="row-fluid">


<p>&copy; 2017 sportzarena.com<p>

 </div> 	</footer>
</div>
</body>
</html>