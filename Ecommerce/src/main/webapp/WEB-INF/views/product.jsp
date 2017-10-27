<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
 <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>

html, body{
    color:white;
    background-color:#0000;
    }
    
    .thumbnail img
{
width: 100%;
  height: 50vh;
}
.add-to-cart .btn-qty {
  width: 52px;
  height: 46px;
}
.qty {
     color:black;
    width: 40px;
    height: 25px;
    text-align: center;
}
input.qtyplus { width:25px; height:25px;}
input.qtyminus { width:25px; height:25px;}
.add-to-cart .btn { border-radius: 0; }
</style>

<script>




function checkstock() {
	var quantity = document.getElementById("quantity").value;
    var stock = document.getElementById("stock").value;
    if (quantity > stock ) {
    	 document.getElementById("myerror").innerHTML = "This Item Is Limited";
        return false;
    }
    return true;
		}
jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 1) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(1);
        }
    });
});
</script>

</head>
<body >
<%@ include file = "header.jsp" %>
<div class="container" id="product-section">
  <div class="row">
   <div class="col-md-6">
   <img
  src="${pageContext.request.contextPath}/resources/img/${produc.img }"
  alt="Kodak Brownie Flash B Camera"
  class="image-responsive" style="width: 100%;height: 70vh;"/>
   </div>
   
   <div class="col-md-6">
     <div class="row">
  <div class="col-md-12">
   <h1 style="color:white;">${produc.name }</h1>
 </div>
</div><!-- end row-->

<div class="row">
 <div class="col-md-12">
  <p class="description">
   ${produc.desc }
  </p>
 </div>
</div><!-- end row -->

<div class="row">
 <div class="col-md-3">
  <span class="sr-only">Four out of Five Stars</span>
  <span class="glyphicon glyphicon-star" aria-hidden="true" style="color: #e67e22;"></span>
  <span class="glyphicon glyphicon-star" aria-hidden="true" style="color: #e67e22;"></span>
  <span class="glyphicon glyphicon-star" aria-hidden="true" style="color: #e67e22;"></span>
  <span class="glyphicon glyphicon-star" aria-hidden="true" style="color:#e67e22;"></span>
  <span class="glyphicon glyphicon-star-empty" aria-hidden="true" style="color:#e67e22;"></span>
  <span class="label label-success">61</span>
 </div>
 <div class="col-md-3">
  <span class="monospaced">Write a Review</span>
 </div>
</div><!-- end row -->


<div class="row">
 <div class="col-md-12 bottom-rule">
  <h2 class="product-price"><span>&#8377;</span> ${produc.price }</h2>
 </div>
</div><!-- end row -->
      
<div class="form-group">
<form action="catr" method="POST">
<div class="row add-to-cart">
 <div class="col-md-5 product-qty">
 <input type='button' value='-' class='qtyminus' field='quantity' style="background-color: #4CAF50;"/>
    <input type='text' id='quantity' name='quantity' value='1' class='qty'  min='1'  readonly/>
 
    <input type='button' value='+' class='qtyplus' field='quantity' style="background-color: #4CAF50;" />

 </div>
 <input name="id" type="hidden" value=${produc.id}>
 
 
 
 
   <c:if test="${produc.stock ge 1}">
   
   <input id="stock" name="id" type="hidden" value="${produc.stock}"> 
    <input id="quantity" name="quantity" value=quantity type="hidden" />
    <div class="col-md-4">
   <button class="btn btn-success" type="submit" onclick="return checkstock()" >
   Add to Cart
  </button>
<p style=color:red; id="error"></p>
    </div>
   </c:if>
  

</div><!-- end row -->
</form>
</div>

<c:if test="${produc.stock gt 0 }">
<div class="row">
 <div class="col-md-4 text-center">
  <span class="monospaced">${produc.stock } <br> left </span>
 </div>
 </div><!-- end row -->
 </c:if>
 


<div class="row">
 <div class="col-md-12 bottom-rule top-10">
 <c:if test="${produc.stock == 0}">
       <a href=""><p style="color:red;">OUT OF STOCK</p></a> 
 </c:if> 
 </div>
</div><!-- end row -->

<div class="row">
 <div class="col-md-12 top-10">
  <p>To order by telephone,please call 1-800-555-1212</p>
 </div>
</div><!-- end row -->



   </div>
    </div><!-- end row -->
 </div><!-- end container -->
 
 <br>
 <h2>YOU MAY LIKE THESE</h2>
   <div class="row">

                    <div id="carousel-content" class="carousel slide" data-ride="carousel">
                     
                      <!-- Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active">
                        		 <c:forEach var="design" items="${productli}">
                        		 	<c:if test="${design.id != produc.id}">
                                        <!-- SINGLE SERVICE -->
                                        <div class="col-md-4 col-sm-6 col-xs-12" data-wow-offset="10" data-wow-duration="1.5s" style="visibility: visible;
                                         -webkit-animation-duration: 1.5s;">
                                           <a href="prolis?id=${design.id}&c_id=${design.category.c_id}"><img src="${pageContext.request.contextPath}/resources/img/${design.img }" 
                                           class="img-responsive" style=" width: 100%; height: 50vh;"></a>
                                        </div>
                                        <!-- /END SINGLE SERVICE -->
                                        </c:if>
                                 </c:forEach>
                         </div>
                                        
                      </div>

                      
                    </div>

            </div>
   

     
    </body>
    </html>


<%@ include file = "footer.jsp" %>
</body>
