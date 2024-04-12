<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.Person" %>
<%
pageContext.setAttribute("pageInt", 1000);
pageContext.setAttribute("pageStr", "페이지 영역 문자열");
pageContext.setAttribute("pageClass",  new Person("홍길동", 20));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>page 영역 속성값</h2>
<%
int pageInt = (Integer) (pageContext.getAttribute("pageInt"));
String pageName = pageContext.getAttribute("pageStr").toString();
Person pagePerson = (Person) (pageContext.getAttribute("pageClass"));
%>
<ul>
	<li><%= pageInt %></li>
	<li><%= pageName %></li>
	<li><%= pagePerson %></li>
</ul>

<%@ include file="includePage.jsp" %>

<h2>페이지 이동 후 page 영역 접근</h2>
<a href="page2.jsp">페이지 이동 후 접근</a>
</body>
</html>