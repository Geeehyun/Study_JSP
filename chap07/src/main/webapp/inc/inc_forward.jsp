<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 포워드</title>
</head>
<body>
<h2>인클루드 페이지에서 Attribute 확인</h2>
<ul>
	<li>pgae 영역 : <%= pageContext.getAttribute("pageAttr") %></li>    <!-- page Attribute 는 못갖고 옴  -->
	<li>request 영역 : <%= request.getAttribute("reqAttr") %></li>
</ul>
</body>
</html>