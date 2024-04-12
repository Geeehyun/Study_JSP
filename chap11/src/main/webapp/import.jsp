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
<h2>import</h2>
<c:set var="reqVal" value="문자열" scope="request"/>
<c:import url="import1.jsp" var="content">
	<c:param name="param1" value="문자열1" />
	<c:param name="param2" value="문자열2" />
</c:import>

<h3>다른 문서 삽입</h3>
${content}

<h3>외부 문서 삽입</h3>
<iframe src="import2.jsp" style="width:100%; height:800px"></iframe>
</body>
</html>