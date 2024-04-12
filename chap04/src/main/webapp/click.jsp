<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="chap04.CookieUtil"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		// 뉴 버전
		String param;
		String referer;
		// 파라미터 값 읽어서 가져오기
		String params = request.getParameter("params");
		String referers = request.getHeader("referer");
		param = params;
		referer = referers;
		// 이전 쿠키 값 갖고와서 넣기
		String paramC = CookieUtil.getCookieValue(request, "paramList");
		String refererC = CookieUtil.getCookieValue(request, "referlerList");
		if(paramC != null && paramC != "" && paramC != "null") {
			if(paramC.indexOf("~") > 0) {
				String[] arrParam = paramC.split("~");
				if(arrParam.length < 3){
					param = param + "~" + paramC;
				}  else {
					param = param + "~" + paramC.substring(0, paramC.lastIndexOf("~"));
				}
			} else {
				param = param + "~" + paramC;
			}
		}
		if(refererC != null && refererC != "" && refererC != "null") {
			if(refererC.indexOf("~") > 0) {
				String[] arrReferer = refererC.split("~");
				if(arrReferer.length < 3){
					referer = referer + "~" + refererC;
				}  else {
					referer = referer + "~" + refererC.substring(0, refererC.lastIndexOf("~"));
				}
			} else {
				referer = referer + "~" + refererC;
			}
		}
		// 쿠키 꾸워
		CookieUtil.setCookie(response, "paramList", param, 3600, "/");
		CookieUtil.setCookie(response, "referlerList", referer, 3600, "/");
		
		/*
		// 예전 버전
		List<String> paramList = new ArrayList<String>();
		List<String> referlerList = new ArrayList<String>(); 
		
		// 이전 쿠기 값 갖고와서 리스트로 전환 후 넣기
		String paramC = CookieUtil.getCookieValue(request, "paramList");
 		if(paramC != null && paramC != "" && paramC != "null") {
			List<String> orgParam = Arrays.asList((paramC.replace("|", " ")).split(" "));
			for (String e : orgParam) {
				paramList.add(e);
			}
		} 
		
		String refererC = CookieUtil.getCookieValue(request, "referlerList");
		if(refererC != null && refererC != "" && refererC != "null") {
			List<String> orgrefer = Arrays.asList((refererC.replace("|", " ")).split(" "));
			for (String e : orgrefer) {
				referlerList.add(e);
			}
		} 
		
		
		// list 페이지에서 파라미터 값 받아서 리스트에 넣어주기
		String params = request.getParameter("params");
		
		if ((paramList.size()) < 3) {
			paramList.add(params);
		} else {
			paramList.remove(0);
			paramList.add(params);
		}
		
		// 최종 리스트를 String으로 전환
		String realParams = (((paramList.toString()).replace("[", "")).replace("]","")).replace(", ", "|");
	
		String referer = request.getHeader("referer");
		
		if ((referlerList.size()) < 3) {
			referlerList.add(referer);
		} else {
			referlerList.remove(0);
			referlerList.add(referer);
		}
		
		String realRefere = (((referlerList.toString()).replace("[", "")).replace("]","")).replace(", ", "|");
		
		// 쿠키 꾸워
 		CookieUtil.setCookie(response, "paramList", realParams, 3600, "/");
		CookieUtil.setCookie(response, "referlerList", realRefere, 3600, "/");
		*/
		
		
		// 넘겨
 		response.sendRedirect("show.jsp");
	%>
<h2><%= param %></h2>
<h2><%= referer %></h2>
<h2><%= params %></h2>
<h2><%= referers %></h2>
<h2><%= paramC %></h2>
<h2><%= refererC %></h2>
<h2><% if(paramC.indexOf("~") > 0) {out.print(Arrays.toString(paramC.split("~")));} else {out.print(paramC);} %></h2>
<h2><% if(refererC.indexOf("~") > 0) {out.print(Arrays.toString(refererC.split("~")));} else {out.print(refererC);} %></h2>
</body>
</html>