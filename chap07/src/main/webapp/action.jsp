<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 동작방식</title>
</head>
<body>
<%
// 파일 경로

String incDirective = "./inc/inc_directive.jsp";
String incAction = "./inc/inc_actione.jsp";

pageContext.setAttribute("pageAttr", "화요일");    // jsp:include로 가져온 부분에서는 페이지 속성 못갖고옴
request.setAttribute("reqAttr", "불금");
%>

<h2>액션 태그 - 지서어</h2>
<%@ include file="inc/inc_directive.jsp" %>
<p> 지시어 페이지에서 선언된 변수 :  <%=today %></p>

<h2>액션 태그 - include</h2>
<jsp:include page="inc/inc_action.jsp" />          
<%-- <p><%= page2 %></p> --%>                      <!-- jsp:include 에서는 가져온 페이지에서 선언한 변수 사용 못함  -->
<%-- <jsp:include page=<%= incAction %> /> --%>    <!-- jsp:include 에서는 태그 내 표현식 사용 가능 -->
</body>
</html>