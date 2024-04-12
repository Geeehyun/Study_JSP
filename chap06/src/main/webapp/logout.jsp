<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
//로그아웃

// 세션 속성 지워버리기
//session.removeAttribute("UserId");
//session.removeAttribute("UserName");
session.invalidate();
/// 기존에는 속성 하나하나 지우는 걸로 하였으나 invalidate()로 세션을 무효화 해버리면, 세션정보를 아예 끊어버려서 더 효율적이라고 해서 바꿈


// 다시 로그인 페이지로 리다이렉트
response.sendRedirect("login.jsp");
%>