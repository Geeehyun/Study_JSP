<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어태그</title>
</head>
<body>
<h2>리다이렉트 전송 페이지</h2>
<c:set var="reqVal" value="전송문자열" scope="request"/>  
<c:set var="reqVal" value="전송문자열" scope="session"/>  
<c:redirect url="redirect2.jsp">   
	<c:param name="param1" value="문자열1"/>
	<c:param name="param2" value="문자열2"/>
</c:redirect>
<!-- response.sendRedirect()와 유사 + back이 안나옴  + request 값은 못들고감.  -->
</body>
</html>