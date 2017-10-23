<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 
<title>Insert title here</title>
<style>
.navbar-header {
    float: left;
    padding: 15px;
    text-align: center;
    width: 100%;
}
.navbar-brand {float:none;}
</style>


</head>
<body>
<body style=" background-color:#000000">



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   	
    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
    
   
      
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a class="navbar-brand" href="./"  onMouseOver="this.style.color='#ffff4d'"
   onMouseOut="this.style.color='#ffffb3'" >SPORTZ ARENA</a>
  
  </li> 
    
       
         
           <c:if test="${pageContext.request.userPrincipal.name  != 'lovely@gmail.com'}">
             <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop by category <span class="caret"></span></a>
          <ul class="dropdown-menu">
          <c:forEach var="designatee" items="${catego}">
            <li value="${designatee.c_id}"><a href="catpro?id=${designatee.c_id}"> ${designatee.c_title}</a> </li>
           </c:forEach> 
           </ul>
           </li>
            
            </c:if>
            
          
        
       
       
           
              <c:if test="${pageContext.request.userPrincipal.name  == 'lovely@gmail.com'}">
             
               <li><a href="adedit">Admin</a></li>           
               
            </c:if> 
            
          
           <c:if test="${pageContext.request.userPrincipal.name != null && pageContext.request.userPrincipal.name  != 'lovely@gmail.com'}">
            <li>       
            <a href="cart"><span class="glyphicon">&#xe116;</span>My Cart<i class="fa fa-shopping-cart" ></i></a> 
            </li> 
            </c:if> 
            
            <li>  
            <c:if test="${pageContext.request.userPrincipal.name == null }">
                <a href="log">Login</a>
            </c:if>    
            </li>  
             <li>  
            <c:if test="${pageContext.request.userPrincipal.name  != null}">
					<li ><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
					<li><a href='<c:url value="/j_spring_security_logout" />'>Logout</a></li>
				</c:if>
            </li>  
        
             </ul>
    
  <form class="navbar-form navbar-right">
  <div class="input-group">
    <input type="text" class="form-control" placeholder="Search">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
</form>
</div>

  </div>
</nav> 
  

</body>
</html>