<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//Person p2 = (Person) request.getParameter("objPerson");
// 위 코드 오류남 : 이유, 파라미터로 전달할 때는 String 형태로 넘어가는데, Person 타입으로 형변환 할 수 있는지 여부를 알 수 없어서 오류 남.
%>
<h2>액션 태그로 한 번에 받기</h2>
<jsp:useBean id="person" class="common.Person" scope="request" />
<jsp:setProperty name="person" property="*" />      <!-- input 태그에 설정한 name을 기준으로 알아서 setter 에 넣어줌 -->
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
</ul>
</body>
</html>