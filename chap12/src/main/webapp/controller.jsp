<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러 JSP</title>
</head>
<body>
<h2>요청에 따른 처리</h2>
${result}
<ol>
	<li>URI ; ${uri }</li>
	<li>요청이름 : ${cmdStr}</li>
</ol>

<ul>
	<li><a href="./regist.one">회원가입</a></li>
	<li><a href="./login.one">로그인</a></li>
	<li><a href="./bbs.one">자유게시판</a></li>
</ul>
</body>
</html>