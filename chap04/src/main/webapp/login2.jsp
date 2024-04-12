<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="chap04.CookieUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id_save = request.getParameter("id");
String saveY = request.getParameter("save");
if (saveY != null ) {
/* 	Cookie id = new Cookie("id_save", id_save);
	id.setPath(request.getContextPath());
	id.setMaxAge(5);
	response.addCookie(id); */
	
	// 만든 클래스로 바꿔보기 
	CookieUtil.setCookie(response, "id_save", id_save, 10, "/");
	
/* 	Cookie save_flag = new Cookie("save_flag", "y");
	save_flag.setPath(request.getContextPath());
	save_flag.setMaxAge(5);
	response.addCookie(save_flag); */
	CookieUtil.setCookie(response, "save_flag", "y", 10, "/");
} else {
/* 	Cookie id = new Cookie("id_save", "");
	id.setPath(request.getContextPath());
	id.setMaxAge(0);
	response.addCookie(id); */
	CookieUtil.setDeleteCookie(response, "id_save", "/");
	
/* 	Cookie save_flag = new Cookie("save_flag", "n");
	save_flag.setPath(request.getContextPath());
	save_flag.setMaxAge(0);
	response.addCookie(save_flag); */
	CookieUtil.setDeleteCookie(response, "save_flag", "/");
}
%>

<%
response.sendRedirect("login.jsp");
%>
</body>
</html>