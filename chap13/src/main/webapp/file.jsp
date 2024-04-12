<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let title = frm.querySelector(#title)
 	if(frm.title.value == "") {
		alert("제목을 입력하세요");
		frm.title.focus();
		return;
	}
	if(frm.file.value == "") {
		alert("파일을 선택하세요");
		return;
	}
}
</script>
</head>
<body>
<h2>파일 업로드</h2>
<span>${ errMsg }</span>
<form name="frm" id="frm" action="FileUpload2.do" onsubmit="checkForm(this.form)" method="post" enctype="multipart/form-data">
<!-- 기존 단건 파일 업로드는 "FileUpload.do" 다중 업로드는 "FileUpload2.do" 로 진행 -->
	<label for="title">제목 <input type="text" name="title" id="title" value="" maxlength="100"></label><br>
	<label>카테고리</label>
	<label for="c01">사진 <input type="checkbox" name="category" id="c01" value="사진"></label>
	<label for="c02">그림 <input type="checkbox" name="category" id="c02" value="그림"></label>
	<label for="c03">음악 <input type="checkbox" name="category" id="c03" value="음악"></label>
	<label for="c04">악기 <input type="checkbox" name="category" id="c05" value="악기"></label>
	<br>
	<label for="file">첨부파일<input type="file" name="file" id="file" multiple></label>
	<br><hr><br>
	<button type="submit">제출</button>
</form>
</body>
</html>