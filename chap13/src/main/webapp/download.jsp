<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드</title>
</head>
<body>
<%
String saveDirectory = "C:\\JSP\\chap13\\src\\main\\webapp\\Upload";
String saveFileName = request.getParameter("saveFile");
String orgFileName = request.getParameter("orgFile");

try {
	File file = new File(saveDirectory, saveFileName);
	InputStream inStream = new FileInputStream(file);
	String client = request.getHeader("User-Agent");
	if(client.indexOf("WOW64") == -1) {
		orgFileName = new String(orgFileName.getBytes("UTF-8"), "ISO-8859-1");
	} else {
		orgFileName = new String(orgFileName.getBytes("KSC5601"), "ISO-8859-1");
	}
	
	//출력헤더 설정
	response.reset();
	response.setContentType("application/octect-stream");
	response.setHeader("Content-Disposition", "attachment; filename=\"" + orgFileName + "\"");
	response.setHeader("Content-Length", ""+file.length());
	
	out.clear();
	out = pageContext.pushBody();
	
	OutputStream oStream = response.getOutputStream();
	byte[] b = new byte[(int)file.length()];
	int readBuffer = 0;
	while ((readBuffer = inStream.read(b))> 0) {
		oStream.write(b, 0, readBuffer);	
	}
	
	inStream.close();
	oStream.close();
	
	
} catch(FileNotFoundException e) {
	System.out.println("파일을 찾을 수 없습니다.");
	e.printStackTrace();
} catch(Exception e) {
	System.out.println("파일 다운로드 시 에러 발생");
	e.printStackTrace();
}
%>
</body>
</html>