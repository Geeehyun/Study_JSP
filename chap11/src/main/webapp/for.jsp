<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
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
<h2>forEach 태그</h2>
<c:forEach var="i" begin="1" end="10" step="1">
	<p>${i} 번째 입니다.</p>
</c:forEach>

<h2>스클립틀릿</h2>
<%
for(int i= 1; i <=10; i++){
	out.print("<p>"+i+"번째 입니다.</p>");
}
%>

<h2>varStatus 상태</h2>
<c:forEach var="i" begin="1" end="10" step="1" varStatus="Loop">
	count : ${Loop.count}, 
	index : ${Loop.index}, 
	current : ${Loop.current}, 
	first : ${Loop.first}, 
	last : ${Loop.last}<br>
</c:forEach>

<h2>향상된 for문</h2>
<%
String[] colors = {"red", "yellow", "orange", "green", "blue", "purple", "navy"};
%>
<c:set var="colors" value="<%=colors %>"/>
<c:forEach var="i" items="${colors}" >
${i} <br> 
</c:forEach>
<h2>List 컬렉션</h2>
<%
LinkedList<Person> list = new LinkedList<Person>();
list.add(new Person("홍길동", 20));
list.add(new Person("임꺽정", 40));
%>
<c:set var="list" value="<%=list %>"/>
<c:forEach var="i" items="${list }">
	이름 : ${i.name} / 나이 : ${i.age} <br>
</c:forEach>

<h2>Map 컬렉션</h2>
<%
Map<String, Person> map = new HashMap<String, Person>();
map.put("1", new Person("홍길동", 20));
map.put("2", new Person("임꺽정", 40));
%>
<c:set var="map" value="<%= map %>" />
<c:forEach var="i" items="${map}" >
Key : ${i.key},
name  : ${i.value.name}
age  : ${i.value.age}<br>
</c:forEach>

<h2>forTokenS</h2>
<%
String colors2 = "red, yellow, orange, green, blue, purple, navy";
%>
<c:forTokens var="i" items="<%= colors2 %>" delims = ", ">
	<span style="color:${i}">${i}</span>
</c:forTokens>
</body>
</html>