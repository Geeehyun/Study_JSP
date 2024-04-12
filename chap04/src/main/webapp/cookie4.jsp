<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 쿠키 처리 페이지</title>
</head>
<body>
<%
String pop_flag = request.getParameter("pop_flag");
if (pop_flag != null && pop_flag.equals("y")) {
	Cookie cookie = new Cookie("popup_close", "off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(10);
	response.addCookie(cookie);
	out.print("쿠키 : 창 열지않기 설정");
	out.print("<script>console.log('쿠키 창 열지 않기 설정 : '" + pop_flag + "')</script>");
}
%>

<%
response.sendRedirect("cookie3.jsp");
%>
</body>
</html>