<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
  .footer { text-align: center;background-color:#222; color:#eee; padding: 28px 8px 18px; margin-top: 18px;}
.footer a{color:#bbb; font-size:12px;}
  </style>
</head>

<body>

<body style=" background-color:#000000" >
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">SPORTZ ARENA</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="#">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop by category <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Sports wears</a></li>
            <li><a href="#">Jerseys</a></li>
            <li><a href="#">accessories</a></li>
          </ul>
        </li>
        <li><a href="#">Today's offer</a></li>
        <li class="active"><a href="admin">Admin</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="log"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="cart"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
     </ul>
      
    </div>
    
  </div>
  <form class="navbar-form navbar-right">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
</nav>

<div class="container">  
<h2 style="color:#fff">OPTIONS </h2><br>  
  <div class="row">
    <div class="col-sm-6">
      <div class="panel panel-primary">
        <div class="panel-heading">ADD</div>
        <div class="panel-body"><a href="adding"><img src="img/add1.png" class="img-responsive" width=75%  alt="Image"></a></div>
        <div class="panel-footer"></div>
      </div>
    </div>
    <div class="col-sm-6"> 
      <div class="panel panel-primary">
        <div class="panel-heading">UPDATE</div>
        <div class="panel-body"><a href=""><img src="img/update.png" class="img-responsive" width=75%  alt="Image"></a></div>
        <div class="panel-footer"></div>
      </div>
    </div>
 </div>
 </div>
<footer class="footer">
<div class="row-fluid">

<div class="span2">
<h3>Information</h3>
<a href="contact.html">CONTACT</a><br>

<a href="#">LEGAL NOTICE</a><br>
<a href="#">TERMS AND CONDITIONS</a><br>
<a href="#">ABOUT US</a><br>
 </div>

 <br>
<p>&copy; 2017 sportzarena.com<p>

 </div>
</footer>
</body>
</html>