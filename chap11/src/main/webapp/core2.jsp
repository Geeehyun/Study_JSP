<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어태그</title>
</head>
<body>
<h2>List 컬렉션 사용</h2>
<%
ArrayList<Person> pList = new ArrayList<Person>();
pList.add(new Person("홍길동", 20));
pList.add(new Person("임꺽정", 21));
%>

<c:set var="person" value="<%= pList %>" scope="request" />

<ul>
	<li>이름 : ${requestScope.person[0].name }</li>
	<li>나이 : ${person[0].age }</li>
</ul>

<h2>Map 컬렉션 이용</h2>
<%
Map<String, Person> pMap = new HashMap<String, Person>();
pMap.put("p1", new Person("이몽룡", 16));
pMap.put("p2", new Person("성춘향", 14));
%>
<c:set var="pMap" value="<%= pMap %>" scope="request" />
<ul>
	<li>이름 : ${requestScope.pMap.p1.name }</li>
	<li>나이 : ${pMap.p1.age }</li>
</ul>
</body>
</html>