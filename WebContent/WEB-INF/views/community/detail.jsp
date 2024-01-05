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
                    <input type="text" class="post-title" value="${ p.postTitle }">
                    <span>${ p.userId }</span>
                    <span>${ p.createDate }</span>
                </article>
                
                <textarea class="post-content">${ p.postContent }</textarea>
            </div>

            <article class="need-login">
                <a onclick="change(this, 'P')">수정</a>
                <a href="change.pr?type=P&postNo=${ p.postNo }">삭제</a>
            </article>
        </section>

        <section class="reply">
            <section class="reply-write">
				<textarea id="replyContent"></textarea>
				<a onclick="refresh()">등록</a>
            </section>
            
			<c:forEach var="r" items="${ p.replyList }">
	            <section class="reply-read">
	                <article>
						<span>${ r.userId }</span>
						<span>${ r.createDate }</span>
						<textarea>${ r.replyContent }</textarea>
	                </article>
	                <article class="need-login">
	                    <a onclick="change(this, 'R', ${r.replyNo})">수정</a>
	                    <a href="change.pr?type=R&postNo=${ p.postNo }&replyNo=${r.replyNo}">삭제</a>
	                </article>
	            </section>
			</c:forEach>
        </section>
    </square>
    <script>
    	$(() => {
    		/* 댓글 작성 제약 */
    		if(!('${loginUser}')){
    			$("#replyContent").text("로그인 후 이용 가능합니다");
    			$("#replyContent").prop("readOnly", true);
    		}
    		
	    	/* 본인 것이 아닌건 못 건들게 */
    		$('textarea').each((i, ele) => {
    			switch(i){
    			case 0:
		   			if($(ele).prev().children().eq(1).text() != '${loginUser.userId}'){
		   				$(ele).prop("readOnly", true);
   						$(ele).parent().next().addClass("off");
   						$(ele).prev().children().eq(0).prop("readOnly", true);
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
    	
    	/* 댓글 작성 */
    	function refresh() {
    		if('${loginUser}' && $("#replyContent").val()){
	    		$.ajax({
	                url: 'write.re', type: 'post',
	                data: {postNo: '${ p.postNo }', replyContent: $('#replyContent').val()},
	                success: (tf) => {
			    		if(tf) {
			    			alert("댓글이 등록되었습니다");
			    		} else {
			    			alert("오류가 발생하였습니다");
			    		}
	   					location.href = "${project}/detail.po?postNo=${ p.postNo }";
	                }, error: () => {
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
    	
    	/* 아무거나 수정 요청 */
    	function change(ele, ty, rno) {
    		console.log(ele, ty);
    		let list = {'type': ty, postNo: ${ p.postNo }};
          	if(ty == 'P') {
          		list['postTitle'] = $(".post-title").val();
          		list['postContent'] = $(".post-content").val();
          	}
          	if(ty == 'R') {
          		list['replyNo'] = rno;
          		list['replyContent'] = $(ele).parent().prev().children().eq(2).val();
          	}
    		console.log(list);
    		$.ajax({
                url: 'change.pr', type: 'post',
                data: list,
                success: (tf) => {
		    		if(tf) {
		    			if(ty == 'P') {
			    			alert("게시글이 수정되었습니다");
		    			} else {
			    			alert("댓글이 수정되었습니다");
		    			}
		    		} else {
		    			alert("오류가 발생하였습니다");
		    		}
   					location.href = "${project}/detail.po?postNo=${ p.postNo }";
                }, error: () => {
                    console.log("통신 실패");
                }
            });
   		}
    </script>
</body>
</html>