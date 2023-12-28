<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        body {
            box-sizing: border-box;
            margin: 0;
        }

        square {
            width: 850px;
            margin: 0 auto;
            display: block;
            background-color: lightgray;
            padding: 20px;
        }

        a {
            width: 100px;
            background-color: lightgray;
            color: black;
            font-size: large;
            font-weight: bold;
            text-decoration: none;
        }

        textarea {
            width: 99%;
            height: 90%;
            resize: none;
        }

        /* 제목박스 */
        .titlebar {
            width: 350px;
            background-color: lightgray;
            text-align: center;
            font-size: 20px;
            margin: 0 auto;
        }

        /* 제목 다음 박스 */
        .topbar {
            display: flex;
            font-size: large;
            margin: 20px 0;
        }
        
        /* 제목 다음 박스 2등분 */
        .topbar>article {
            display: flex;
            flex-basis: 50%;
        }

        .topbar>article>* {
            width: 100px;
            background-color: rgb(200, 255, 200);
            text-align: center;
        }
        
        /* 제목 다음 박스 안 우측 박스 */
        .topbar>article:last-of-type {
            flex-direction: row-reverse;
        }
        
        /* 게시글 박스, 댓글 박스 */
        .list, .reply{
            display: flex;
            background-color: brown;
            margin-bottom: 20px;
            padding: 20px 50px;
        }
        
        /* 게시글 내부 좌측 박스 */
        .list-box {
            display: flex;
            flex-direction: column;
            flex-basis: 80%;
        }

        /* 게시글 좌측 박스 내부 정보 박스 */
        .post-info {
            display: flex;
            justify-content: space-between;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        /* 게시글 좌측 박스 내부 제목 */
        .post-info span:first-of-type {
            width: 48%;
        }
        
        /* 게시글 좌측 박스 내부 각 정보들 */
        .post-info span {
            width: 23%;
            background-color: rgb(200, 255, 200);
            font-size: larger;
        }

        /* 게시글 좌측 박스 내부 각 정보들 */
        .post-content {
            min-height: 150px;
            background-color: rgb(200, 255, 200);
            padding: 10px;
        }
        
        /* 게시글 내부 우측 박스 */
        .need-login {
            display: flex;
            flex-basis: 20%;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            text-align: center;
        }

        /* 댓글 박스 */
        .reply {
            flex-direction: column;
        }

        /* 댓글 작성 박스 */
        .reply-write {
            height: 75px;
            display: flex;
            background-color: brown;
            margin-bottom: 10px;
        }

        /* 댓글 작성 부분 박스 */
        .reply-write>article:first-of-type, .reply-read>article:first-of-type {
            flex-basis: 80%;
        }
        
        /* 댓글 등록 박스 */
        .reply-write>article:last-of-type {
            display: flex;
            flex-basis: 20%;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        /* 댓글 내부 좌측 박스 */
        .reply-box {
            display: flex;
            flex-direction: column;
            flex-basis: 80%;
            padding: 0 50px;
        }

        /* 댓글 좌측 박스 내부 정보 */
        .reply-info {
            display: flex;
            justify-content: space-between;
            text-align: center;
            font-weight: bold;
            margin: 5px 0;
        }
        
        /* 게시글 좌측 박스 내부 제목 */
        .reply-read {
            display: flex;
            margin-bottom: 20px;
        }
        
        /* 게시글 좌측 박스 내부 제목 */
        .reply-read span {
            height: 150px;
            display: flex;
            background-color: skyblue;
        }
        </style>
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