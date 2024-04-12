<%@page import="common.MyErr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
<style>
	* {margin : 0; padding : 0;}
	body {
		width : 100%;
		margin : 0 auto;
	}
	main {
		width : 1000px;
		margin : 0 auto;
	}
	h2 {
		padding : 20px;
		text-align : center;
	}
	table, tr, td, th {
		border-collapse:collapse;
		padding : 10px;
	}
	table {
		width : 100%;
		margin : 10px 0;
	}
	.border, .border tr, border th {
		border: 1px solid #aaa;		
	}
	.border td:nth-child(1), td:nth-child(3), td:nth-child(4){
		text-align : center;
	}
	.search_area {
		border: 1px solid #bbdbff;
		background : #bbdbff;
		text-align : center;
		height : 80px;
	}
	th {
		background : #e3f0ff;
	}
	input, select {
		box-sizing : border-box;
		height : 30px;
	}
	#search_word {
		width : 200px;
	}
	input[type = "button"], input[type = "submit"] {
		background : #e3f0ff;
		border : 1px solid #aaa;
		padding : 0 10px;
	}
	table th:nth-child(1), table td:nth-child(1) {
		border: 1px solid #aaa;		
		background : #eee;
	}
	#btn_modify, #btn_delete {
		float : right;
		margin-left : 5px;
	}
	a, a:link, a:hover, a:active, a:visited {
		color : #000;
		text-decoration : none;
	}
	a:hover {
		text-decoration : underline !important;
	}
</style>
<script>
if(${(requestScope.param.err != null) ? true : false}) {
	alert("${requestScope.param.err}");
	history.back();
}
</script>
</head>
<body>
<main>
	<h2><a href="list.do">상세 게시글 조회</a></h2>
	<table class="border">
		<caption style="display:none">표제목</caption>
		<thead>
			<tr>
				<td>NO ${ requestScope.param.idx } </td>
				<td>작성자 : ${ requestScope.param["user_id"] }</td>
				<td>조회수 : ${ requestScope.param["read_cnt"] }</td>
				<td>작성일 : ${ requestScope.param["reg_date"] }</td>
			</tr>
		</thead>
 		<tbody>
			<tr>
				<td>제목</td>
				<td colspan="3"> ${ requestScope.param.title }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"> ${ requestScope.param.content }</td>
			</tr>
		</tbody>
	</table>
	<input type="button" id="btn_list" value="목록으로">
	<input type="button" id="btn_modify" value="수정">
	<input type="button" id="btn_delete" value="삭제">
	<input type="hidden" id="myContentYN" name="myContentYN" value=${ sessionScope["user_id"] eq requestScope.param["user_id"]? "Y" : "N" } />
</main>
<script>
const btn_list = document.querySelector("#btn_list");
btn_list.addEventListener("click", (e) => {
	window.location.replace("list.do?${requestScope.param.queryStringPCW}");
})

const btn_delete = document.querySelector("#btn_delete");
const myContentYN = document.querySelector("#myContentYN").value;
btn_delete.addEventListener("click", (e) => {
	if (${(sessionScope["user_id"] != null) ? false : true}) {
		alert("로그인 정보가 없습니다.");
		location.href = "login.do?flag=loginFail";
	} else if (myContentYN != "Y") {
		alert("본인 게시글만 수정/삭제할 수 있습니다.");
		history.back();
	} else {
		let confirmYN = confirm("정말 삭제하시겠습니까?");
		if (confirmYN) {
			window.location.replace("post.do?flag=delete&idx=${requestScope.param.idx}");	
		}
	}
})

const btn_modify = document.querySelector("#btn_modify");
btn_modify.addEventListener("click", (e) => {
	if (${(sessionScope["user_id"] != null) ? false : true}) {
		alert("로그인 정보가 없습니다.");
		location.href = "login.do?flag=loginFail";
	} else if (myContentYN != "Y") {
		alert("본인 게시글만 수정/삭제할 수 있습니다.");
		history.back();
	} else {
		window.location.replace("post.do?flag=modify&idx=${requestScope.param.idx}&${requestScope.param.queryStringPCW}");
	}
})
</script>
</body>
</html>