<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="common.Person" %>

<%
	request.setAttribute("reqStr1", "reuest 영역 문자열");
	request.setAttribute("reqPerson", new Person("홍길동", 21));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>request 영역 속성값 조회</h2>
<%
	out.print("reqStr1 : " + request.getAttribute("reqStr1") + "<br>");

	Person reqPerson = (Person) request.getAttribute("reqPerson");
	out.print("reqPerson : " + reqPerson.getName() + ", " + reqPerson.getAge());
%>

<br><hr><br>

<h2>request 영역 속성값 제거</h2>
<%
//	request.removeAttribute("reqStr1");
//	request.removeAttribute("reqPerson");
	
	out.print("reqStr1 : " + request.getAttribute("reqStr1") + "<br>");

	Person reqPerson2 = (Person) request.getAttribute("reqPerson");
	if (reqPerson2 != null) {
		out.print("reqPerson : " + reqPerson.getName() + ", " + reqPerson.getAge());
	} else {
		out.print("reqPerson : null");
	}
%>

<br><hr><br>

<h2>request forward 후 속성값 조회</h2>
<%
	request.getRequestDispatcher("request_forward.jsp?name=홍길동&ename=HONGGILDONG&age=30").forward(request, response);

	// 위과 같은 의미
	// RequestDispatcher rd = request.getRequestDispatcher("request_foward.jsp?name=홍길동&ename=HONGGILDONG&age=30");
	// rd.forward(request, response);
			
%>
</body>
</html>