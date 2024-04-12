<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 포워드</title>
</head>
<body>
<%
pageContext.setAttribute("pageAttr", "화요일");
request.setAttribute("reqAttr", "불금");
%>
<h2>액션태그 - 포워드</h2>
<jsp:forward page="inc/inc_forward.jsp" />
</body>
</html>