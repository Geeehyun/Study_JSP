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
<%!
	/* 
	Statement = 정적 쿼리를 날리는 용으로 냅다 텍스트 박아서 날리는 용
	PreparedStatement = ?를 이용해서 파라미터 세팅해서 날리는 동적 쿼리 용!
	*/
	int total = 0;
	StringBuilder sb = new StringBuilder();
	JDBConnect jdbc = new JDBConnect();
	
	int test(int startNum, int maxNum) {
		sb.append("INSERT INTO tbl_member(memberId, name, pwd, regdate)");
		sb.append("VALUES (?, ?, ?, NOW())");
		total = 0;
		String pwd = "1234";
		try {
			for(int i = startNum; i <= maxNum; i++){
				String id = "test" + i;
				String name = "테스트회원" + i;
				PreparedStatement psmt = jdbc.conn.prepareStatement(sb.toString());
				psmt.setString(1, id);
				psmt.setString(2, name);
				psmt.setString(3, pwd);
				int result = psmt.executeUpdate();
				total = total + result;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

%>
<%
	out.print(test(11, 15) + "행을 추가하였습니다.");
%>
</body>
</html>