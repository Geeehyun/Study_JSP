<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    <!-- 지시어 부분 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	String str1 = "Hi";
	String str2 = "JSP";             
	
	String add_str(String str1, String str2) {
		return str1 + " " + str2;
	}
%>                                                                                      <!-- 스크립트 요소 - 선언부 -->
<h2>첫 <%= str2 %> 지현만듬</h2>                                                        <!-- 스크립트 요소 - 표현식 -->
<p> 스크립틀릿 영역 : 
	<% out.println(add_str(str1, str2)); %>                                             <!-- 스크립트 요소 - 스크립틀릿 -->
</p>
<p> 표현식 영역 : 
	<%= add_str(str1, str2) %>                                                          <!-- 스크립트 요소 - 표현식 -->
</p>
</body>
</html>