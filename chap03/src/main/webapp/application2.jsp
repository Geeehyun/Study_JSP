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
<h2>application 조회</h2>
<%
	// application.jsp 실행해서 어플리케이션 속성 설정한 후 실행해야 함.
	Map<String, Person> map = (Map<String, Person>) application.getAttribute("map");

	Set<String> keys = map.keySet();
	for(String key : keys) {
		Person person = map.get(key);
		out.print(String.format("이름 : %s, 나이 : %d <br>", person.getName(), person.getAge()));
	}
	
	for(String key : keys) {
		out.print(key + " 은 바로! => " + map.get(key)+ "<br>");
	}
%>
</body>
</html>