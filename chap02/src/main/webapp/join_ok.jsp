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
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String self = request.getParameter("self").replace("\r\n", "<br>");
String[] favo = request.getParameterValues("favo");

String favoVal = "";
if(favoVal != null) {
	for(int i = 0; i <favo.length; i++){
		favoVal += favo[i] + " ";
	}
}

if(id.equals("TEST1234") ) {
	response.sendRedirect("./welcome.jsp?id="+id);
} else {
	request.getRequestDispatcher("./join.jsp?loginErr=1").forward(request, response);
	// getRequestDispatcher(이동할 URL)은 입력한 URL로 이동하나 주소창에서 주소는 기존 주소로 유지되고, 값을 던져줄 수 있다.
}
%>
</body>
</html>