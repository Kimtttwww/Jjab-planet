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
	height: 100%;
}

.mypage-main-home {
	height:100%;
	width: 800px;
    display: block;
    margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		
		<div class="mypage-main-home">
			<c:choose>
				<c:when test="${loginUser.userType eq 'E'}">
					<jsp:include page="/WEB-INF/views/member/notice.jsp" />
				</c:when>
				<c:when test="${loginUser.userType eq 'C'}">
					<jsp:include page="/WEB-INF/views/corporation/corporationMainpage.jsp" />
				</c:when>			
			</c:choose>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>

</html>