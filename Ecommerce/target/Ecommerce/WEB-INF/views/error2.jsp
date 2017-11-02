<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>access</title>
<style>
.container {
    position: relative;
    text-align: center;
    color: white;
}

.top-left {
    position: absolute;
    top: 8px;
    left: 16px;
}

</style>
</head>
<body style="background-color:black;" >
<div class="container">
  <img src="${pageContext.request.contextPath}/resources/img/vendhq.png" alt="Norway" style="width:100%;">
  
  <div class="top-left">
 <c:if test="${pageContext.request.userPrincipal.name  != 'admin123@gmail.com'}">
  <a href="/Ecommerce" >BACK TO HOME</a>
  </c:if>
  <c:if test="${pageContext.request.userPrincipal.name  == 'admin123@gmail.com'}">
  <a href="/Ecommerce/admin" >BACK TO HOME</a>
  </c:if>
  </div>
</div>

</body>
</html>