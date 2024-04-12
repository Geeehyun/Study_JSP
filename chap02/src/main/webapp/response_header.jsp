<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
long date_type = sd.parse(request.getParameter("date_type")).getTime();
int no_type = Integer.parseInt(request.getParameter("no_type"));
String text_type = request.getParameter("text_type");

response.addDateHeader("date_type", date_type); //키 벨류 형태로 추가됨
response.addIntHeader("no_type", no_type);
response.addHeader("text_type", text_type);

response.setHeader("text_type", "스트링");   //헤더의 값 바꿔주기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response 응답헤더</title>
</head>
<body>

<h2>response - 응답헤더 출력</h2>

<ul>
<%
Collection<String> headerNames = response.getHeaderNames();
for(String hName : headerNames) {
	String val = response.getHeader(hName);
%>
<li><%= hName %> : <%= val %></li>
<%
}
%>
</ul>

<h2>response - 응답헤더 출력, 특정 헤더만 출력</h2>
<ul>
<%
Collection<String> no_header = response.getHeaders("no_type");
for(String noType : no_header) {
%>
<li>no_header : <%= noType %></li>
<%
// 위 출력 부분은 out.print("<li>no_header : " + noType + "</li>"); 으로 작성해도 됨.
}
%>
</ul>

</body>
</html>