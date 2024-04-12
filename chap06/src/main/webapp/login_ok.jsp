<%@page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

out.println(String.format("아이디 : %s, 비밀번호 : %s <br>", id, pwd));

// DB 회원정보 갖고와서 써먹어보기
String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("URL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");

MemberDAO dao = new MemberDAO(driver, url, dbId, dbPwd);
MemberDTO dto = dao.getMemberInfo(id, pwd);
dao.close();

if(dto != null && dto.getMemberId() != null) {
	session.setAttribute("UserId", dto.getMemberId());
	session.setAttribute("UserName", dto.getName());
	out.print(dto.getMemberId());
	response.sendRedirect("login.jsp");
} else {
	out.print(dto.getMemberId());
	request.setAttribute("errMsg", "로그인 오류");
	request.getRequestDispatcher("login.jsp").forward(request, response);  
	// response.sendRedirect() 해버리면, request 요청이 종결되서 위 속성 저장한거 없어짐 따라서 request.getRequestDispatcher()로 담아서 이동
}
%>