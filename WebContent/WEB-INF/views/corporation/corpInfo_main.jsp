<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업정보페이지</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/common/index.css"
	type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
<style>

html, body {
margin: 0;
height: 100%;
}
.main {
	width: 60%;
	margin: 0 auto;
}
	
.top_banner {
	width: 100%;
	display: flex;
	margin-bottom: 100px;
}

.top_b3 {
	flex-basis: 40%;
	background-color: rgb(231, 248, 170);
	margin: 0 20px 0 0;
	padding: 20px;
	border-radius: 20px;
}


.content_bottom {
	text-align: right;
}


</style>	
	
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<div class="main">
		<div class="content_title">
			기업정보 >
		</div>
		
	
		
		<div class="top_banner">
			
			<div class="top_b3">
			
				<c:forEach var="corp" items="${list}" >
					
					<img onclick='location.href="${pageContext.request.contextPath}/detail.corp?corpNo=${corp.corpNo}"'
					src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
					alt="" >
					<p> ${corp.corpName}</p>
					<p>${corp.address}</p>
					<p class="content_bottom">직종 / 조회수</p>
				</c:forEach>				
			</div>			
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />










</body>
</html>