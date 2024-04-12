<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application 영역</title>
</head>
<body>
<h2>application 공유</h2>
<%
	Map<String, Person> map = new HashMap<>();
	map.put("student", new Person("학생1", 20));
	map.put("student2", new Person("중학생1", 15));
	
	application.setAttribute("map", map);
%>

APPLICATION 영역에 속성 저장
</body>
</html>