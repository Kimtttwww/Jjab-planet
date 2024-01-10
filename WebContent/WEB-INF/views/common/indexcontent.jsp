<%@page import="com.kh.corporation.model.vo.Logo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
<meta charset="UTF-8">
<title>짭프로젝트에 오신것을 환영합니다^_^</title>
<c:set var="project" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ project }/resources/css/common/index.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<div class="main">
		<div class="content_title">
			<a href="list.job">인기 많은 공고 &gt;</a>
		</div>
		
		<div class="top_banner">
			<c:forEach var="p" items="${first}">
				<section class="top_b1" onclick='location.href="detail.job?bno=${p.jobpostNo}"'>
					<article>
						<img src="${ project }/${ Logo.FILE_PATH }${ p.corp.logo.changeName }">
					</article>
					<article>
						<span>${p.corp.corpName}</span>
						<span>${p.postTitle}</span>
						<span class="content_bottom">
							<img class ="hit" src="${project}/resources/images/hits_icon.png">
							${p.count}
						</span>		
					</article>
				</section>
			</c:forEach>
		</div>
		
		<!--top_banner-->

		<div class="content_title"><a href="list.job" class="content_title">최신 공고 &gt;</a></div>
		<div class="new_banner_content">
			<c:forEach var="p" items="${second}">
				<div class="new_banner" onclick='location.href="detail.job?bno=${p.jobpostNo}"'>
					<article>
						<img src="${ project }/${ Logo.FILE_PATH }${ p.corp.logo.changeName }">
					</article>
					<article>
						<span>${p.corp.corpName}</span>
						<span>${p.postTitle }</span>
						<span class="content_bottom">${p.jobName }</span>
					</article>
				</div>
			</c:forEach>
		</div>

		<div class="content_title"><a href="list.job" class="content_title">전체 공고 &gt;</a></div>
		<c:forEach var="p" items="${third }">
		<div class="all_list" onclick='location.href="detail.job?bno=${p.jobpostNo}"' style="margin-bottom:20px;">
			<ul>
				<li><a href="detail.corp?corpNo=${ p.corpNo }">${p.corp.corpName}</a></li>
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