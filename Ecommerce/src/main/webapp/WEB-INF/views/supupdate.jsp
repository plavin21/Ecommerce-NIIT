<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Supplier</title>

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
input[type=text] {
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
.catupdate { 
	position:relative ;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	margin-top: 20px;
	width:300px;
	height:300px;
}
.catupdate h1 { 
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




<form action="updatesupplier" method="post">

      <table >
     

<tr><td>SUPPLIER  ID</td><td><input type="number"   name="supid"   value="${supplier.s_id }" style="opacity: 0.65; cursor: not-allowed;width:100%" ></td></tr>
<tr><td>Supplier NAME</td><td><input type="text"  name="supname" required style="width:100%"  value="${supplier.s_name }"></td></tr>


<tr><td></td><td><input id="submit" class="btn btn-info btn-md" name="submit" type="submit" value="UPDATE" style="width:100%"></td></tr>

</table>

</form> 
<%@ include file = "footer.jsp" %>




</body>
</html>