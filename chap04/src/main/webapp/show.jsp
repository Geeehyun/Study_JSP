<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="chap04.CookieUtil"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String param = CookieUtil.getCookieValue(request, "paramList");
		List<String> paramList = Arrays.asList((param.replace("~", " ")).split(" "));
		String referer = CookieUtil.getCookieValue(request, "referlerList");
		List<String> refererList =  Arrays.asList((referer.replace("~", " ")).split(" "));
	%>
	<ul>
		<%
			for(int i = 0; i < paramList.size(); i++) {
				out.print("<li>" + (i+1) + "번째 param : " + paramList.get(i) + " url : " + refererList.get(i));
			}
		%>
	</ul>
	<a href="list.jsp"><button>돌아가기</button></a>
</body>
</html>