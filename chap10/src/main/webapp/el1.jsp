<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장 객체 전송</title>
</head>
<body>
<h2>EL forward 페이지</h2>
<ul>
	<li>PAGE 영역 : ${pageScope.scope} </li>
	<li>REQUEST 영역 : ${requestScope.scope} </li>
	<li>SESSION 영역 : ${sessionScope.scope} </li>
	<li>APPLICATION 영역 : ${applicationScope.scope} </li>
	
	<li>현재 영역 : ${scope} </li>  
	<!-- 냅다 변수명만 적으면 기본 영역에서 해당 변수를 찾아 갖고음 -->
	<!-- 기본적으로 기본영역은 PAGE 영역이지만, 포워딩 할 경우 REQUEST 영역이 기본 영역이 됩니다. -->
</ul>
</body>
</html>