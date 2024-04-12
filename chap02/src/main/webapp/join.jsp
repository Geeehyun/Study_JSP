<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Arrays" import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	* { margin : 0; padding : 0; list-style : none;}
	body {margin : 10px;}
	form {
		margin : 10px auto;
		width : 500px;
		display : flex;
		flex-direction : column;
		align-items : center;
		border : 1px solid #999;
		border-radius : 10px;
		padding : 10px;
	}
	ul {padding : 10px;}
	ul li {
		display : grid;
		grid-template : 1fr / 1fr;
		grid-template-areas: "title" "contents";
	}
	ul span {
		display :block;
		width : 100px;
		text-align : left;
		font-weight : 600;
		grid-area : title;
	}
	ul > li:not(:first-child){
		padding-top : 10px;
	}
	ul li div {
		grid-area : contents;
	}
	button, .button {
		width : 80px;
		height : 30px;
		border-radius : 10px;
		border : 1px solid #888;
		padding : 5px 10px;
	}
	button:hover, button:hover a, .button:hover {
		background : #888;
		border : 1px solid #888;
		color : #fff;
	}
	a, a:link, a:visited {
		text-decoration : none;
		color : #000;
	}
	input[type = "text"], input[type = "password"], input[type = "date"]  {
		margin-top : 5px;
		height : 25px;
		padding : 0 10px 0;
		border-radius : 10px;
		border : 1px solid #888;
	}
	textarea {
		margin-top : 5px;
		padding : 0 10px 0;
		border-radius : 10px;
		border : 1px solid #888;
	}
	input:focus + span, textarea:focus + span {
		color : orange;
	}
	p {
		color : red;
		padding :  5px;
	}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String loginErr = request.getParameter("loginErr");
String result = (loginErr == null)? "" : "올바른 아이디가 아닙니다.";

