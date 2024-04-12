<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Formatting 태그</h2>
<c:set var="num1" value="4444"/>
콤마 : <fmt:formatNumber value="${num1}" /> <br>
콤마 X : <fmt:formatNumber value="${num1}" groupingUsed="false"/> <br>   <!-- groupingUsed 콤마 표시 여부 -->

통화 : <fmt:formatNumber value="${num1}" type="currency"/> <br>

<h2>날짜태그</h2>
<c:set var="today" value="<%= new Date() %>"/>

전체 : <fmt:formatDate value="${today}" type="date" dateStyle="full" /> <br>
short : <fmt:formatDate value="${today}" type="date" dateStyle="short" /> <br>
long : <fmt:formatDate value="${today}" type="date" dateStyle="long" /> <br>
default : <fmt:formatDate value="${today}" type="date" dateStyle="default" /> <br>

<h2>시간태그</h2>
전체 : <fmt:formatDate value="${today}" type="time" dateStyle="full" /> <br>
short : <fmt:formatDate value="${today}" type="time" dateStyle="short" /> <br>
long : <fmt:formatDate value="${today}" type="time" dateStyle="long" /> <br>
default : <fmt:formatDate value="${today}" type="time" dateStyle="default" /> <br>

<h2>날짜/시간태그</h2>
전체 : <fmt:formatDate value="${today}" type="both" dateStyle="full" /> <br>
패턴 : <fmt:formatDate value="${today}" type="both" pattern="yyy-MM-dd HH:mm:ss" /> <br>

<h2>타임존 설정</h2>
<fmt:timeZone  value="GMT">
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>
 <br>
<fmt:timeZone  value="America/Chicago">
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>
</body>
</html>