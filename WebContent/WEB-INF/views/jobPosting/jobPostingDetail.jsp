<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${p.corp.corpName} 채용공고</title>
<style>
	.container{
	    display: flex;
	    flex-direction: column;
	    margin: 0 auto;
	}
	
	.content-container {
	  	width: 1200px;
	}
	
	square h2{
	    width: 75%;
	    font-size: 35px;
	    color: #155724;
	    margin: 20px auto;
	}
	
	square {
	    width: 1200px;
	    margin: 0 auto;
	    display: block;
	    padding: 20px;
	}
	
	/*회사명 틀*/
	#detail-header {
	    font-size: 18px;
	}
	
	.job-detail h2{
		width: 50%;
	    margin: 0 auto;
	    text-align: center;
	    font-size: 40px;
	    padding: 10px 0;
	    border-bottom: solid 1px rgb(210, 240, 210);
	}
	
	.job-detail h3{
	    margin: 0 auto;
	    width: 80%;
	    padding-top: 25px;
	}
	
	.job-detail p{
	    text-align: right;
	    margin: 5px;
	
	}
	
	.application-form {
	    text-size-adjust: 100%;
	}
	
	.application-guide ul{
	    list-style: none;
	    padding: 0;
	    
	}
	
	.application-guide li, square p {
	    width: 50%;
	    height: 37px;
	    display: flex;
	    align-items: center;
	    background-color: #f1f8ef;
	    font-size: 20px;
	    font-weight: bolder;
	    border-left: solid 1px rgb(101, 233, 101);
	    margin: 10px auto;
	    padding: 0;
	    padding-left: 35px;
	    
	}
	
	.application-guide-span{
	    margin-right: 10px;
	}
	
	.application-guide-span2{
	    margin-left: 25px;
	
	}
	
	.application-form p{
	    font-size: larger;
	}
	
	.cotent-footer {
	    display: flex;
	    justify-content: space-between;
	    flex-direction: row-reverse;
	    padding: 10px 0;
	}
	
	.cotent-footer button {
	    border: none;
	    border-radius: 5px;
	    padding: 10px 20px;
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
	
	.job-detail li{
	    width: 90%;
	    height: 25px;
	    list-style: none;
	    background-color: #fff;
	    text-align: right;  
	    font-size: smaller;
	    margin: 0;
	}
	
	.application-guide-head{
	    display: flex;
	    justify-content: space-between;
	    padding-right: 20px;
	}
	
	.content-container section:not(section:first-child) {
		margin-bottom: 40px;
	}
	
	/* 세부사항 박스 */
	.application-detail {
		width: 870px;
	    display: flex;
	    flex-direction: column;
	    margin: 0 auto;
	}
	
	/* 세부사항 그 잡채 */
	.application-detail h2 {
		margin: 0.83em 0;
	}
	
	/* 세부사항 내용 */
	.application-detail p {
		width: 580px;
	}
	
	.job-detail {
		display: flex;
	    padding: 0 20px;
	}
</style>
</head>

<body>
	<jsp:include page="../common/topbar.jsp"/>
	
	<square>
		<div class="container">
			<div class="content-container">
				<section class="job-detail">
					<h2>${p.corp.corpName}</h2>
					<h2>${p.postTitle }</h2>
				</section>
	
				<section class="application-guide">
					<h2>* 지원자격</h2>
					<ul>
						<li><span class="application-guide-span">경력 </span>: <span class="application-guide-span2"> ${p.career}</span></li>
						<li><span class="application-guide-span">직종 </span> :<span class="application-guide-span2">${p.jobName} </span></li>
						<li><span class="application-guide-span">학력 </span> :<span class="application-guide-span2">${p.education}</span></li>
						<li><span class="application-guide-span">지역 </span> :<span class="application-guide-span2">${p.location}</span></li>
					</ul>
				</section>
	
				<section class="application-form">
					<h2>* 채용내용</h2>
					<p>${p.postContent }</p>
				</section>
				
				<section class="application-detail">
					<h2>* 세부사항</h2>
					<p>채용마감일 : ${p.endDate}</p>
					<p>대표 : ${p.corp.ceoName} </p>
	                   <p>회사연락처 : (${p.phone})</p>
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
	</square>
	
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