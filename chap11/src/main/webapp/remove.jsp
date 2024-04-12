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
<h2>reomve 태그</h2>
<c:set var="val" value="Page 영역"/>
<c:set var="val" value="Request 영역" scope="request"/>
<c:set var="val" value="Session 영역" scope="session"/>
<c:set var="val" value="Application 영역" scope="application"/>

<h2>session 영역 값 삭제</h2>
<c:remove var="val" scope="session"/>
<%-- <c:remove var="val"/> scope 안주면 해당 변수명 가는 변수 모든 영역에서 삭제 함 --%>
<ul>
	<li>pageScope.val : ${pageScope.val }</li>
	<li>requestScope.val : ${requestScope.val }</li>
	<li>sessionScope.val : ${sessionScope.val }</li>
	<li>applicationScope.val : ${applicationScope.val }</li>
	<li>val : ${val }</li> <!-- 조회할 때 scope 명시 안해주면 기본 영역에서 찾아옴, 거기 없으면 범위를 하나씩 늘려가면서 찾아옴 -->
</ul>
</body>
</html>