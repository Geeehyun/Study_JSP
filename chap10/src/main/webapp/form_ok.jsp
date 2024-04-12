<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 폼 처리</title>
</head>
<body>
<h2>폼값 처리</h2>
<ul>
	<li>이름 : ${param.name} </li>
	<li>성별 : ${param.gender} </li>
	<li>학력 : ${param.grade} </li>
	<li>관심사항 : ${paramValues.interest} </li>
</ul>
</body>
</html>