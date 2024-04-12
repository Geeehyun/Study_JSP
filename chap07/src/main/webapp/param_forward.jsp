<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
<h2>액션태그 - param - 포워드 페이지</h2>
<jsp:useBean id="person" class="common.Person" scope="request" /> <!-- param.jsp에서 request 영역에 올려놔서 따로 세팅없이 사용만 선언해주면 값 갖고올 수 있음 -->
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
	<li>param1 : <%= request.getParameter("param1") %>
	<li>param2 : <%= request.getParameter("param2") %>
	<li>param3 : <%= request.getParameter("param3") %>
</ul>

<jsp:include page="inc/inc_param.jsp"> 
	<jsp:param name="param4" value="강호동" />
	<jsp:param name="param5" value="50" />
</jsp:include>
<!-- inc_param.jsp로 갖고오면서 파라미터 보내서 갖고 옴-->
</body>
</html>