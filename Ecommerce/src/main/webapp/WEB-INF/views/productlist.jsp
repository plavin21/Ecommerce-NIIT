<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
<style>

.thumbnail img
{

width: 100%;
  height: 75vh;
}
.thumbnail
{
    margin-bottom: 20px;
    padding: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
   
}

.item.list-group-item
{
    float: none;
    width: 100%;
    background-color: #222;
    margin-bottom: 10px;
}
.item.list-group-item:nth-of-type(odd):hover,.item.list-group-item:hover
{
    background: #222;
}

.item.list-group-item .list-group-image
{
    margin-right: 10px;
    width: 100%;
    height:50vh;
    
}
.item.list-group-item .thumbnail
{
    margin-bottom: 0px;
}
.item.list-group-item .caption
{
    padding: 9px 9px 0px 9px;
}
.item.list-group-item:nth-of-type(odd)
{
    background: #eeeeee;
}

.item.list-group-item:before, .item.list-group-item:after
{
    display: table;
    content: " ";
}

.item.list-group-item img
{
    float: left;
}
.item.list-group-item:after
{
    clear: both;
}
.list-group-item-text
{
    margin: 0 0 11px;
}
</style>


</head>
<body>
<%@ include file = "header.jsp" %>


<div class="container">
    
    <div id="products" class="row list-group" >
      <c:forEach var="design" items="${productli}">
        <div class="item  col-xs-4 col-lg-4">
            <div class="thumbnail" style="background-color:#222222; ">
           
                <img class="group list-group-image" src="resources/img/${design.img }" alt="" />
                
                <div class="caption" style="color:white;">
                <div class="row">
                 <div class="col-md-6">
                    <h4 class="group inner list-group-item-heading">
                        ${design.name}</h4>
                          
                        </div>
                        
 <div class="row-md-6">
           <p class="lead">
           					&nbsp;
                            <span>&#8377;</span>
                              	 ${design.price}</p>  
 </div>

</div>

                        
                   
                     <div class="row">
                    
                    
                       
                        <div class="col-md-6">
                            <a class="btn btn-success" href="prolis?id=${design.id}&c_id=${design.category.c_id}">View more</a>
                        </div>
                         
                    </div>
                </div>
            </div>
        </div>
      </c:forEach>  
        </div>
	</div>	

<%@ include file = "footer.jsp" %>
</body>
</html>