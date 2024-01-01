<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/community/list.css" type="text/css">
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
                <a href="">검색</a>
            </article>
        </section>

        <div class="list-area">
	        <c:forEach var="p" items="${ list }">
	            <section class="list">
	                <article class="list-content">
	                    <span class="list-title">${ p.postTitle }</span>
	                    <span>${ p.postContent }</span>
	                </article>
	                <article class="list-info">
	                    <span>${ p.count }</span>
	                    <span>${ p.userId }</span>
	                    <span>${ p.createDate }</span>
	                </article>
	            </section>
	        </c:forEach>
        </div>
    </square>
    <script>
    	$('#category').change(function(e) {
			console.log('값 변화! ' + e.target.value);
		});
    </script>
</body>
</html>