<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 객체</title>
</head>
<body>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

// 시간 출력하기 위해 변환화는 과정
long createTime = session.getCreationTime();
String strCreateTime = dateFormat.format(new Date(createTime));
long lastAccTime = session.getLastAccessedTime();
String strLastAccTime = dateFormat.format(new Date(lastAccTime));
%>
<%
String id = "";
if (session.getAttribute("UserId") != null) {
	id = (String) session.getAttribute("UserId");
}

String name = "";
if (session.getAttribute("UserName") != null) {
	name = (String) session.getAttribute("UserName");
}

String errMsg ="";
if (request.getAttribute("errMsg") != null) {
	errMsg = (String) request.getAttribute("errMsg");
}
%>
<h2>세션 정보</h2>
세션 유지 시간 : <%= session.getMaxInactiveInterval() %> <br>
세션 아이디 : <%= session.getId() %> <br>
세션 최초 요청 시간 : <%= strCreateTime %> <br>
<%= createTime %> <br>
세션 마지막 요청 시간 : <%= strLastAccTime %> <br>
세션 사용자 ID : <%= id %> <br>
세션 사용자 이름 : <%= name %> <br>

<h2>로그인</h2>
<%  %>
<span style="color : red; font-size 20px">
<%= errMsg %>
</span>
<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post"> <br>
아이디 : <input type="text" name="id" id="id" value="" maxlength="20"> <br>
비밀번호 : <input type="password" name="pwd" id="pwd" value="" maxlength="20">
<input type="submit" value="로그인">
<br>
<input type="submit" value="로그아웃">
</form>
<div>
<%
if(id != "") {
	out.print("<h2>회원정보</h2>" + "id : " + id + "<br>" + "name : " + name);
}
%>
</div>
<script>
const logout = document.querySelector("input[value = '로그아웃']");
const frm = document.querySelector("#frmLogin");
logout.addEventListener("click", (e)=> {
	e.preventDefault();
	frm.action = "logout.jsp";
	frm.submit();
	
})
</script>
</body>
</html>