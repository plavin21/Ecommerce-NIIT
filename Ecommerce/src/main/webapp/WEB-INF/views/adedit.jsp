<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>admin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>

<body>
<%@ include file = "header.jsp" %>

<body style=" background-color:#000000" >

<div class="container">  
<h2 style="color:#fff">OPTIONS </h2><br>  
  <div class="row">
    <div class="col-sm-6" style="text-align:center">
      
        <h3 style="color:white; text-align:center">ADD</h3>
        <a href="adding"><img src="${pageContext.request.contextPath}/resources/img/addmy.png" class="img-responsive" width=75%  alt="Image"></a>
        
      </div>
    
    <div class="col-sm-6"> 
    
        <h3 style="color:white;">UPDATE</h3>
        <a href="options"><img src="${pageContext.request.contextPath}/resources/img/images.png" class="img-responsive" width=75%  alt="Image"></a>
        
      </div>
    </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>