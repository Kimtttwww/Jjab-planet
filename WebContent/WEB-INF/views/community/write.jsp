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
	
	<square>
        <section class="titlebar">
            <h1>게시글 작성</h1>
        </section>
    </square>

    <square>
        <form class="post" action="write.po" method="post">
            <article>  
                <select name="category" id="category" required>
                    <option value="">게시판을 선택해주세요.</option>
                    <option value="I">면접</option>
                    <option value="C">자격증</option>
                    <option value="S">자소서</option>
                </select>
                <input type="text" class="post-title" name="postTitle" placeholder="제목을 입력해주세요." required>
            </article>
			
			<textarea class="post-content" name="postContent" placeholder="내용을 입력해 주세요." required></textarea>
			
            <button>등록</button>
        </form>
    </square>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>