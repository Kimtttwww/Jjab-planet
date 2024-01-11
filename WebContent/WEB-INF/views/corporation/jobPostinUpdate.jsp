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
	    background-color: #F1F8EF;
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
	    background-color: #F8D7DA;
	    color: #721C24;
	}
	
	.cotent-footer button[type="button"]:hover{
	    background-color: #CA8D92 ;
	    color: #fff;
	}
	
	.cotent-footer button[type="submit"] {
	    background-color: #C3E6CB;
	    color: #155724;
	}
	
	.cotent-footer button[type="submit"]:hover{
	    background-color: #8BBB97;
	    color: #fff;
	}
</style>
</head>
<body>
	<jsp:include page="../common/topbar.jsp"/>
	<form action="mypage.me" method="post" style="margin: 100px auto;">
	<div class="square">
		<div class="content-container">
			<div class="job-detail">
				<span class="post-title">${p.corp.corpName}</span>
				<span class="post-title">공고명: <input type="text" name="postTitle" class="update-textL" value="${p.postTitle}"></span>
			</div>
			<hr>
		<section class="application-form">
				<p class="post-content">채용 공고 수정</p> <br><br>
				<span class="post-content">공고내용: <input type="text" name="postContent" class="update-textL"  value="${p.postContent}"></span>
		</section> 
			
			<section class="application-form">
				<p class="post-content">* 지원자격</p>
				<div class="application-guide-span">
					<div>
						<span>경력 : <input type="text" name="career" class="update-textL" value="${p.career}"></span>
						<span>학력 : <input type="text" name="education" class="update-textL" value="${p.education}"></span>
					</div>
					<div>
						<span>직종 : <input type="text" name="jobName" class="update-textL" value = "${p.jobName}"></span>
						<span>지원구분 : <select name="jobNo" id="jobNo" class="update-textL">
        									<c:choose>
            									<c:when test="${p.jobNo eq 'S'}">
               									 <option value="S" selected>풀스택</option>
            									</c:when>
           										 <c:when test="${p.jobNo eq 'B'}">
               									  <option value="B" selected>백엔드</option>
           												 </c:when>
            										<c:when test="${p.jobNo eq 'F'}">
               										 <option value="F" selected>프론트엔드</option>
           											 </c:when>
            										<c:otherwise>
                <option value="S">풀스택</option>
                <option value="B">백엔드</option>
                <option value="F">프론트엔드</option>
            </c:otherwise>
        </c:choose>
    </select>
<!-- 									이쪽부분에서 {p.jobNo} 값을 불러야와야하는데 어떻게 해야할지 모르겠음 -->
						</span>
						<span>지역 : <input type="text" name="loation" class="update-textL" value="${p.location}"></span>
					</div>
				</div>
			</section>
			
			<section class="application-form">
				<p class="post-content">* 세부사항</p>
				<div class="application-guide-span">
						<span>채용마감일 :  <input type="text" name="endDate" class="update-textL" value="${p.endDate}"></span>
						<span>대표 : ${p.corp.ceoName}</span>
						<span>문의 : ${p.phone}</span>
				</div>
			</section>
			
			<div class="update-btnBox">
					<button type="submit" class="update-btn">수정 및 등록</button>
			</div>
		</div>
		
		
		
	</div>
	</form>
	
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