<%@page import="com.kh.corporation.model.vo.Logo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>기업채용공고 목록</title>
<!-- <script src="/3script/jobPostingList.js"></script> -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/jobPostingList.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />

	<div class="head-container">

		<h1 style="text-align: center; border-bottom: solid 1px; padding-bottom: 50px; font-size: 5ch;">
			채 용 공 고</h1>

		<header class="header">
<!-- 			<form action="JobPostListController" method="get"> -->
				<select id="category">
					<option value="F">프론트엔드</option>
					<option value="B">백엔드</option>
					<option value="S">풀스택</option>
				</select>
<!-- 				<button type="submit">검색</button> -->
<!-- 			</form> -->

			<div>
				<input type="search" id="search-box" placeholder="기업검색">
			</div>
		</header>
    <main>

      <section class="job-listing" style="margin-bottom: 40px;"><!-- 일단여기에 css적용 -->
      
			<c:forEach var="p" items="${list }">
<%-- 				<a href="/JobPostDetailController2?jobpostNo=${p.jobpostNo}"></a> --%>
			
				<div class="job-card" onclick='location.href = "detail.job?bno=${p.jobpostNo }"'>
				
					<img onclick='location.href="${contextPath}/detail.corp?corpNo=${corp.corpNo}"' 
								src="${contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}" alt="기업 대표이미지">
				
<%-- 					<img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" class="company-logo"> --%>
					<div class="job-info">
						<h3 class="job-offer-title">${p.postTitle }</h3>
						<p class="employee-condition">${p.postContent }</p>
						<p class="corporate-name">${p.corp.corpName}</p>
						
						<div class="deadline-box">
							<p class="deadline">${p.endDate}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</section>
	</main>


		<div class="pagination">
			<c:url value="${empty condition ? 'list.job' : 'search.bo'}" var="url">
				<c:param name="condition" value="${condition }" />
				<c:param name="keyword" value="${keyword }" />
			</c:url>
			<c:if test="${pi.currentPage ne 1 }">
				<a href="${url }&currentPage=${pi.currentPage-1 }">[이전]</a>
			</c:if>

			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<a href="${url }&currentPage=${p }">[${p}]</a>
			</c:forEach>

			<c:if test="${pi.currentPage ne pi.maxPage }">
				<a href="${url }&currentPage=${pi.currentPage+1 }">[다음]</a>
			</c:if>
		</div>
		
	</div> <!-- head-container -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

<script>
	//검색기능
	document.getElementById('search-box').addEventListener('input', function(event) {
	  const searchTerm = event.target.value.toLowerCase();
	  const jobCards = document.querySelectorAll('.job-card');
	
	  jobCards.forEach(card => {
	    const title = card.querySelector('.corporate-name').textContent.toLowerCase();
	    if (title.includes(searchTerm)) {
	      card.style.display = '';
	    } else {
	      card.style.display = 'none';
	    }
	  });
	});

// 	카테고리 필터
	$("#category").change(() => {
		$.ajax({
			url: 'JobPostListController', type: 'post',
			success: (tf) => {
				if(tf != 'false') {
					location.href = 'JobPostListController?category=' + $("#category").val();
				} else {
					alert('요청 실패');
				}
			}, error: () => {
				alert("에러 발생");
			}
		});
	});
	
	$(() => {
		if ("${category}") {
			$("#category").val("${category}");
		}
	});
</script>
</html>