<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>
<h2>액션태그 - UseBean</h2>
<jsp:useBean id="person" class="common.Person" scope="request" />

<h3>빈의 필드 설정</h3>
<jsp:setProperty property="name" value="홍길동" name="person"/>
<jsp:setProperty property="age" value="20" name="person"/>

<h3>빈의 필드값 읽기</h3>
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
</ul>

<h3>실습 : 김철수 17세</h3>
<ul>
<%
Person person2 = new Person();
person2.setName("김철수");
person2.setAge(17);
%>
<li>이름 : <%= person2.getName() %></li>
<li>나이 : <%= person2.getAge() %></li>
</ul>
</body>
</html>