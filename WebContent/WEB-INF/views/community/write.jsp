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
            <h1>게시글 작성</h1>
        </section>
    </square>

    <square>
        <form class="post" action="write.po" method="post">
            <article>  
                <select name="category" id="category">
                    <option value="I">면접</option>
                    <option value="C">자격증</option>
                    <option value="S">자소서</option>
                </select>
                <input type="text" class="post-title" name="postTitle">
            </article>
			
			<textarea class="post-content" name="postContent">가나다라</textarea>
			
            <button style="margin: 0 auto;">등록</button>
        </form>
    </square>
</body>
</html>