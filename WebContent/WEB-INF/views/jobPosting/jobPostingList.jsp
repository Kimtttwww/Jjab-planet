<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>채용공고 리스트</title>
  <script src="/3script/jobPostingList.js"></script>
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/jobPostingList.css" type="text/css">
</head>
<body>

 <jsp:include page="/WEB-INF/views/common/topbar.jsp" />


  <div class="head-container">
  
  	<h1 style="text-align: center; border-bottom: solid 1px; padding-bottom: 50px; font-size: 5ch;"> 
      채 용 공 고
    </h1>
  
    <header>

      <select id="category">
        <option value="F">프론트엔드</option>
        <option value="B">백엔드</option>
        <option value="S">풀스택</option>
      </select>

      <div>
        <input type="search" id="search-box" placeholder="기업검색">
      </div>

    </header>

    <main>

      <section class="job-listing">
      
        <c:forEach var="p" items="${list }">
			<div class="job-card" data-category="${p.category}"   onclick='location.href = "detail.job?bno=${p.jobpostNo }"'>
				<img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" class="company-logo">
				<div class="job-info">
					<h3 class="job-offer-title">${p.postTitle }</h3>
					<p class="employee-condition">${p.postContent }</p>
					<p class="corporate-name">${p.corpName}</p>
					<div class="deadline-box">
						<p class="deadline">${p.endDate}</p>
					</div>
				</div>
			</div>
		</c:forEach>
        
        
        <!-- 추가 채용공고 카드 -->
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">애플</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">회사명</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">테슬라</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">나이키</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">LG</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">회사명</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">회사명</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">현대</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">테슬라</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        <div class="job-card">
          <img src="resource/구글로고.png" alt="회사 로고" class="company-logo">
          <div class="job-info">
            <h3 class="job-offer-title">공고제목공고제목공고제목공고공고제목</h3>
            <p class="employee-condition">채용조건채용조건채용조건채용조건채용조건</p>
            <p class="corporate-name">구글</p>
            <div class="deadline-box">
              <p class="deadline">마감일: 2023/01/01</p>
            </div>
          </div>
        </div>
        
        
    
    

      </section>
    </main>

    <div class="pagination">
      <c:url value="${empty condition ? 'list.job' : 'search.bo'}" var="url">
		<c:param name="condition" value="${condition }"/>
		<c:param name="keyword" value="${keyword }"/>
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
  </div>
  
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


//필터기능
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

    