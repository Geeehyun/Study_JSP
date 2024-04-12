<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 제어문</title>
</head>
<body>

<h2>if 제어문</h2>
<c:set var="num" value="1000" />
<c:set var="str" value="문자열" />

<h3>짝수/홀수 판단</h3>
<c:if test="${num mod 2 eq 0}" var="result">
	${num}은 짝수 입니다.
</c:if>
result : ${result} <br>

<h3>비교 구문</h3>
<c:if test="${str eq '문자열'}" var="result2" >
	${str}은 문자열 입니다.
</c:if>
result2 : ${result2} <br>

<h3>ij문 주의사항</h3>
<c:if test="100" var="result3">
EL 표현식이 아닌 값을 직접 할당하면 false가 나옵니다. 
</c:if>
result3 : ${result3} <br>

<c:if test="tRuE" var="result4">
대소문자 구분 없이 tRuE = > ture
</c:if>
result4 : ${result4} <br>

<c:if test="${        true      }ㄴ" var="result5">
EL 표현식 안에 공백 존재시 ture => false로 반환함 => 공백 구분
</c:if>
result5 : ${result5} <br>

<h2>choose 제어문</h2>
<c:set var="num3" value="100" />

<h2>홀수/짝수 판단</h2>
<c:choose>
	<c:when test="${num3 mod 2 eq 0 }">${num3}는 짝수</c:when>
	<c:otherwise>${num3}는 홀수</c:otherwise>
</c:choose>

<h2>과목 평균</h2>
<form>
<label for="kor">국어<input type="text" name="kor" value=""/></label>
<label for="eng">영어<input type="text" name="eng" value=""/></label>
<label for="math">수학<input type="text" name="math" value=""/></label>
<button type="submit">학점 구하기</button>
</form>

<c:if test="${not (empty param.kor or empty param.eng or empty param.math) }">
	<c:set var="avg" value="${(param.kor + param.eng + param.math)/3 }" />
	평균 : ${avg }<br>
	<c:choose>
		<c:when test="${ avg >= 90 }">A학점 <br></c:when>
		<c:when test="${ avg >= 80 }">B학점 <br></c:when>
		<c:when test="${ avg >= 70 }">C학점 <br></c:when>
		<c:when test="${ avg >= 60 }">D학점 <br></c:when>
		<c:otherwise>E학점 <br></c:otherwise>
	</c:choose>
</c:if>


</body>
</html>