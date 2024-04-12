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
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");

if(user_id.equals("test1") ) {
	response.sendRedirect("welcome2.jsp");    // request <=> response 사이에서만 전달받은 값이기 때문에 리다이렉트로 이동한 페이지에서는 값이 없어짐
} else {
	request.getRequestDispatcher("Response1.jsp?loginErr=1").forward(request, response);  // request의 디스패치로 화면은 이동하고 URL은 이동 안한상태로 값 유지 가능
}
%>
</body>
</html>