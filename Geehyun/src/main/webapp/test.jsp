<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>헤더란?</h2>
<p>헤더1 : ${ header.cookie }</p>
<p>헤더2 : <%= request.getHeader("user-agent") %></p>

<p>헤더값들1 : ${ headerValues }</p>
<p>헤더값들2 :<% 
Enumeration<String> test = request.getHeaders("user-agent"); 
while(test.hasMoreElements()) {
	out.print((String)test.nextElement());
}
%></p>

<p>${not true }</p>


</body>
</html>