<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>짭프로젝트에 오신것을 환영합니다^_^</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/common/index.css"
	type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="content_title">
			<a href="list.job">인기 많은 공고 ></a>
		</div>
		
		<div class="top_banner">
			<!--최다 조회수 배너-->
			<!--top_b1-->
			<c:forEach var="p" items="${first}">
			<div class="top_b1" onclick='location.href="detail.job?bno=${p.jobpostNo}"'>
				<img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg">
				<p>${p.corpName}</p>
				<p>${p.postTitle}</p>
				<p class="content_bottom">${p.count}</p>		
			</div>
			</c:forEach>	
		</div>
		
		<!--top_banner-->

		<div class="content_title"><a href="" class="content_title">최신 공고 ></a></div>
		<div class="new_banner_content">
		<c:forEach var="p" items="${second}">
			<!-- 마감순 배너-->
			<div class="new_banner">
				<img class="content_top" src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg">
				<p>${p.corpName}</p>
				<p>${p.postTitle }</p>
				<p class="content_bottom">${p.jobName }</p>
			</div>
			</c:forEach>
		</div>

		<div class="content_title"><a href="" class="content_title">전체 공고> </a></div>
		<c:forEach var="p" items="${third }">
		<div class="all_list" style="margin-bottom:20px;">
			<ul>
				<li>${p.corpName}</li>
				<li id="list_title">${p.postTitle }</li>
				<li>
					<ul class="s_info">
						<li>${p.location }</li>
						<li>${p.career }</li>
						<li>${p.education}</li>
					</ul>
				</li>
				<li>
					<div class="btn">
						<a href="#">입사지원</a>
					</div>
				</li>
			</ul>
		</div>
		</c:forEach>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>