<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="project" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ p.postTitle }</title>
<link rel="stylesheet" href="${ project }/resources/css/community/detail.css" type="text/css">
</head>
<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<section class="titlebar">
        <h1>커뮤니티 게시판</h1>
    </section>
    
    <square>
        <section class="topbar">
            <article>
                <a href="list.po">목록</a>
            </article>
            <article>
                <span>${ p.count }</span>
            </article>
        </section>

        <section class="post">
            <div class="post-box">
                <article class="post-info">
                    <span class="post-title">${ p.postTitle }</span>
                    <span>${ p.userId }</span>
                    <span>${ p.createDate }</span>
                </article>
                
                <textarea class="post-content">${ p.postContent }</textarea>
            </div>

            <article class="need-login">
                <a href="edit.pr?type=P&postNo=${ p.postNo }">수정</a>
                <a href="del.pr?type=P&postNo=${ p.postNo }">삭제</a>
            </article>
        </section>

        <section class="reply">
            <section class="reply-write">
				<textarea id="replyContent"></textarea>
				<a onclick="refresh(${ p.postNo })">등록</a>
            </section>
            
			<c:forEach var="r" items="${ p.replyList }">
	            <section class="reply-read">
	                <article>
						<span>${ r.userId }</span>
						<span>${ r.createDate }</span>
						<textarea>${ r.replyContent }</textarea>
	                </article>
	                <article class="need-login">
	                    <a href="edit.pr?type=R&postNo=${ p.postNo }&replyNo=${r.replyNo}">수정</a>
	                    <a href="del.pr?type=R&postNo=${ p.postNo }&replyNo=${r.replyNo}">삭제</a>
	                </article>
	            </section>
			</c:forEach>
        </section>
    </square>
    <script>
    	const test = '${loginUser}';
    	
    	$(() => {
    		if(!('${loginUser}')){
    			$("#replyContent").text("로그인 후 이용 가능합니다");
    		}
    		
    		$('textarea').each((i, ele) => {
    			switch(i){
    			case 0:
		   			if($(ele).prev().children().eq(1).text() != '${loginUser.userId}'){
		   				$(ele).prop("readOnly", true);
   						$(ele).parent().next().addClass("off");
		   			}
		   			break;
    			case 1:break;
    			default:
		   			if($(ele).prev().prev().text() != '${loginUser.userId}'){
		   				$(ele).prop("readOnly", true);
   						$(ele).parent().next().addClass("off");
		   			}
		   			break;
    			}
    		});
    	});
    	
    	function refresh(p) {
    		if('${loginUser}' && $("#replyContent").val()){
	    		$.ajax({
	                url : 'write.re', type : 'post',
	                data : {postNo : p, replyContent : $('#replyContent').val()},
	                success : (tf) => {
			    		if(tf) {
			    			alert("댓글이 등록되었습니다");
			    		} else {
			    			alert("오류가 발생하였습니다");
			    		}
	   					location.href = "${project}/detail.po?postNo=" + p;
	                }, error : () => {
	                    console.log("통신 실패");
	                }
	            });
    		} else if (!'${loginUser}') {
    			alert("로그인 후 이용 가능합니다");
    		} else {
    			alert("댓글을 작성해주시기 바랍니다");
    			$("#replyContent").focus();
    		}
    	}
    </script>
</body>
</html>