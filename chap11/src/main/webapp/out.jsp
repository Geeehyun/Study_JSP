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
<!-- JSTL 에서 out은 스크립트요소의 표현식과 거의 동일 -->
<c:set var="txt" >
	<span style="color : red"> 문자열을 출력해주세요.</span>
</c:set>

<h2>출력문자</h2>
<c:out value="${txt}" escapeXml="false" />  <!-- 태그를 제대로 읽음 -->
<c:out value="${txt}" escapeXml="true" />  <!-- 태그를 냅다 문자로 읽음 -->
</body>
</html>