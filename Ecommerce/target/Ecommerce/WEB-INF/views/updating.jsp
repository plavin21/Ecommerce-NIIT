<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
					<tbody>
						<tr>
	<td data-th="Product">
		<div class="row">
	<div class="col-sm-2 "><img src="img/3.jpg" alt="Chania" width="100" height="100" class="img-responsive"/></div>
			<div class="col-sm-10">
			<h4 class="nomargin">MAN UTD JERSEY</h4>
			<p>paul pogba man utd t shirt NO 6
	</p>	</div>
     </div>
	</td>
	<td data-th="update">EDIT</td>
	<td data-th="update1">DELETE</td>
</tr>
</tbody>
</table>
</div>

<%@ include file = "footer.jsp" %>
</body>
</html>