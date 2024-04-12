<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.Person" %>

<%
Object pageInt2 = pageContext.getAttribute("pageInt");
Object pageName2 = pageContext.getAttribute("pageStr");
Object pagePerson2 = pageContext.getAttribute("pageClass");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - page Context</title>
</head>
<body>

<ul>
	<li>Integer 객체 : <%= (pageInt2 == null ? "null" : pageInt2) %></li>
	<li>String 객체  : <%= (pageName2 == null ? "null" : pageName2) %></li>
	<li>Person 객체 : <%= (pagePerson2 == null ? "null" : ((Person) pagePerson2).getName()) %></li>
</ul>

</body>
</html>