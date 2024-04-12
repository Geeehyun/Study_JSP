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
<h2>url 태그</h2>
<c:url value="http://localhost:8080/chap10/form.jsp" var="url">
	<c:param name="param1" value="값1"/>
	<c:param name="param2" value="값2"/>
</c:url>
<a href="${url}" >이동</a>
</body>
</html>