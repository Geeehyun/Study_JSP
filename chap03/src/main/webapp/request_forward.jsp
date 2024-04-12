<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 영역</title>
</head>
<body>
<h2>request forward 로 전달 받은 페이지</h2>
<%
	String reqStr1 = (String) request.getAttribute("reqStr1");
	Person reqPerson = (Person) request.getAttribute("reqPerson");
%>

<ul>
	<li>reqStr1 객체 : <%= (reqStr1 == null ? "null" : reqStr1) %></li>
	<li>reqPerson 객체  : <%= (reqPerson == null ? "null" : reqPerson) %></li>
</ul>

<h2>request forward 파라미터로 전달 받은 페이지</h2>
<ul>
<%
	request.setCharacterEncoding("utf-8");
	out.print("<li>" + request.getParameter("name") + "</li>");
	out.print("<li>" + request.getParameter("ename") + "</li>");
	out.print("<li>" + request.getParameter("age") + "</li>");
%>
</ul>
</body>
</html>