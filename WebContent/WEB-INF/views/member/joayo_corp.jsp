<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.corporation.model.vo.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관심 기업 리스트</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/joayo_corp.css"
	type="text/css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<section style="display: flex;">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		<div class="mypage3 content">
			<div class="mypage3_title">
				<h3>관심기업 리스트</h3>
			</div>
			<div class="mypage3_content">
				<div class="all_list" onclick = "location.href = ">
					<c:if test="${empty list}">
						<p align="center">관심기업이 없습니다.</p>
					</c:if>
					<c:forEach var="p" items="${list}">
					<c:out value="${list}" />
					<ul>
						<li class="li_no1">${p.joayoNo }</li>
						<li><img class="corp_logo"
							src="${contextPath}/resources/images/kh_logo.jpg">
						</li>
						<li>${p.corpName }</li>
						<li class="li_last"><img class="star_img"
							src="${contextPath}/resources/images/star.png"
							alt=""></li>
					</ul>
					</c:forEach>
				</div>
				<div class="page-area">
					<div id="page-area">
						<button class="prev">이전</button>
						<button class="page">1</button>
						<button class="page">2</button>
						<button class="page">3</button>
						<button class="page">4</button>
						<button class="page">5</button>
						<button class="page">다음</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
