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
	<div class="main">
		<div class="mypage3_title">
			<h3>알림 관리</h3>
		</div>
		<div class="mypage3_content">
			<div class="all_list">
				<c:forEach var="p" items="${notice}">
				<span>${p.noticeText }</span>
				<button type="button" class="">삭제</button>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>