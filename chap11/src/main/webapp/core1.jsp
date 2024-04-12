<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - core 태그</title>
</head>
<body>
<h2>JSTL - c:set 타그</h2>
<c:set var="var1" value="100" />
<c:set var="var2" value="${var1 mod 5 }" />
<c:set var="var3" value="<%=new Date() %>" />
<c:set var="var4" > 값</c:set>

<h2>JSTL - c:set 태그출력</h2>
<ul>
	<li> var1 : ${pageScope.var1} </li>
	<li> var2 : ${var2} </li>
	<li> var3 : ${var3} </li>
	<li> var4 : ${var4}  </li>
	<li> var4 : <%=pageContext.getAttribute("var4") %></li>
</ul>

<h2></h2>
<c:set var="person" value='<%= new Person("홍길동", 20) %>' scope="request" />
<ul>
<li>이름 : ${requestScope.person.name }</li>
<li>나이 : ${requestScope.person.age }</li>
<li>이름 : ${requestScope.person.getName() }</li>
<li>나이 : ${requestScope.person.getAge() }</li>
<li>이름 : ${person.name }</li>
<li>나이 : ${person.age }</li>
</ul>
</body>
</html>