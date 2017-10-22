<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}

@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #4d4dff;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 15px;
  padding: 10px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

</style>
  
</head>
<body>

<body style=" background-color:#000000" >
<%@ include file = "header.jsp" %>


<div class="container">
	<table id="update"  style="color:#fff" >
    				<thead>
						<tr>
							<th style="width:50%">PRODUCT LIST</th>
							
							
							
						</tr>
					</thead>
					<c:forEach var="designatee" items="${productlis}">
					<%-- <c:forEach var="design" items="${catego}"> --%>
					<tbody>
						<tr>
	<td data-th="Product">
		<div class="row">
	<div class="col-sm-2 "><img src="img/3.jpg" alt="Chania" width="100" height="100" class="img-responsive"/></div>
			
			<div class="col-sm-10">
			  
			<h4 class="nomargin"> ${designatee.name}</h4>
			<p>        </p>
			
		</div>
     </div>
	</td>
	<td data-th="update"><a  href="proupd?id=${designatee.id}<%-- ,id2=${design.c_id} --%>"><button class="button" 
	style="vertical-align:middle"><span>Edit </span></button></a></td>
	<td data-th="update1"><a href="prodel?id=${designatee.id}"><button class="button" 
	style="vertical-align:middle"><span>Delete</span></button></a></td>
	
	</tr>
</tbody>
	</c:forEach>
	<%--  </c:forEach> --%>

</table>
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>
	