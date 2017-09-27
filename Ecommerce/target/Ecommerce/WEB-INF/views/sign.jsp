<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
      <%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  
  
 
body { 
	width: 100%;
	height:100%;
	font-family: 'Open Sans', sans-serif;
	background: #000000;
	color: #fff;
	}
input[type=text],input[type=email], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
.signup { 
	position: absolute;
	top: 35%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width:300px;
	height:250px;
}
.signup h1 { 
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
input { 
	width: 100%; 
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	
	border-radius: 4px;
	
}

 .footer {
 text-align: center;
    position: absolute;
    bottom: 0;
    width: 100%;
  
    background-color: #222;
}  </style>
</head>
<body>
<body style=" background-color:#000000">
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
        <li ><a href="index.jsp">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop by category <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Sports wears</a></li>
            <li><a href="#">Jerseys</a></li>
            <li><a href="#">accessories</a></li>
          </ul>
        </li>
        <li><a href="#">Today's offer</a></li>
        <li><a href="#">About</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="active"><a href="log.jsp"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
     </ul>
      
    </div>
    
  </div>
 
</nav>
  



<div class="container">  
<div class="signup">
  	<h1>Signup </h1>
  <form method="post" action="login" >    
  	
   		<input type=email name="email" placeholder="Email ID" required="required" />
   		<input type=text name="mobile" placeholder="Phone NO" required="required" />
        <input type=text name="name" placeholder="UserName" required="required" />
         <input type=text name="address" placeholder="Address" required="required" />
        <input name="password" input type="password" id="password"  placeholder="Password" required="required" />
        

    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
     <button type="submit" class="btn btn-primary btn-block btn-large" onclick=" validatePassword()" >Sign Up</button>
      
      
    
  </form>
    </div></div><br><br>

<footer class="footer">
<div class="row-fluid">


<p>&copy; 2017 sportzarena.com<p>

 </div>
</footer>

</body>
</html>
