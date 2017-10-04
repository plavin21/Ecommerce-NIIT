<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>update</title>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
}

/* Create three equal columns that floats next to each other */
.column {
    float: left;
    width: 33.33%;
    padding: 10px;
   /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
</style>
</head>
<body>
<%@ include file = "header.jsp" %>


<h2>choose the table</h2>

<div class="row">
  <div class="column" style="background-color:#aaa;">
    <h2>Category</h2>
    <p><a href=updatingc>edit/delete</a></p>
  </div>
  <div class="column" style="background-color:#bbb;">
    <h2>Supplier</h2>
    <p><a href=updatings>edit/delete</a></p>
  </div>
  <div class="column" style="background-color:#ccc;">
    <h2>Product</h2>
    <p><a href=updating>edit/delete</a></p>
  </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>