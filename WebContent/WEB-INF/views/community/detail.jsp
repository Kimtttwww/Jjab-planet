<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(게시글이름)</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/community/detail.css" type="text/css">
</head>
<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<section class="titlebar">
        <h1>커뮤니티 게시판</h1>
    </section>
    
    <square>
        <section class="topbar">
            <article>
                <a>목록</a>
            </article>
            <article>
                <span>조회수</span>
            </article>
        </section>

        <section class="list">
            <div class="list-box">
                <article class="post-info">
                    <span class="post-title">게시글 제목</span>
                    <span>작성자</span>
                    <span>작성일</span>
                </article>
                
                <article class="post-content">
                    <p>가나다라</p>
                </article>
            </div>

            <article class="need-login">
                <a href="">수정</a>
                <a href="">삭제</a>
                <a href="">신고하기</a>
            </article>
        </section>

        <section class="reply">
            <section class="reply-write">
                <article>
                    <textarea>로그인 후 이용 가능합니다</textarea>
                </article>
                <article>
                    <a href="">등록</a>
                </article>
            </section>
            
            <section class="reply-read">
                <article>
                    <span>다른 댓글 1</span>
                </article>
                <article class="need-login">
                    <a href="">수정</a>
                    <a href="">삭제</a>
                    <a href="">신고하기</a>
                </article>
            </section>

            <section class="reply-read">
                <article>
                    <span>다른 댓글 2</span>
                </article>
                <article class="need-login">
                    <a href="">수정</a>
                    <a href="">삭제</a>
                    <a href="">신고하기</a>
                </article>
            </section>
        </section>
    </square>
</body>
</html>