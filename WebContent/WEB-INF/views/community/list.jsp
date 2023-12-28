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
        }

        square {
            width: 800px;
            margin: 0 auto;
            display: block;
        }

        square a {
            width: 100px;
            background-color: lightgray;
            color: black;
            text-decoration: none;
            font-size: larger;
            font-weight: bold;
            margin-left: 10px;
            padding: 5px 0;
        }

        /* 제목박스 */
        .titlebar {
            width: 350px;
            background-color: lightgray;
            text-align: center;
            font-size: 20px;
            margin: 0 auto;
        }
        
        /* 검색도구 */
        .toolbar {
            display: flex;
            text-align: center;
            margin: 20px 0;
        }
        
        /* 검색도구 드롭다운 박스 */
        .toolbar>article {
            display: flex;
            flex-basis: 50%;
        }
        
        /* 검색도구 카테고리 */
        .toolbar select {
            width: 100px;
        }
        
        /* 검색도구 왼쪽 버튼 2개 박스 */
        .toolbar>article:last-of-type {
            flex-direction: row-reverse;
        }
        
        /* 게시글 박스 */
        .list-area {
            display: flex;
            flex-wrap: wrap;
        }
        
        /* 각 게시글 */
        .list {
            width: 100%;
            display: flex;
            background-color: lightgray;
            margin-bottom: 10px;
        }
        
        /* 게시글 2등분 좌측 */
        .list-content {
            display: flex;
            flex-basis: 80%;
            flex-direction: column;
            padding: 10px;
            padding-left: 20px;
        }

        /* 게시글 제목 */
        .list-title {
            font-weight: bold;
            font-size: larger;
            margin-bottom: 10px;
        }

        /* 게시글 정보(조회수 등) 박스 */
        .list-info {
            display: flex;
            flex-basis: 20%;
            flex-direction: column;
            justify-content: space-evenly;
            text-align: center;
        }

        /* 게시글 정보 내용들 */
        .list-info span {
            background-color: rgb(200, 255, 200);
        }
    </style>
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