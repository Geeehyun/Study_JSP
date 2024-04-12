<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function requestGo (frm, param) {
	event.preventDefault();
	frm.method = (param == 1 ? "GET" : "POST");
	frm.submit();
}
</script>
</head>
<body>
<h2>서블릿의 생명주기 확인</h2>
<form action="./LifeCycle.do">
	<input type="button" value="GET 방식" onclick="requestGo(this.form, 1);" />
	<input type="button" value="POST 방식" onclick="requestGo(this.form, 2);" />
</form>
</body>
</html>