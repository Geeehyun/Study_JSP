<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="common.Person" %>

<%
Person p = new Person("홍길동", 30);
session.setAttribute("person", p);

session.setAttribute("name", "홍길동");
session.setAttribute("user_id", "test1");
session.setAttribute("email", "email@www.net");

ArrayList<String> lists = new ArrayList<String>();
lists.add("리스트1");
lists.add("컬렉션2");

session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - session 영역</title>
</head>
<body>
<h2>세션 저장 페이지 이동 후 세션 조회</h2>
<a href="session2.jsp">세션 이동</a>
</body>
</html>