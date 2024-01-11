<%@page import="org.apache.tomcat.util.descriptor.web.ErrorPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display: flex; flex-direction: column; align-items: center;">
		<h1>에러가 발생하였습니다!</h1>
		<img alt="에러 이미지" src="${pageContext.request.contextPath}/resources/images/error.jpg" style="height: 700px;">
	</div>
</body>
</html>