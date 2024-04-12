<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 폼값 전송</title>
</head>
<body>
<h2>폼값 처리</h2>
<form name="frm" id="frm" method="post" action="form_ok.jsp">
이름 : <input type="text" name="name" id="name" value=""/> 
<br>
성별 : <label for="gender_F" ><input type="radio" name="gender" id="gender_F" value="F" /> 여자</label>
       <label for="gender_M" > <input type="radio" name="gender" id="gender_M" value="M" /> 남자</label>
<br>
최종학력 : <select name="grade" id="grade">
				<option value="g1" > 초등학교 </option>
				<option value="g2" > 중학교 </option>
				<option value="g3" > 고등학교 </option>
				<option value="g4" > 대학교 </option>
		   </select>
<br>
관심사항 : <label for="interest1" ><input type="checkbox" name="interest" id="interest1" value="i1" /> 정치</label>
           <label for="interest2" > <input type="checkbox" name="interest" id="interest2" value="i2" /> 경제</label>
           <label for="interest3" > <input type="checkbox" name="interest" id="interest3" value="i3" /> 과학</label>
           <label for="interest4" > <input type="checkbox" name="interest" id="interest4" value="i4" /> 연애</label>
           <label for="interest5" > <input type="checkbox" name="interest" id="interest5" value="i5" /> 스포츠</label>
<br>
<input type="submit" value="전송"/>
</form>
</body>
</html>