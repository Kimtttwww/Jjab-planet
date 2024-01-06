<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.main {
	display: flex;
	hight: 100%;
	margin: 0;
	justify-content: space-around;
}

.side {
/* flex-basis:30%; */
	width: 200px;
	height: 2000px;
	padding-top: 20px;
}

.content {
/* flex-basis:60%; */
	width: 1000px;
	height: 2000px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			
		</div>
		
		
		<div class="content">
			<c:choose>
				<c:when test="${loginUser.userType eq 'E'}">
					<jsp:include page="/WEB-INF/views/member/notice.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/corporation/corporationMainpage.jsp" />
				</c:otherwise>			
			</c:choose>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>

</html>