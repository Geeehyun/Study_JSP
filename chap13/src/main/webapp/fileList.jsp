<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 리스트</title>
<style>
table, tr, td, th {
	border : 1px solid #000;
}
</style>
</head>
<body>

<h2>파일 목록 보기</h2>
<a href="file.jsp">파일등록 페이지</a>

<%
FileDAO dao = new FileDAO();
List<FileDTO> fileLists = dao.fileList();
dao.close();
%>

<table>
	<tr>
		<th>NO</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>원본 파일</th>
		<th>저장 파일</th>
		<th>작성일</th>
		<th>다운로드</th>
	</tr>
	<%
	if(fileLists != null) {
		for(FileDTO e : fileLists) {
	%>
	<tr>
		<td><%= e.getIdx() %></td>
		<td><%= e.getTitle() %></td>
		<td><%= e.getCategory() %></td>
		<td><%= e.getOrgFile() %></td>
		<td><%= e.getSaveFile() %></td>
		<td><%= e.getReg_date() %></td>
		<td><a href="download.jsp?orgFile=<%= URLEncoder.encode(e.getOrgFile(), "UTF-8")%>&saveFile=<%= URLEncoder.encode(e.getSaveFile(), "UTF-8")%>">다운로드</a></td>
	</tr>
	<%
		}
	} else {
	%>
	<tr>
		<td colspan="7">등록된 파일이 없습니다.</td>
	</tr>
	<%
	}
	%>
</table>

</body>
</html>