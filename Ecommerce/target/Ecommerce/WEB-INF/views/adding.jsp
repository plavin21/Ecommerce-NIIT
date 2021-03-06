<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <style >
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

.home { 
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width:300px;
	height:300px;
}
.home h2 { 
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




h2
{
 color:#fff;
 
}
body
{
color:#fff;
}



select {

  /* styling */
  background-color: #000;
  border:thin solid white;
  border-radius: 4px;
  display: inline-block;
  font: inherit;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;

  /* reset */

  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}


/* arrows */


select.classic:focus {
 
  background-repeat: no-repeat;
  border-color: red;
  outline: 0;
}


</style>
</head>

<body>

<body style=" background-color:#000000" >
<%@ include file = "header.jsp" %>
<div class="container">
  <h2>Welcome Admin</h2>
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">CATEGORY</a></li>
    <li><a data-toggle="pill" href="#menu1">SUPPLIER</a></li>
    <li><a data-toggle="pill" href="#menu2">PRODUCT</a></li>
   
  </ul>
  
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>category</h3>
     
     <form method="post" action="addC" enctype="multipart/form-data">
    	<input type="text" name="cname" placeholder="category" required="required" />
    	<input type="file" name="cimg" placeholder="browse" required="required" />
       <button type="submit" class="btn btn-primary btn-block btn-large" >Add</button>
      
    </form>
     
        </div>
    <div id="menu1" class="tab-pane fade">
      <h3>supplier</h3>
     <form method="post" action="addS">
    	<input type="text" name="sname" placeholder="supplier" required="required" />
    	<input type="text" name="sno" placeholder="Phone NO" required="required" />
    	<input type="text" name="saddr" placeholder="Address" required="required" />
       <button type="submit" class="btn btn-primary btn-block btn-large" >Add</button>
      
    </form>
    
       </div>
    <div id="menu2" class="tab-pane fade">
      <h3>product</h3>
      <form method="post" action="addP" enctype="multipart/form-data">
      
      <input type="text" name="pname" placeholder="product name" required="required" />

  

        <select name="cat" class="classic" style="color:#fff; width:100%; overflow:hidden" >
<option value="desigType">select Category </option>
<c:forEach var="designatee" items="${catego}">
                       
                            <option value="${designatee.c_id}"> ${designatee.c_title} </option>
                       
                    </c:forEach>         
        

  
</select>


<br>
<br>
<br>


   


        <select name="supp" class="classic" style="color:#fff; width:100%; overflow:hidden"  >
<option value="desigType"> select Supplier </option>
 <c:forEach var="designate" items="${suppli}">
                       
                            <option value="${designate.s_id}">${designate.s_name}</option>
                       
                    </c:forEach> 
</select>



        
    	<input type="text" name="desc" placeholder="description" required="required" />
    	<input type="text" name="price" placeholder="Price" required="required" />
    	<input type="text" name="stock" placeholder="stock" required="required" />
    	<input type="file" name="img" placeholder="browse" required="required" />
    	<!-- <input type="text" name="desc" placeholder="Description" required="required" /> -->
       <button type="submit" class="btn btn-primary btn-block btn-large" >Add</button>
      
      
    </form>
       </div>
    
  </div>
</div>
<%@ include file = "footer.jsp" %>
</body>
</html>