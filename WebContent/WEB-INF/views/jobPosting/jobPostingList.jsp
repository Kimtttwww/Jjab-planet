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
			<form action="JobPostListController" method="get">
				<select id="category" name="category">
					<option value="F">프론트엔드</option>
					<option value="B">백엔드</option>
					<option value="S">풀스택</option>
				</select>
				<button type="submit">검색</button>
			</form>

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


/* //필터기능
function filterJobs(category) {
	  // 모든 job-card 요소를 선택
	  const jobCards = document.querySelectorAll('.job-card');

	  // 각 job-card에 대해 반복
	  jobCards.forEach(card => {
	    // job-card의 data-category 속성을 가져옴
	    const jobCategory = card.getAttribute('data-category');

	    
	    // 선택된 카테고리와 일치하거나 'all'이 선택된 경우, 해당 카드를 표시
	    if (category === 'all' || jobCategory === category) {
	      card.style.display = ''; // 혹은 'block' 또는 'flex' 등의 적절한 디스플레이 속성 사용
	    } else {
	      // 그렇지 않으면 카드를 숨김
	      card.style.display = 'none';
	    }
	  });
	}


//카테고리 선택요소에 이벤트리스너 추가(category 요소 값이 바뀔때마다 관련작어 필터링)
document.getElementById('category').addEventListener('change',function(){
  filterJobs(this.value); // this.value는 현재'category' 요소의 선택된 값
});
 */


</script>







<!-- <script> -->

<!-- // document.getElementById('search-box').addEventListener('input', function(event) { -->
<!-- //   const searchTerm = event.target.value.toLowerCase(); -->
<!-- //   const jobCards = document.querySelectorAll('.job-card'); -->

<!-- //   jobCards.forEach(card => { -->
<!-- //     const title = card.querySelector('.corporate-name').textContent.toLowerCase(); -->
<!-- //     if (title.includes(searchTerm)) { -->
<!-- //       card.style.display = ''; -->
<!-- //     } else { -->
<!-- //       card.style.display = 'none'; -->
<!-- //     } -->
<!-- //   }); -->
<!-- // }); -->

<!-- // document.addEventListener('DOMContentLoaded', function() { -->
<!-- //   const jobCards = document.querySelectorAll('.job-card'); -->
<!-- //   const paginationContainer = document.querySelector('.pagination'); -->
<!-- //   const perPage = 12; // 한 페이지당 표시할 카드 수 -->
<!-- //   const totalPages = Math.ceil(jobCards.length / perPage); // 총 페이지 수 -->

<!-- //   function showPage(pageNumber) { -->
<!-- //     const start = (pageNumber - 1) * perPage; -->
<!-- //     const end = start + perPage; -->
<!-- //     jobCards.forEach((card, index) => { -->
<!-- //       card.style.display = (index >= start && index < end) ? '' : 'none'; -->
<!-- //     }); -->
<!-- //   } -->

<!-- //   // 페이지 번호 버튼 생성 -->
<!-- //   for (let i = 1; i <= totalPages; i++) { -->
<!-- //     const pageButton = document.createElement('button'); -->
<!-- //     pageButton.innerText = i; -->
<!-- //     pageButton.addEventListener('click', () => showPage(i)); -->
<!-- //     paginationContainer.appendChild(pageButton); -->
<!-- //   } -->

<!-- //   // 초기 페이지 로드 -->
<!-- //   showPage(1); -->
<!-- // }); -->

<!-- </script> -->
</html>

