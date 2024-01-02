<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/list.css" type="text/css">
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
                	<a href="write.po">글작성</a>
                    <div class="list-searchBox">
                        <input class="list-search" type="text" placeholder="검색어를 입력하세요.">
                        <img src="${pageContext.request.contextPath}/resources/images/search_icon.png">
                    </div>
            </article>
        </section>

        <div class="list-area">
	        <c:forEach var="p" items="${list}">
	            <section class="post">
	                <article class="post-content">
	                    <span class="post-title">${p.postTitle}</span>
	                    <span>${p.postContent}</span>
	                </article>
	                <article class="post-info">
	                	<span>
	                	<img src="${pageContext.request.contextPath}/resources/images/hits_icon.png">
	                	<span>${p.count}</span>
	                	</span>
	                    <span>
	                    	<img src="${pageContext.request.contextPath}/resources/images/person_icon.png">
		                   <span>${p.userId}</span>
	                    </span>
	                    <span>
	                    	<img src="${ pageContext.request.contextPath}/resources/images/date_icon.png">
		                   <span>${p.createDate}</span>
	                    </span>
	                </article>
	            </section>
	        </c:forEach>
        </div>
        
        <section class="pagingbar">
			<c:if test="${pi.currentPage ne pi.startPage}">
				<button type="button" onclick="location.href = '${request.getContextPath()}list.po?currentPage=${ pi.currentPage - 1 }'">&lt; 이전</button>
			</c:if>
			
			<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
				<button type="button" onclick="location.href = '${request.getContextPath()}list.po?currentPage=${ i }'">${ i }</button>
			</c:forEach>
			
			<c:if test="${pi.currentPage ne pi.endPage}">
				<button type="button" onclick="location.href = '${request.getContextPath()}list.po?currentPage=${ pi.currentPage + 1 }'">다음 &gt;</button>
			</c:if>
		</section>
    </square>
    <script>
        
    	$('#category').change(function() {
	    	$.ajax({
                url : 'list.po',
                data : {category : $('#category').val(), currentPage : ${pi.currentPage}},
                type : 'post',
                success : (list) => {
                	console.log(list);
                    let tag = list.map((p) => {
						return (`<section class="post">
							<article class="post-content">
								<span class="post-title">` + p.postTitle + `</span>
								<span>` + p.postContent + `</span>
							</article>
							<article class="post-info">
								<span>` + p.count + `</span>
								<span>` + p.userId + `</span>
								<span>` + p.createDate + `</span>
							</article>
						</section>`);
					});
                    $('.post-area').html(tag.join(""));
                }, error : () => {
                    console.log("통신 실패");
                }
            });
		});
    </script>
</body>
</html>