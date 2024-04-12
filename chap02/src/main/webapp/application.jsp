<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application</title>
</head>
<body>
<h2>Application 내장객체</h2>
<ul>
<li>웹 서버의 설정 정보를 가져올 때</li>
<li>웹 서버의 설정 파일에 저장한 정보를 가져올 때</li>
<li>웹 서버의 특정 폴더나 파일의 물리적 경로를 가져올 때</li>
<li>어플리케이션 객체는 서버 내 웹 서비스 당 하나씩 생성됩니다.</li>
<!-- 
톰캣 컨데이터 내 여러 웹 서비스가 있고 그 웹 서비스 하나 당 웹 어플리케이션 객체가 생성 됩니다.
웹 어플리케이션 내 페이지, 세션 객체가 있고 페이지와 페이지 사이에서 리퀘스트와 리스폰스 객체로 연결 연결 합니다.
페이지 객체 내에는 페이지 객체, 페이지 컨텍스트 객체 등이 있습니다.

어플리케이션 객체의 주요 역할은, 웹 서비스가 로딩될 때 웹 서버의 설정정보를 가져와서 알맞게 설정해주는 역할
=> 웹 서비스에서 공통된 정보를 조회하거나 공통된 설정을 조회/설정할 때 사용될 수 있습니다!
서비스 로딩할 때  파일업로드할 떄 암호화 어쩌고, 설정정보 어쩌고.....할 때 사용하고 막 엄청 주로 사용되지는 않지만 중요한 포인트에서 사용되니 알아둬야 함.
 -->

</ul>
 application 내장 객체 : <br>
 초기화 변수 : <%= application.getInitParameter("INIT_PARAM") %> <br>
 <!-- 현재 설정된 초기화 변수가 없어서 조회 시 null 나옴 -->
 물리적 경로 : <%= application.getRealPath("/chap02") %>
 <!-- 물리적 경로는 파일 업로드할 때 사용될 수 있음 -->
 
 <br><hr><br>
 
 선언부에서 사용 <br>
 <%!
 public String getApplication() {
	 return this.getServletContext().getRealPath("/chap02");
 }
 public String getApplication(ServletContext sc) {
	 return sc.getRealPath("/chap02");
 }
 %>
 
 this 사용 Application : <%= getApplication() %> <br>
 내장객체 전달 : <%= getApplication(application) %>
</body>
</html>