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
  
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 55%;
      margin: auto;
      padding:2px; 
  }
 
  .footer { text-align: center;background-color:#222; color:#eee; padding: 28px 8px 18px; margin-top: 18px;}
.footer a{color:#bbb; font-size:12px;}
  </style>
</head>
<body>
<%@ include file = "header.jsp" %>
<body style=" background-color:#000000">


<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      

   <div class="item active">
        <img src="img/2.jpg" alt="Chania" style="width:100%; height:200 px">
        <div class="carousel-caption">
          <h3>Jersey cr7</h3>
          <p>CRISTIANO RONALDO UNIVERSAL SUPERSTAR</p>
        </div>
      </div>
    
    
      <div class="item">
        <img src="img/4.jpg" alt="Flower" style="width:100%; height:200 px">
        <div class="carousel-caption">
          <h3>IBRA</h3>
          <p>THE INCREDIBLE ZLATAN </p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
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

<div class="container">  
<h2 style="color:#fff">Choose Your Sport</h2><br>  
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">CRICKET</div>
        <div class="panel-body"><img src="img/CR.jpg" class="img-responsive" width=75%  alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">FOOTBALL</div>
        <div class="panel-body"><img src="img/FT.jpg" class="img-responsive" width=75% alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">BADMINTON</div>
        <div class="panel-body"><img src="img/BD.png" class="img-responsive"  width=75% alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">CYCLING</div>
        <div class="panel-body"><img src="img/BC.png" class="img-responsive" width=75% alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">VOLLEYBALL</div>
        <div class="panel-body"><img src="img/VL.png" class="img-responsive" width=75% alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">TENNIS</div>
        <div class="panel-body"><img src="img/TN.png" class="img-responsive" width=75% alt="Image"></div>
        <div class="panel-footer"></div>
      </div>
    </div>
  </div>
</div><br><br>

<%@ include file = "footer.jsp" %>
</body>
</html>
