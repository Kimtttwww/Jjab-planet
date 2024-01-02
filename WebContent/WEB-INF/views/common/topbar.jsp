<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 박윤비 정렬만 했음 12:34 -->
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

	.menu-area a {
		text-decoration-line: none; /* 밑에 줄 없애기 */
		text-decoration: none;
		color: black; /* 보라색 흔적 없애기 */
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
	}

	.menu-right a {
		flex-basis: 50%;
		justify-content: center;
		flex-direction: row;
		margin-right: 30px;
	}

	.menu-left a:hover, .menu-right a:hover {
		font-size: 20px;
		transition-duration: 0.3s;
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
				<a></a>
			</div>

			<div class="menu-right">
				<a href="login.me">로그인</a>
				<a href="sign.bo">회원가입</a>
			</div>
		</div>
	</div>
</body>

</html>