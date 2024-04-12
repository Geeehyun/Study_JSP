<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<h2>리다이렉트 수신 페이지</h2>
<ul>
	<li>request 저장된 값 : ${requetScope.reqVal}</li>  <!-- sendRedirect와 똑같기 때문에 request 영역꺼는 못갖고옴 -->
	<li>session 저장된 값 : ${sessionScope.reqVal}</li>
	<li>매개변수 1 : ${param.param1}</li>
	<li>매개변수 2 : ${param.param2}</li>
	<!-- JSP코드는 서버단 코드이기때문에 무조건 HTML코드(html+css+JS)보다 먼저 해석됨. 따라서 JSP에서 리다이렉션 등 하면 그 페이지 HTML 코드는 생성 조차 안됨. -->
</ul>