String id = request.getParameter("id") != null? request.getParameter("id") : "";
String pwd = request.getParameter("pwd") != null? request.getParameter("pwd") : "";
String name = request.getParameter("name") != null? request.getParameter("name") : "";
String gender = request.getParameter("gender") != null ? request.getParameter("gender") : "";
String birthday = request.getParameter("birthday") != null ? request.getParameter("birthday") : "";
String self = request.getParameter("self") != null ? request.getParameter("self") : "";
String[] favo = request.getParameterValues("favo");
List<String> favoList = (favo != null && favo.length > 0)? Arrays.asList(favo) : Arrays.asList("지현", "장지현");
%>
	<a class="button" href="./RequestInfo.jsp?param1=값1&param2=값2">클라이언트/서버 환경정보 조회 (GET방식)</a>
	<a class="button" href="./RequestHeader.jsp">헤더 정보 조회</a>
	<!--  <form action="RequestParameter.jsp" method="post"> -->
	<form action="./join_ok.jsp" method="post">
		<h3>회원가입</h3>
		<ul>
			<li>
				<input type="text" value="<%= id %>" name="id" id="id" maxlength="20">
				<span>아이디</span>
			</li>
			<li>
				<input type="password" value="<%= pwd %>" name="pwd" id="pwd" maxlength="20">
				<span>비밀번호</span>
			</li>
			<li>
				<input type="text" value="<%= name %>" name="name" id="name" maxlength="20">
				<span>이름</span>
			</li>
			<li>
				<label for="male"><input type="radio" value="M" name="gender" id="male" <% if(gender != "" && gender.equals("M")) {%>checked<%}%> >남</label>
				<label for="female"><input type="radio" value="F" name="gender" id="female" <% if(gender != "" && gender.equals("F")) {%>checked<%} %>>여</label>
				<span>성별</span>
			</li>
			<li>
				<input type="date" name="birthday" id="birthday" value="<%= birthday %>">
				<span>생년월일</span>
			</li>
			<li>
				<label for="favoSpo"><input type="checkbox" value="sports" name="favo" id="favoSpo" <% if(favoList.contains("sports")) {%>checked<%}%> >스포츠</label>
				<label for="favoEco"><input type="checkbox" value="economic" name="favo" id="favoEco" <% if(favoList.contains("economic")) {%>checked<%}%> >경제</label>
				<label for="favoCul"><input type="checkbox" value="culture" name="favo" id="favoCul" <% if(favoList.contains("culture")) {%>checked<%}%> >문학</label>
				<label for="favoLov"><input type="checkbox" value="love" name="favo" id="favoLov" <% if(favoList.contains("love")) {%>checked<%}%> >연애</label>
				<label for="favoTra"><input type="checkbox" value="travel" name="favo" id="favoTra <% if(favoList.contains("travel")) {%>checked<%}%> ">여행</label>
				<span>관심사항</span>
			</li>
			<li>
				<textarea id="self" name="self" maxlength="200" cols="40" rows="5"><%= self %></textarea> 
				<span>자기소개</span>
			</li>
		</ul>
		<p> <%= result %> </p>
		<div>
			<button type="submit" id="submit">제출</button>
			<button type="reset">초기화</button>
			<a href="join.jsp"><button type="button">홈으로...</button></a>
		</div>
	</form>
	<script>
		
		const submit = document.querySelector("#submit");
		const engL = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q" ,"r", "s", "t", "u", "v", "w", "x", "y", "z"];
		const engU = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
		const num = ["1","2","3","4","5","6","7","8","9","0"];
		const symbols = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+"];
		
		submit.addEventListener("click", (e) => {
			const id = document.querySelector("#id");
			const pwd = document.querySelector("#pwd");
			const name = document.querySelector("#name");
			const self = document.querySelector("#self");
			const gender = document.querySelectorAll("input[name = 'gender']:checked");
			const favo = document.querySelectorAll("input[name = 'favo']:checked");
			const birthday = document.querySelector("#birthday");
			
			if(id.value.length == 0) {
				e.preventDefault();
				id.focus();
				return alert("아이디는 필수 입력사항입니다.");
			} 
			if(pwd.value.length == 0) {
				e.preventDefault();
				pwd.focus();
				return alert("비밀번호는 필수 입력사항입니다.");
			} 
			if(name.value.length == 0) {
				e.preventDefault();
				name.focus();
				return alert("이름은 필수 입력사항입니다.");
			} 
			if(gender.length == 0) {
				e.preventDefault();
				return alert("성별은 필수 입력사항입니다.");
			} 
			if (birthday.value.length == 0) {
				e.preventDefault();
				birthday.focus();
				return alert("생년월일은 필수 입력사항입니다.");
			} 
			if(favo.length == 0) {
				e.preventDefault();
				return alert("관심사항은 필수 입력사항입니다.");
			} 
			if(self.value.length == 0) {
				e.preventDefault();
				self.focus();
				return alert("자기소개는 필수 입력사항입니다.");
			}  
			if(id.value.length < 8 || id.value.length > 20) {
				e.preventDefault();
				id.focus();
				return alert("아이디는 8자리 이상, 20자리 이하로 입력해주세요");
			} 
			if(!(engL.indexOf((id.value).substring(0,1)) >= 0) && !(engU.indexOf((id.value).substring(0,1)) >= 0) ) {
				e.preventDefault();
				id.focus();
				return alert("아이디의 첫 시작은 영문이어야합니다.");
			} 
			if(id.value.length > 0) {
				let allowed = (engL.concat(engU)).concat(num);
				let idValue = (id.value).split("");
				for(let i of idValue) {
					if(!(allowed.includes(i))) {
						e.preventDefault();
						id.focus();
						return alert("아이디는 영문, 숫자만 입력가능합니다.");
					}
				}
			} 
			if(pwd.value.length < 4 || pwd.value.length > 20) {
				e.preventDefault();
				pwd.focus();
				return alert("비밀번호는 4자리 이상, 20자리 이하로 입력해주세요");
			}
			if(pwd.value.length > 0) {			
				let eng = engL.concat(engU);
				let pwdValue = (pwd.value).split("");
				let cnt1 = 0, cnt2 = 0, cnt3 = 0;
				for(let j of pwdValue) {
					if(eng.includes(j)) {
						cnt1 ++;
					}
				}
				for(let j of pwdValue) {
					if(num.includes(j)) {
						cnt2 ++;
					}
				}
				for(let j of pwdValue) {
					if(symbols.includes(j)) {
						cnt3 ++;
					}
				} 
				if(cnt1 == 0 || cnt2 == 0 || cnt3 == 0) {
					e.preventDefault();
					pwd.focus();
					return alert("비밀번호는 영문, 숫자, 특수문자("+ symbols.toString() +")만 입력가능합니다.");
				}
			} 
			if(birthday.value.length >= 0) {
				let day = new Date(birthday.value);
				let today = new Date();
				if(day.getTime() > today.getTime()) {
					e.preventDefault();
					birthday.focus();
					return alert("생년월일은 오늘 날짜보다 미래일 수 없습니다.");
				}
			}
			if(self.value.length < 50) {
				e.preventDefault();
				self.focus();
				return alert("자기소개는 50자리 이상 입력해주세요");
			} 
			alert("정상처리되었습니다.");
		})
	</script>
</body>
</html>