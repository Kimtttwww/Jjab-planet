<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${corp.corpName} 채용공고</title>
<style>
.container{
    display: flex;
    flex-direction: row;
    margin: 0 auto;
}

.content-container header{
    background-color: #d9ecde;
    border: solid 1px#3bdf64;
    
}

#detail-body h2{
    color: #155724;
}

#detail-body {
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    max-width: 1200px;
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    /* justify-content: center ; */
}

#detail-body-header, #detail-main, .cotent-footer {
    margin: 10px;
    padding: 15px;
}

#detail-body-header {
    background-color: #bee2c0;
    text-align: center;
    font-size: 28px;
}

#detail-body-header h1 {
    color: #333;
}

.job-detail, .application-guide, .application-form {
    background-color: #fff;
    border: 1px solid #d0e9d0;
    margin-bottom: 40px;
    padding: 20px;

}

.job-detail h2, .job-detail h1{
    width: 85%;
    margin: 0 auto;
    font-size: 40px;
    padding-bottom:25px;
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

.application-guide h2, .application-form h2{
    font-size: 35px;
    width: 75%;
    margin: 0 auto;
    margin-top: 20px;
    margin-bottom: 20px;
    
}

.application-guide ul{
    list-style: none;
    padding: 0;
    
}

.application-guide li, .application-form p {
    margin:  0 auto;
    background-color: #f1f8ef;
    margin-bottom: 10px;
    margin-top: 10px;
    padding: 0;
    height: 37px;
    font-size: 20px;
    font-weight: bolder;
    font-size:20px;
    width: 50%;
    padding-left: 35px ;
    border-left: solid 1px rgb(101, 233, 101);
    display: flex;
    align-items: center;
    
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
    padding: 10px 0;
    flex-direction: row-reverse;
    
}

.cotent-footer button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
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
    height: 25px;
    list-style: none;
    width: 90%;
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
</style>
</head>

<body id="detail-body">
<jsp:include page="../common/topbar.jsp"/>
<div class="container">
	<form action="/detail.job" method="get" style="width: 1200px;">
		<div class="content-container">
			<header id="detail-body-header">
				<h1>${corp.corpName}</h1>
			</header>

			<main id="detail-main">
				<section class="job-detail">
					<h2 style="color: #333;">${p.postTitle }</h2>
				</section>

				<section class="application-guide">
					<div class="application-guide-head" >
						<h2>* 지원안내</h2>
<%-- 						<span style="font-size: 20px;">조회수 : ${p.count}</span> --%>
					</div>
					<ul>
						<li><span class="application-guide-span">경력 </span>: <span class="application-guide-span2"> ${p.career}</span></li>
						<li><span class="application-guide-span">직종 </span> :<span class="application-guide-span2">${p.jobName} </span></li>
						<li><span class="application-guide-span">학력 </span> :<span class="application-guide-span2">${p.education}</span></li>
						<li><span class="application-guide-span">지역 </span> :<span class="application-guide-span2">${p.location}</span></li>
					</ul>
				</section>

				<section class="application-form">
					<h2>* 채용내용</h2>
					<div>
						<p>${p.postContent }</p>
					</div>
				</section>

				<div class="job-detail"
					style="display: flex; flex-direction: column;">
					<p>채용마감일 : ${p.endDate}</p>
					<p>대표 : ${corp.ceoName} </p>
                    <p>회사연락처 : (${p.phone})      </p>
				</div>
			</main>
		</div>

		<div class="cotent-footer">
			<!-- userType이 null일 경우 (로그인하지 않은 사용자) -->
			<!-- 로그인하지 않은 사용자에게 표시될 내용 -->
			<!-- userType이 'E'인 경우 (개인 사용자) -->
			<!-- userType이 'C'인 경우 (기업 사용자) -->
			<c:choose>
				<c:when test="${loginUser.userType == null}">
					<div>로그인이 필요합니다</div>
				</c:when>
				<%-- <c:when test="${loginUser.userType == 'E'}"> --%>
				<%-- </c:when> --%>

				<c:when test="${loginUser.userType == 'C'}">
					<button type="button"
						onclick='location.href="myPage.me?bno=${b.boardNo}"'>수정페이지로이동</button>
				</c:when>
			</c:choose>

            <c:if test="${loginUser.userType == 'E'}">
                <!-- 개인(구직자) 회원이고 이력서가 등록되어 있을 경우에만 지원 버튼 표시 -->
                <!-- 숨겨진 입력필드 사용자에게 보이지않음,폼제출시 서버로 전송 -->
                <button type="button" onclick="apply(${p.corpNo})">지원하기</button>
            </c:if>
		</div>
	</form>
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