<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Log In</title>
  
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
	
	
	}
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
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
.login { 
	position:relative ;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	margin-top: 20px;
	width:300px;
	height:300px;
}
.login h1 { 
color: #fff;
 letter-spacing:1px; 
 text-align:center;
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

 </style>
</head>
<body>
<%@ include file = "header.jsp" %>
<body style=" background-color:#000000">




<div class="container">  
<div class="login">
	  <p style="color:red;">${invalid }</p>
	<h1>Login</h1>
    <form action="j_spring_security_check" method="post">
    	<input type="text" pattern="[a-z0-9._%+-]+@[a-z]+\.[a-z]{2,3}$"  title="rahul@gmail.com" name="j_username" placeholder="Username" required="required" />
        <input type="password" name="j_password" placeholder="Password" required="required" />
        <button type="submit" class="btn btn-primary btn-block btn-large" >Login</button>
      <p class="message" style="color: #fff">Not registered? <a href="sign" style="color:#40ff00">Create an account</a></p>
    </form>
  
</div>
</div>
<%@ include file = "footer.jsp" %>

</body>
</html>
