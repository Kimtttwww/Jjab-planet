<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <select name="category" id="category">
                    <option value="">전체</option>
                    <option value="">면접</option>
                    <option value="">자격증</option>
                    <option value="">자소서</option>
                </select>
            </article>
            <article>
                <a href="write.po">글작성</a>
                <a href="">검색</a>
            </article>
        </section>

        <div class="list-area">
            <section class="list">
                <article class="list-content">
                    <span class="list-title">게시글 제목</span>
                    <span>게시글 요약 내용</span>
                </article>
                <article class="list-info">
                    <span>조회수</span>
                    <span>작성자</span>
                    <span>작성일</span>
                </article>
            </section>

            <section class="list">
                <article class="list-content">
                    <span class="list-title">게시글 제목</span>
                    <span>게시글 요약 내용</span>
                </article>
                <article class="list-info">
                    <span>조회수</span>
                    <span>작성자</span>
                    <span>작성일</span>
                </article>
            </section>
        </div>

    </square>
</body>
</html>