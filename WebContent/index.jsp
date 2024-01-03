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

<script>
$(()=>{
	$.ajax({
	    url : 'index.co',
	    type : 'get',
	    success : (list) => {
	    	console.log(list);
//	         let tag = list.map((p) => {
//	 			return (`<section class="post">
	// <article class="post-content">
	// <span class="post-title">` + p.postTitle + `</span>
	// <span>` + p.postContent + `</span>
	// </article>
	// <article class="post-info">
	// <span>` + p.count + `</span>
	// <span>` + p.userId + `</span>
	// <span>` + p.createDate + `</span>
	// </article>
	// </section>`);
//	 		});
//	     	console.log(tag);
//	         $('.list-area').html(tag.join(""));
	    }, error : () => {
	        console.log("통신 실패");
	    }
	}); 
})

</script>

<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="content_title">
			<a href="list.job">인기
				많은 공고 ></a>
		</div>
		<div class="top_banner">
			<!--최다 조회수 배너-->
			
			
			<div class="top_b1" onclick='location.href = "detail.job?bno=${p.jobpostNo}"'>
				<img
					src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg">
					<c:forEach var="p" items="${idx_list }">
				<p>${p.corpName}</p>
				<p>${p.postTitle }</p>
				<p class="content_bottom">${p.count }</p>
				</c:forEach>
			</div>
			
			
			<!--top_b1-->
			
<!-- 			<div class="top_b2"> -->
<!-- 				<img -->
<%-- 					src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" --%>
<!-- 					alt=""> -->
<!-- 				<p></p> -->
<!-- 				<p></p> -->
<!-- 				<p class="content_bottom"></p> -->
<!-- 			</div> -->
<!-- 			<div class="top_b2"> -->
<!-- 				<img -->
<%-- 					src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" --%>
<!-- 					alt=""> -->
<!-- 				<p>넥슨</p> -->
<!-- 				<p>공고제목</p> -->
<!-- 				<p class="content_bottom">직종 / 조회수</p> -->
<!-- 			</div> -->
		</div>
		
		<!--top_banner-->

		<div class="content_title"><a href="" class="content_title">최신 공고 ></a></div>
		<div class="new_banner_content">
			<!--최신 공고 배너-->
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
			</div>
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
			</div>
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
			</div>
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
			</div>
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
			</div>
			<div class="new_banner">
					<img class="content_top"
						src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"
						alt="">
					<p>넥슨</p>
					<p>공고제목</p>
					<p class="content_bottom">직종 / 작성일</p>
		</div>
		</div>

		<div class="content_title"><a href="" class="content_title">전체 공고> </a></div>
		<div class="all_list" style="margin-bottom:500px;">
			<ul>
				<li>기업명</li>
				<li id="list_title">공고 제목</li>
				<li>
					<div class="s_info">
						<ul>
							<li>간단정보 1 지역</li>
							<li>간단정보 2 경력</li>
							<li>간단정보 3 학력</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="btn">
						<a href="#">입사지원</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>