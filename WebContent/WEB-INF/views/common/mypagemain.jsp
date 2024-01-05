<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/mypagemain.css"	type="text/css">
</head>
<body>
<container>
<section class="list-area">
			<span style="font-size:large; font-weight : bold;">마이페이지 메인화면</h3>
			<hr style="border:1px solid #eee;">
			<section class="list-area">
			<h5>알림 관리</h5>
			<span></span>
			<hr>
			<c:forEach var="p" items="${notice}">
			<article class="notice">
				<span>${p.noticeText }</span>
				<button type="button" class="">삭제</button>
			</article>
			<hr>
			</c:forEach>
		</section>
		<section class="list-area">
			<h5>관심 기업</h5>
			<hr>
			<c:forEach var="p" items="${notice}">
			<article class="notice">
				<span>${p.noticeText }</span>
				<button type="button" class="">삭제</button>
			</article>
			<hr>
			</c:forEach>
			
			<hr>
		</section>
		</container>
</body>
</html>