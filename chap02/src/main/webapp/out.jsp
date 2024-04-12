<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - out</title>
</head>
<body>
<%
out.print("텍스트 입니다.1"); // 버퍼에 저장중 - 저장했다가 화면 로딩될 때 한번에 뿌려줌
// out.print() = 스크립트 요소 중 표현식과 동일하며, 로직 안에서는 out.print() / html 태그 내에서는 표현식을 주로 사용함. => 둘 다 쓸 줄 알아야함. 
out.clearBuffer();  // 위에서 열심히 저장중인데 냅다 버퍼 비워버림 그래서 출력이 안됨
out.print("텍스트 입니다.2"); // 버퍼에 저장중 - 저장했다가 화면 로딩될 때 한번에 뿌려줌
out.flush(); // 지우기전에 먼저 버퍼 비우고 출력해버림
out.clearBuffer();  // 위에서 열심히 저장중인데 냅다 버퍼 비워버림 그래서 출력이 안됨
out.print("<hr>");
out.print("<h2>out 내장 객체</h2>");
out.print("출력 버퍼크기 : " + out.getBufferSize() + "<br>");
out.print("남은 버퍼크기 : " + out.getRemaining() + "<br>");
out.print("남은 버퍼크기 : " + out.getRemaining() + "<br>");
out.flush();  // 다 사용 후 버퍼 내용물 강제로 비우고 출력
out.print("flush 후 버퍼 크기 : " + out.getRemaining() + "<br>");
out.print(1);
%>
</body>
</html>