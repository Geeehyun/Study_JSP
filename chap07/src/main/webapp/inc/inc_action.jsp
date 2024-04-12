<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부 파일 - 액션태그 페이지</title>
</head>
<body>
<h2>외부 파일 - 액션태그 페이지</h2>
<%
String today2 = "불금";
%>

<ul>
	<li>page 영역 속성 : <%= pageContext.getAttribute("pageAttr") %></li>
	<li>request 영역 속성 : <%= request.getAttribute("reqAttr") %> 
</ul>
</body>
</html>