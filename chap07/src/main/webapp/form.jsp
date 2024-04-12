<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 빈의 사용</title>
</head>
<body>
<h2>폼값 한번에 받기</h2>
<%
Person p2 = new Person();
p2.setName("가나다");
p2.setAge(10);
%>
<form name="frmTransfer" action="form_action.jsp" method="post">
<input type="hidden" name="objPerson" value="<%= p2 %>" >
<label>이름 : <input type="text" id="name" name="name" value="" maxlength="20"></label>
<label>나이 : <input type="text" id="age" name="age" value="" maxlength="3"></label>
<input type="submit" value="전송">
</form>
</body>
</html>