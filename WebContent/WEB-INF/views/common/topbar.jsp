<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Topbar</title>
<style>
* {
    box-sizing: border-box;
}

body {
	margin: 0;
}

.menu-area {
    display: flex;
    align-items: center;
    width: 1500px;
    height: 60px;
    font-weight: bold;
    justify-content: space-between;
    position: sticky;
    border-bottom: 2px solid #eee;
    margin: 0 auto;
}

.menu {
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: space-between;
    min-width: 1000px;
}

.menu-area a {
	text-decoration-line: none; /* 밑에 줄 없애기 */
	text-decoration: none;
	color: black; /* 보라색 흔적 없애기 */
	width: 100px;
}

.menu-left a {
	flex-basis: 50%;
	justify-content: center;
	flex-direction: row;
	margin-right: 30px;
	text-decoration-line: none; /* 밑에 줄 없애기 */
	text-decoration: none;
	color: black; /* 보라색 흔적 없애기 */
	width: 100px;
}

.menu-right a {
	flex-basis: 50%;
	justify-content: center;
	flex-direction: row;
	margin-right: 30px;
	text-decoration-line: none; /* 밑에 줄 없애기 */
	text-decoration: none;
	color: black; /* 보라색 흔적 없애기 */
	width: 110px;
}

.menu-left a:hover, .menu-right a:hover {
	font-size: 20px;
	transition-duration: 0.3s;
}

.menu-left , .menu-right {
	display: flex;
	height: 100%;
	align-items: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- script 추가한 이유: $(() => 부분에서 jstl 라이브러리가 없어서 불러올수없어서 추가함. --강민구-- -->
</head>

<body>
	<script>
		$(() => {
			const msg = "${ alertMsg }";
			if (msg) {
				alert(msg);
				<c:remove var="alertMsg" />
			}
		});
	</script>

	<div class="menu-area">
		<div class="menu">
			<div class="menu-left">
				<a href="${pageContext.request.contextPath}">JJOBPLANET</a>
				<a href="${pageContext.request.contextPath}/list.job">채용공고</a>
				<a href="${pageContext.request.contextPath}/list.corp">기업정보</a>
				<a href="${pageContext.request.contextPath}/list.po">커뮤니티</a>
				<a></a>
			</div>

			<div class="menu-right">
				<c:choose>
					<c:when test="${ empty loginUser }">
						<!-- 로그인 하지 않았을 경우 -->
						<a href="login.me">로그인</a>
						<a href="sign.bo">회원가입</a>
					</c:when>
					<c:otherwise>
						<!-- 로그인 했을 때 -->
						<span style="min-width: 100px; margin: 0 30px; text-align: center">${ loginUser.userId }</span>
						<a href="logout.me">로그아웃</a>
						<a href="myPage.me">마이페이지</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	
</body>
</html>