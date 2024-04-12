<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>쿠키 사용하기</h2>
<%!
// 쿠키 값 저장하는 메서드로 사용하는 법(예시)
/*
public void setCookie(String name, String val, String path, int expire_date, String domain, HttpServletRequest req, HttpServletResponse reps) {
	Cookie cookie = new Cookie(name, val);
	cookie.setPath(!(path.isEmpty()) ? path : req.getContextPath());   
	cookie.setMaxAge(expire_date > 0 ? expire_date : 0);
	cookie.setDomain(!(domain.isEmpty())? domain : "");
	reps.addCookie(cookie);
}
*/
%>
<h3>1. 쿠기 저장</h3>
<%
Cookie cookie = new Cookie("myCookie", "쿠키값1");
cookie.setPath(request.getContextPath());   // 컨텍스트 패스에 값을 안주면 루트가 됨
cookie.setMaxAge(3600);
response.addCookie(cookie);
// 위 작성한 메서드 활용해보기 (예시)
//setCookie("myCookie", "쿠키값1", "/", 3600, "", request, response);
%>

<h3>2. 쿠기 조회</h3>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for(Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("%s : %s + %s<br>", cookieName, cookieVal, c.getDomain()));
	}
}

%>

<a href="cookie2.jsp">쿠키 조회하기</a>
</body>
</html>