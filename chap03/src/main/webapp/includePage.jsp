<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.Person" %>

<%
int pageInt2 = (Integer) (pageContext.getAttribute("pageInt"));
String pageName2 = pageContext.getAttribute("pageStr").toString();
Person pagePerson2 = (Person) pageContext.getAttribute("pageClass");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - page Context</title>
</head>
<body>

<ul>
	<li><%= pageInt2 %></li>
	<li><%= pageName2 %></li>
	<li><%= pagePerson2 %></li>
</ul>

</body>
</html>