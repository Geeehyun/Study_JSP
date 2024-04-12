<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
main input.btn_login {margin : 10px 0; background: #fff;}
#header {text-align : right;}
</style>
</head>
<body>
<main id="header">
<%
// 세션에서 로그인 정보 유무 체크
String sessionId = "";
if (session.getAttribute("user_id") == null) {
	// 로그인 정보 없을 경우 [로그인] 버튼 표시
	
%>
	<form id="frm_logIn" action="login.do" method="post">
		<input type="submit" id="btn_login" name="btn_login" class="btn_login" value="로그인" />
	</form>
<%	
} else {
	// 로그인 정보 있을 경우 [로그아웃] 버튼 표시 + sessionId 값 저장
	sessionId = (String) session.getAttribute("user_id");
%>
	<form id="frm_logOut" action="login.do" method="get">
		<input type="hidden" name="flag" value="logOut"/>
		<input type="submit" id="btn_login" name="btn_logOut" class="btn_login" value="로그아웃" />
	</form>
<%
}
%>
</main>

</body>
</html>