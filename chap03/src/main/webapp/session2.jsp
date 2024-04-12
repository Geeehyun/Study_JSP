<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - session 영역</title>
</head>
<body>
<%

out.print("name : " + session.getAttribute("name") + "<br>");
out.print("user_id : " + session.getAttribute("user_id") + "<br>");
out.print("email : " + session.getAttribute("email") + "<br>");

Person p = (Person) session.getAttribute("person");
out.print("person : 이름 - " + p.getName() + "나이 - " + p.getAge() + "<br>");

ArrayList<String> lists = (ArrayList<String>) session.getAttribute("lists");
for (String e : lists ) {
	out.print(e + "<br>");
}
%>
</body>
</html>