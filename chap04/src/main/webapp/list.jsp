<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<%
			for(int i = 1; i < 11; i++) {
				out.print("<li><a href='click.jsp?params=" + i + "'>리스트" + i + "</a></li>");
			}
		%>
	</ul>
</body>
</html>