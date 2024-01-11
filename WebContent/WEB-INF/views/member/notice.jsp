<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 관리</title>
<style>
body {
	box-sizing: border-box;
	margin: 0 auto;
	height: 100%;
}

.notice-all hr {
	width: 100%;
}

.notice-all {
	width: 800px;
	display: block;
	margin: 0 auto;
}

/* 알림 리스트 */
.list-area {
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
}

.list-area h3{
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	font-weight: bold;
	font-size: 20px;
	margin-top: 20px;
	margin-bottom: 10px;
	padding-bottom:30px;
}

/* 각 알림 */
.notice-text {
	height: 50px;
	position: relative;
	text-align: center;
	margin: 5px 0;
}

/* 각 알림의 버튼 */
.notice>button {
	width: 50px;
	position: absolute;
	right: 30px;
}

/* 페이징 바 */
.pagingbar {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

/* 페이징 바의 각 버튼들 */
.pagingbar>button {
	margin: 0 7px;
	font-size: large;
}

.main {
	display: flex;
   	justify-content: flex-start;
}

.notice-content{
	margin: 30px 0;
	display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
    align-items: center;
}

.notice-content-area>p{
	font-size: 30px;
}

.notice-content-area {
	border-top: 1px solid skyblue;
}

.notice-page-area{
   	text-align: center;
   	width: 100%;
	border-top: 1px solid skyblue;
   	padding:30px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		<div class="notice-all">
			<section class="list-area">
				<h3>알림 관리 ></h3>
				<div class="notice-content-area">
				
					<c:if test="${empty notice}">
						<p align="center">알림이 없습니다.</p>
					</c:if>
					<c:forEach var="p" items="${notice}">
						<form action="noticeDelete.me" method="get" class="notice-content"> 
							<!-- 서블릿 이동 -->
							<input type = "hidden" name = "deletenotice" value = "${p.noticeNo}">
							<p align="center">${p.noticeText}</p>
							<button type="submit" class="">삭제</button>
							<hr>
						</form>
					</c:forEach>
				</div>
			</section>
			
			<div class="notice-page-area">
				<button class="page">1</button>
				<button class="page">2</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>

	

</script>
</body>
</html>