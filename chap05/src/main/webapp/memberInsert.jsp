<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
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
	String memberId = "test10";
	String name = "테스트회원10";
	String pwd = "1234";
	
	StringBuilder sb = new StringBuilder();
	sb.append("INSERT INTO tbl_member(memberId, name, pwd, regdate)");
	sb.append("VALUES (?, ?, ?, NOW())");
	
	JDBConnect jdbc = new JDBConnect();
	
	PreparedStatement psmt = jdbc.conn.prepareStatement(sb.toString());
	psmt.setString(1, memberId);
	psmt.setString(2, name);
	psmt.setString(3, pwd);
	// executeQuery = 셀렉트 / executeUpdate = 수정, 삭제, 삽입 excuteUpdate는 리턴타입이 있고 int 형임
	int result = psmt.executeUpdate();
	out.print(String.format("%d 개의 행이 입력되었습니다.", result));
	
	// 다썻으니 닫자
	jdbc.close();
%>
</body>
</html>