<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Topbar</title>
<style>
	body{
		box-sizing : border-box;
		min-width: 1200px;
		max-width: 1600px;
		margin: 0 auto;
	}
	
	.menu-area {
		display: flex;
		flex-direction: row;
		align-items: center;
		width: 100%;
		height: 60px;
		vertical-align: middle;
		font-size: default;
		font-weight: bold;
		justify-content: space-between;
		position: sticky;
		background-color: white;
		border-bottom: 2px solid #eee;
	}

	.menu {
		width: 60%;
        height: 100%;
		margin: 0 auto;
		display: flex;
		justify-content: space-between;
		min-width: 1000px;
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
				<% if (loginUser == null) { %>
					<!-- 로그인 하지 않았을 경우 -->
					<a href="login.me">로그인</a>
					<a href="sign.bo">회원가입</a>
				<% } else { %>
					<!-- 로그인 했을 때 -->
					<%= loginUser.getUserId() %>
					<a href="logout.me">&nbsp; &nbsp; 로그아웃</a>
					<a href="myPage.me">마이페이지</a>
					<!-- 마이페이지는 아직 미완성이라 나중에 myPage.me 바꿔야함 -->
				<% } %>
			</div>
		</div>
	</div>
	
	
</body>
</html>