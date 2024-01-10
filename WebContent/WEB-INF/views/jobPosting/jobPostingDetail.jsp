<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${p.corp.corpName} 채용공고</title>
<style>
	
	.square {
	    width: 800px;
	    margin: 0 auto;
	    padding: 20px;
	    display: flex;
	    flex-direction: column;
	}
	.post-content{
	    width: 75%;
	    font-size: 25px;
	    color: #155724;
	    margin: 0;
	}
	
	.post-title{
		font-size: 40px;
		font-weight: bold;
		margin-top: 30px; 
	}

	.application-guide-span {
	    height: 200px;
	    display: flex;
	    align-items: center;
	    background-color: #f1f8ef;
	    font-size: 20px;
	    font-weight: bolder;
	    border-left: solid 1px rgb(101, 233, 101);
	    margin: 10px auto;
	    padding-left: 35px;
	    flex-direction: row;
	    justify-content: space-evenly;
	}
	.application-guide-span > div{
		width: 45%;
		height: 60%;
	    display: flex;
	    flex-direction: column;
	    justify-content: space-evenly;
	}
	
	.application-form{
	    font-size: larger;
	    margin-top: 60px;
	    width: 100%;
	}
	.job-detail{
		display: flex;
		justify-content: space-evenly;
		
	}
	
	.cotent-footer {
	    padding: 10px 0;
	    display: flex;
	    justify-content: center;
	}
	
	.cotent-footer button {
	    border: none;
	    border-radius: 5px;
	    padding: 10px 20px;
	    width: 265px;
	    font-size: large;
	    font-weight: bold;
	    height: 55px;
	}
	
	.cotent-footer button[type="button"] {
	    background-color: #f8d7da;
	    color: #721c24;
	}
	
	.cotent-footer button[type="button"]:hover{
	    background-color: #ca8d92 ;
	    color: #fff;
	}
	
	.cotent-footer button[type="submit"] {
	    background-color: #c3e6cb;
	    color: #155724;
	}
	
	.cotent-footer button[type="submit"]:hover{
	    background-color: #8bbb97;
	    color: #fff;
	}
	

	

</style>
</head>

<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<div class="square">
		<div class="content-container">
			<div class="job-detail">
				<span class="post-title">${p.corp.corpName}</span>
				<span class="post-title">${p.postTitle}</span>
			</div>
			<hr>

			<section class="application-form">
				<p class="post-content">* 채용내용</p>
				<div class="application-guide-span">
					<p>${p.postContent}</p>
				</div>
			</section>
			
			<section class="application-form">
				<p class="post-content">* 지원자격</p>
				<div class="application-guide-span">
					<div>
						<span>경력 : ${p.career}</span>
						<span>학력 : ${p.education}</span>
					</div>
					<div>
						<span>직종 : ${p.jobName}</span>
						<span>지역 : ${p.location}</span>
					</div>
				</div>
			</section>
			
			<section class="application-form">
				<p class="post-content">* 세부사항</p>
				<div class="application-guide-span">
						<span>채용마감일 : ${p.endDate}</span>
						<span>대표 : ${p.corp.ceoName}</span>
						<span>문의 : ${p.phone}</span>
				</div>
			</section>
		</div>
	

		<div class="cotent-footer">
			<c:choose>
				<c:when test="${(loginUser.userType eq 'C') and (p.corpNo eq loginUser.userNo)}">
					<button type="button" onclick='location.href="notice.me?bno=${b.boardNo}"'>마이페이지이동</button>
				</c:when>

				<c:when test="${ loginUser.userType eq 'E' }">
					<button type="button" onclick="apply(${p.corpNo})">지원하기</button>
				</c:when>
			</c:choose>
		</div>
	</div>
	
	<script type="text/javascript">
		function apply(corpNo) {
	   		$.ajax({
	            url: 'applyForJob', type: 'post',
	            data: {'corpNo': corpNo},
	            success: (tf) => {
		            if(tf == 'true') {
		                alert("지원서가 제출되었습니다");
		                location.href = "list.job";
		            } else {
		                alert("제출할 지원서가 없습니다");
		            }
	            }, error: () => {
	                console.log("통신 실패");
	            }
	        });
		}
	</script>
</body>

</html>