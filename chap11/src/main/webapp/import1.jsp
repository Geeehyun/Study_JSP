<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>다른 문서 입니다.</h4>
<ul>
	<li> 저장된 값 : ${requestScope.reqVal}</li>
	<li> 매개변수1 : ${param.param1}</li>
	<li> 매개변수2 : ${param.param2}</li>
</ul>
</body>
</html>