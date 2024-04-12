<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>List</h2>
<%
List oList = new ArrayList();
oList.add("미션임파서블");
oList.add(new Person("탐크루즈", 54));
pageContext.setAttribute("USA", oList);
%>

<ul>
<li>0번째 요소 : ${USA[0]}</li>
<li>1번째 요소 : ${USA[1].name}</li>
<li>1번째 요소 : ${USA[1].age}</li>
</ul>

<h2>Map</h2>
<%
Map<String, String> hMap= new HashMap<String, String>();
hMap.put("KOR", "한글");
hMap.put("ENG", "영어");
pageContext.setAttribute("LANG", hMap);
%>

<ul>
<li> KEY : ${LANG["KOR"]}  ${LANG['KOR']}  ${LANG.KOR}</li>
<li> KEY : ${LANG["ENG"]}  ${LANG['ENG']}  ${LANG.ENG}</li>
</ul>
</body>
</html>