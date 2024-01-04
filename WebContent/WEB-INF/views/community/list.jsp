<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="project" value="${pageContext.request.contextPath}"/>
<c:set var="domain" value="${project}/list.po?"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${project}/resources/css/community/list.css" type="text/css">
</head>
<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<square>
        <section class="titlebar">
            <h1>커뮤니티 게시판</h1>
        </section>
        
        <section class="toolbar">
            <article>
                <select id="category">
                    <option value="A">전체</option>
                    <option value="I">면접</option>
                    <option value="C">자격증</option>
                    <option value="S">자소서</option>
                </select>
            </article>
            <article>
                	<a id="write">글작성</a>
                    <div class="list-searchBox">
                        <input class="list-search" type="text" placeholder="검색어를 입력하세요.">
                        <img id="search" src="${project}/resources/images/search_icon.png">
                    </div>
            </article>
        </section>

        <div class="list-area">
	        <c:forEach var="p" items="${list}">
	            <section class="post" onclick="location.href = '${project}/detail.po?postNo=${p.postNo}'">
	                <article class="post-content">
	                    <span class="post-title">${p.postTitle}</span>
	                    <span>${p.postContent}</span>
	                </article>
	                <article class="post-info">
	                	<span>
	                	<img src="${project}/resources/images/hits_icon.png">
	                	<span>${p.count}</span>
	                	</span>
	                    <span>
	                    	<img src="${project}/resources/images/person_icon.png">
		                   <span>${p.userId}</span>
	                    </span>
	                    <span>
	                    	<img src="${project}/resources/images/date_icon.png">
		                   <span>${p.createDate}</span>
	                    </span>
	                </article>
	            </section>
	        </c:forEach>
        </div>
        
        <section class="pagingbar">
			<c:if test="${pi.currentPage ne pi.startPage}">
				<button type="button" onclick="stepPage(-1)">&lt; 이전</button>
			</c:if>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				<button type="button"
				<c:if test="i eq ${pi.currentPage}">disabled</c:if>
				 onclick="page(${i})">${i}</button>
			</c:forEach>
			
			<c:if test="${pi.currentPage ne pi.endPage}">
				<button type="button" onclick="stepPage(1)">다음 &gt;</button>
			</c:if>
		</section>
    </square>
    <script>
//     	필터
    	$(() => {
    		if("${category}") $('#category').val('${category}');
    		if("${keyword}") $('.list-search').val('${keyword}');
    	});
       	
    	$('#category').change(() => {
    		location.href = '${domain}currentPage=1&category=' + $("#category").val();
		});
    	
    	$("#search").click(() => {
			location.href = '${domain}keyword=' + $('.list-search').val();
    	});
    	
//     	페이징
    	function page(n) {
			let domain = '${domain}currentPage=' + n;
			
			if("${category}") domain += '&category=${category}';
    		if("${keyword}") domain += '&keyword=${keyword}';
			
			location.href = domain;
    	}
    	
    	function stepPage(n) {
			let domain = '${domain}currentPage=' + (${pi.currentPage} + n);
			
			if("${category}") domain += '&category=${category}';
   			
    		location.href = domain;
    	}
    	
//     	게시글 작성
    	$("#write").click(() => {
    		let user = '${loginUser}';
    		if(user) {
    			location.href = '${project}/write.po';
    		} else {
    			alert("로그인 후 이용 가능합니다")
    		}
    	});
    </script>
</body>
</html>