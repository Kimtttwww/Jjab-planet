<%@page import="com.kh.corporation.model.vo.Logo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<c:set var="jjap" value="${ pageContext.request.contextPath }"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업채용공고 목록</title>
<link rel="stylesheet" href="${ jjap }/resources/css/jobPostingList.css" type="text/css">
</head>
<body class="jobPostingList-body">
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />

	<div class="head-container">

		<h1 class="head-container-h1">채용공고  ></h1>

		<header class="jobPostList-header">
			<select id="category">
				<option value="F">프론트엔드</option>
				<option value="B">백엔드</option>
				<option value="S">풀스택</option>
			</select>

			<div>
				<input type="search" id="search-box" placeholder="기업명 검색" >
				<button type="button" id="search">검색</button>
			</div>
		</header>
    <main>
      <section class="job-listing"><!-- 일단여기에 css적용 -->
			<c:forEach var="p" items="${list }">
				<div class="job-card" onclick='location.href = "detail.job?bno=${p.jobpostNo }"'>
						<img class="job-card-img" onclick='location.href="detail.corp?corpNo=${p.corp.corpNo}"' 
						src="${jjap}/${Logo.FILE_PATH}${p.corp.logo.changeName}" alt="기업 대표이미지">
					
					<div class="job-info">
						<h3 class="job-offer-title">${p.postTitle }</h3>
						<p class="employee-condition">${p.postContent }</p>
						<p class="corporate-name">${p.corp.corpName}</p>
						
						<div class="deadline-box">
							<p class="deadline">마감일 : ${p.endDate}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
	</main>


		<div class="pagination">
			<c:if test="${pi.currentPage ne 1 }">
				<a class="pagenation-next" onclick="stepPage(-1)"> &lt; </a>
			</c:if>

			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<a onclick="page(${p})">${p}</a>
			</c:forEach>

			<c:if test="${pi.currentPage ne pi.maxPage }">
				<a class="pagenation-next" onclick="stepPage(1)">&gt;</a>
			</c:if>
		</div>
		
	</div> <!-- head-container -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

<script>
	$(() => {
		if("${category}") $('#category').val('${category}');
		if("${keyword}") $('#search-box').val('${keyword}');
	});

// 	카테고리 필터
	$("#category").change(() => {
		location.href = 'list.job?category=' + $("#category").val();
	});

	$("#search").click(() => {
		location.href = 'list.job?keyword=' + $("#search-box").val();
	});

// 	검색어 입력 후 enter 시
	$("#search-box").keyup((key) => {
		if(key.keyCode == 13) {
			$("#search").click();
		}
	});

//  페이징
	function page(n) {
		let domain = '${jjap}/list.job?currentPage=' + n;
		
		if("${category}") domain += '&category=${category}';
		if("${keyword}") domain += '&keyword=${keyword}';
		
		location.href = domain;
	}
	
	function stepPage(n) {
		let domain = '${jjap}/list.job?currentPage=' + (${pi.currentPage} + n);
		
		if("${category}") domain += '&category=${category}';
		
		location.href = domain;
	}
</script>

</html>