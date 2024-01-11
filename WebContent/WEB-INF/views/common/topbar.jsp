<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Topbar</title>
<style>
@font-face {
    font-family: 'SOYOMapleBoldTTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
* {
    box-sizing: border-box;
}

body {
	box-sizing : border-box;
	min-width: 1200px;
	max-width: 1600px;
	margin: 0 auto;
	position: relative;
	bottom: 0;
	resize: none;
}

.topbar-menu-area >*{
	font-family: 'SOYOMapleBoldTTF';
	
}

.topbar-menu-area {
    display: flex;
	flex-direction: row;
	align-items: center;
	width: 100%;
	height: 80px;
	vertical-align: middle;
	font-size: large;
	font-weight: bold;
	justify-content: space-between;
	align-items: center;
	position: sticky;
	background-color: white;
	font-weight: bold;
	border-bottom: 2px solid skyblue;
}

.menu {
    width: 60%;
    height: 100%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	min-width: 1000px;
}

.menu-area a {
	flex-direction: row;
	justify-content: center;
	text-decoration-line: none; /* 밑에 줄 없애기 */
	text-decoration: none;
	color: black; /* 보라색 흔적 없애기 */
}

.menu-left a {
	flex-basis: 50%;
	margin: 0 12px;
    width: 100px;
}

.menu-right a {
	flex-basis: 50%;
	margin-left: 20px;
    width: 110px;
}

.menu-left a:hover, .menu-right a:hover {
	font-size: 20px;
	transition-duration: 0.3s;
}

.menu-left {
	display: flex;
	height: 100%;
	width: 55%;
	align-items: center;
	text-align: center;
	margin: 0;
}

.menu-right{
	display: flex;
	height: 100%;
	align-items: center;
	text-align: center;
	margin: 0 0 0 20px;
}

.menu-right>a:first-child {
    margin-left: 20px;
    
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

	<div class="topbar-menu-area">
		<div class="menu">
			<div class="menu-left">
				<a href="${pageContext.request.contextPath}">JJOBPLANET</a>
				<a href="${pageContext.request.contextPath}/list.job">채용공고</a>
				<a href="${pageContext.request.contextPath}/list.corp">기업정보</a>
				<a href="${pageContext.request.contextPath}/list.po">커뮤니티</a>
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
						<span>${ loginUser.userId }</span>
						<a href="logout.me">로그아웃</a>
						<a href="notice.me">마이페이지</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	
</body>
</html>