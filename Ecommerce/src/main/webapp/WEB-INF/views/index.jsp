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
  height:95vh;
  width:100%;
  background-position:center center;
  background-size:cover;
}
.slide-wrapper{display:inline;}
.slide-wrapper .container{padding:0px;}


.carousel-indicators li{display:block; margin-bottom:5px; border:1px solid #00a199; }
.carousel-indicators li.active{margin-bottom:5px; background:#00a199;}


  
  </style>
  

</head>
<body>
<%@ include file = "header.jsp" %>
<body style=" background-color:#000000">

<div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
   

   
    <div class="carousel-inner" role="listbox">

      

   <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/img/2.jpg" class= alt="Chania" style="width:100%; height:600 px;">
        <div class="carousel-caption">
          <h3>Jersey cr7</h3>
          <p>CRISTIANO RONALDO UNIVERSAL SUPERSTAR</p>
        </div>
      </div>
    
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/img/4.jpg" alt="Flower" style="width:100%; height:600 px;">
        <div class="carousel-caption">
          <h3>IBRA</h3>
          <p>THE INCREDIBLE ZLATAN </p>
        </div>
      </div>
  
    </div>

   
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



 <c:if test="${pageContext.request.userPrincipal.name  != 'admin123@gmail.com'}">

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

