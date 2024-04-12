<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<%
String id_save = "";
String save_flag = "n";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for(Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		if(cookieName.equals("id_save")) {
			id_save = cookieVal;
		} else if(cookieName.equals("save_flag")) {
			save_flag = cookieVal;
		}
	}
}

%>

<form id="login" name="login" action="login2.jsp">
	<ul>
		<li><label for="id">아이디 : </label><input type="text" id="id" name="id" value="<%= id_save %>" maxlength="20"></li>
		<li><label for="pwd">비밀번호 : </label><input type="password" id="pwd" name="pwd" value="" maxlength="20"></li>
	</ul>
	<div>
		<button type="submit">로그인</button>
		<label for="save"><input type="checkbox" id="save" name="save" <%= (save_flag.equals("y")) ? "checked" : "" %>>아이디 저장하기</label>
	</div>
</form>
</body>
</html>