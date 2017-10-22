<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 <style>

html, body{
    width:100%;
    height:100%;
    background-color:#0000;
    }
.carousel-inner,.carousel,.item,.container,.fill {
  height:100%;
  width:100%;
  background-position:center center;
  background-size:cover;
}
.slide-wrapper{display:inline;}
.slide-wrapper .container{padding:0px;}

/*------------------------------ vertical bootstrap slider----------------------------*/

.carousel-inner> .item.next ,  .carousel-inner > .item.active.right{ transform: translate3d(0, 100%, 0); -webkit-transform: translate3d(0, 100%, 0); -ms-transform: translate3d(0, 100%, 0); -moz-transform: translate3d(0, 100%, 0); -o-transform: translate3d(0, 100%, 0);  top: 0;}
.carousel-inner > .item.prev ,.carousel-inner > .item.active.left{ transform: translate3d(0,-100%, 0); -webkit-transform: translate3d(0,-100%, 0);  -moz-transform: translate3d(0,-100%, 0);-ms-transform: translate3d(0,-100%, 0); -o-transform: translate3d(0,-100%, 0); top: 0;}
.carousel-inner > .item.next.left , .carousel-inner > .item.prev.right , .carousel-inner > .item.active{transform:translate3d(0,0,0); -webkit-transform:translate3d(0,0,0);-ms-transform:translate3d(0,0,0);; -moz-transform:translate3d(0,0,0); -o-transform:translate3d(0,0,0); top:0;}

/*------------------------------- vertical carousel indicators ------------------------------*/
.carousel-indicators{
position:absolute;
top:0;
bottom:0;
margin:auto;
height:20px;
right:10px; left:auto;
width:auto;
}
.carousel-indicators li{display:block; margin-bottom:5px; border:1px solid #00a199; }
.carousel-indicators li.active{margin-bottom:5px; background:#00a199;}


panel-heading{
  
  color:#000;
  
 }
  
  </style>
  
  <script>
  
 
  /* $('#myCarousel').carousel({
      interval: 400
  });
  $(document).ready(function(){
	// invoke the carousel
	    
  $('#myCarousel').carousel({
      interval: 1200
  });

	// scroll slides on mouse scroll 
	$('#myCarousel').bind('mousewheel DOMMouseScroll', function(e){

	        if(e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
	            $(this).carousel('prev');
				
	        }
	        else{
	            $(this).carousel('next');
				
	        }
	    });

	//scroll slides on swipe for touch enabled devices 

	 	$("#myCarousel").on("touchstart", function(event){
	 
	        var yClick = event.originalEvent.touches[0].pageY;
	    	$(this).one("touchmove", function(event){

	        var yMove = event.originalEvent.touches[0].pageY;
	        if( Math.floor(yClick - yMove) > 1 ){
	            $(".carousel").carousel('next');
	        }
	        else if( Math.floor(yClick - yMove) < -1 ){
	            $(".carousel").carousel('prev');
	        }
	    });
	    $(".carousel").on("touchend", function(){
	            $(this).off("touchmove");
   */
   
   $(document).ready(function() {
	    $('.carousel').carousel({
	      interval: 6000
	    })
	  });
   
  </script>
</head>
<body>
<%@ include file = "header.jsp" %>
<body style=" background-color:#000000">
<section class="slide-wrapper">
<div class="container">
<div id="myCarousel" class="carousel slide">
  <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <!--  <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
       -->
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <div class="fill" style=" background-color:#48c3af; background-image:url(${pageContext.request.contextPath}/resources/img/2.jpg);"></div>
      </div>
      <div class="item">
        <div class="fill" style="background-color:#b33f4a;background-image:url(${pageContext.request.contextPath}/resources/img/4.jpg);"></div>
      </div>
        <%-- <div class="item">
        <div class="fill" style="background-color:#b33f4a;background-image:url(${pageContext.request.contextPath}/resources/img/1.jpg);"></div>
      </div>
        <div class="item">
        <div class="fill" style="background-color:#b33f4a;background-image:url(${pageContext.request.contextPath}/resources/img/2.jpg);"></div>
      </div> --%>
     
</div>
</div>
</div>




<!-- 
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      
    </ol>

    Wrapper for slides
    <div class="carousel-inner" role="listbox">

      

   <div class="item active">
        <img src="resources/img/2.jpg" class= alt="Chania" style="width:100%; height:600 px;">
        <div class="carousel-caption">
          <h3>Jersey cr7</h3>
          <p>CRISTIANO RONALDO UNIVERSAL SUPERSTAR</p>
        </div>
      </div>
    
    
      <div class="item">
        <img src="resources/img/4.jpg" alt="Flower" style="width:100%; height:600 px;">
        <div class="carousel-caption">
          <h3>IBRA</h3>
          <p>THE INCREDIBLE ZLATAN </p>
        </div>
      </div>
  
    </div>

    Left and right controls
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> -->



 <c:if test="${pageContext.request.userPrincipal.name  != 'lovely@gmail.com'}">

<div class="container1"  style=" background-color:#000000">  
<h2 style="color:#fff">Choose Your Sport</h2><br>  
 
  <div class="row">
   <c:forEach var="designatee" items="${catego}">
    <div class="col-sm-4">
      <div class="panel panel-primary">
       
            <div class="panel-heading" > </div>
             <div class="panel-footer"><a href="catpro?id=${designatee.c_id}"> ${designatee.c_title}</a></div>
           
        
        
       
      </div>
  </div>
    </c:forEach> 
  </div>
 
  </div> 
  </c:if>
  </section>

<%@ include file = "footer.jsp" %>
</body>
</html>
