<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/community/write.css" type="text/css">
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