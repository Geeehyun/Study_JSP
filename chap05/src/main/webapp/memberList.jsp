<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
</head>
<body>
<%
// DB 연결
JDBConnect jdbc = new JDBConnect();

// 쿼리문 String으로 작성
String sql = "SELECT memberId, name, pwd, jumin, addr1, addr2, birthday, jobCode, mileage, memberState, regDate, leaveDate, pwd_change_date FROM tbl_member";
// Statement 생성
Statement stmt = jdbc.conn.createStatement();
// Statement 를 exequteQuery(SELECT문 용)로 실행
ResultSet rs = stmt.executeQuery(sql);

// 출력하기
while(rs.next()) { // ResultSet은 행 별로 갖고오는 방식임. next() 메서드는 다음 갖고올 행이 있는지 여부를 boolean 값으로 반환하는 함수
	String member_id = rs.getString(1);  // SELECT문에 입력한 컬럼 순서를 숫자로 입력해도 되고 직접 컬럼명을 String으로 입력해도됨.
	String name = rs.getString(2);
	String pwd = rs.getString(3);
	String jumin = rs.getString("jumin");
	Date reg_date = rs.getDate("regDate");
	out.println(String.format("%s, %s, %s, $s, %s", member_id, name, pwd, jumin));
}
%>
</body>
</html>