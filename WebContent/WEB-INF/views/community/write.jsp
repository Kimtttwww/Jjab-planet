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
            margin: 0 auto;
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

        /* 제목박스 */
        .titlebar {
            width: 350px;
            background-color: lightgray;
            text-align: center;
            font-size: 20px;
            margin: 0 auto;
        }

        /* 게시글 박스, 댓글 박스 */
        .list {
            display: flex;
            flex-direction: column;
            background-color: brown;
            margin-bottom: 20px;
            padding: 20px 50px;
        }
        
        /* 게시글 박스, 댓글 박스 */
        .list>article {
            display: flex;
        }

        /* 카테고리 */
        #category {
            width: 100px;
        }

        /* 게시글 제목 */
        .post-title {
            width: 80%;
            background-color: rgb(200, 255, 200);
            font-size: larger;
            margin-left: 20px;
            padding: 0 20px;
        }

        /* 게시글 좌측 박스 내부 각 정보들 */
        .list-content {
            min-height: 300px;
            background-color: rgb(200, 255, 200);
            margin: 10px 0;
            padding: 10px;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<square style="background-color: white;">
        <section class="titlebar">
            <h1>커뮤니티 게시판</h1>
        </section>
    </square>

    <square>
        <div class="list">
            <article>
                <select name="category" id="category">
                    <option value="">전체</option>
                    <option value="">면접</option>
                    <option value="">자격증</option>
                    <option value="">자소서</option>
                </select>
                <span class="post-title">게시글 제목</span>
            </article>

            <article class="list-content">
                <p>가나다라</p>
            </article>

            <button style="margin: 0 auto;">등록</button>
        </div>
    </square>
</body>
</html>