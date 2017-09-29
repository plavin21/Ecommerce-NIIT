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


</head>

<body>
<%@ include file = "header.jsp" %>

<body style=" background-color:#000000" >

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
<%@ include file = "footer.jsp" %>
</body>
</html>