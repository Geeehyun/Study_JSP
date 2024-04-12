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
int age = 40;
%>
<h2>액션태그 - param</h2>
<jsp:useBean id="person" class="common.Person" scope="request" />
<jsp:setProperty name="person" property="name" value="홍길동" />
<jsp:setProperty name="person" property="age" value="20" />
<!-- param_forward.jsp 로 이동은 하긴하는데 URL은 param.jsp인 채로 이동 됨.(request.getRequestDispatcher().forward()와 유사) -->
<jsp:forward page="param_forward.jsp?param1=유재석">   
	<jsp:param name="param2" value="서울" />
	<jsp:param name="param3" value="<%=age %>" />
</jsp:forward>
</body>
</html>