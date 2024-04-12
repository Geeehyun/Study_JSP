<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloServlet</title>
</head>
<body>
<h2>web.xml 매핑 후 jsp에서 출력</h2>
<p>
	<%= request.getAttribute("msg") %><br>
	<a href="./HelloServlet.do">HelloServlet</a>
</p>
</body>
</html>