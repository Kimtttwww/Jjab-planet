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

/* 	.side { */
/* 		flex-basis: 20%; */
/* 	} */

	.content {
		flex-basis: 80%;
	}
	.notice-content{
		height: 400px;
		margin: 20px;
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
				<h3>알림 관리</h3>
				<hr>
				<div class="notice-content">
				
					<c:if test="${empty notice}">
					
						<p align="center">알림이 없습니다.</p>
					</c:if>
					<c:forEach var="p" items="${notice}">
						<form action="noticeDelete.me" method="get" style="margin: 100px auto;"> 
							<!-- 서블릿 이동 -->
							<input type = "hidden" name = "deletenotice" value = "${p.noticeNo}">
							<span>${p.noticeText}</span>
							<button type="submit" class="">삭제</button>
							<hr>
						</form>
					</c:forEach>
				</div>
			</section>
			
			<section class="pagingbar">
				<button type="button">&lt; 이전</button>
				<button type="button">1</button>
				<button type="button">2</button>
				<button type="button">3</button>
				<button type="button">4</button>
				<button type="button">5</button>
				<button type="button">6</button>
				<button type="button">7</button>
				<button type="button">8</button>
				<button type="button">9</button>
				<button type="button">10</button>
				<button type="button">다음 &gt;</button>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>

	

</script>
</body>
</html>