<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


.content-container{
    display: flex;
    flex-direction: column;
    
    
}
.content-container header{
    background-color: #d9ecde;
    border: solid 1px#3bdf64;
    
}

body {
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    max-width: 1200px;
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
}

header, main, footer {
    margin: 10px;
    padding: 15px;
}

header {
    background-color: #e9ecef;
    text-align: center;
    font-size: 28px;
}

h1 {
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
    margin-bottom: 20px;
    padding: 10px;
    height: 37px;
    font-size: 20px;
    font-weight: bolder;
    font-size:25px;
    width: 50%;
    padding-left: 15% ;
    border-left: solid 1px rgb(101, 233, 101);

}
.application-form p{
    font-size: larger;
}

.cotent-footer {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
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

<body>

	<form action="/detail.job" method="get">
		<div class="content-container">
			<header>
				<h1>${p.corpName}</h1>
			</header>

			<main>
				<section class="job-detail">
					<h2>${p.postTitle }</h2>
				</section>

				<section class="application-guide">
					<div class="application-guide-head">
						<h2>* 지원안내</h2>
						<span style="font-size: 20px;">조회수 : ${p.count}</span>
					</div>
					<ul>
						<li>경력 : ${p.career}</li>
						<li>직종 : ${p.jobName}</li>
						<li>학력 : ${p.education}</li>
						<li>지역 : ${p.location}</li>
					</ul>
				</section>

				<section class="application-form">
					<h2>* 채용내용</h2>
					<div>
						<p>${p.postContent }</p>
					</div>
				</section>
				
				<div class="job-detail"	style="display: flex; flex-direction: column;">
					<li>마감일 : ${p.endDate}</li>
					<li>대표 : ${p.ceoName} 회사연락처:(${p.phone})</li>
				</div>
			</main>

		</div>

		<div class="cotent-footer">
			<button type="button" onclick='location.href="myPage.me?bno=${b.boardNo}"'>수정페이지로이동</button>
			<c:choose>
				<!-- userType이 null일 경우 (로그인하지 않은 사용자) -->
				<c:when test="${p.userType == null}">
					<!-- 로그인하지 않은 사용자에게 표시될 내용 -->
				</c:when>

				<!-- userType이 'E'인 경우 (개인 사용자) -->
				<c:when test="${p.userType == 'E'}">
					<a href="myPage.me">마이페이지</a>
				</c:when>

				<!-- userType이 'C'인 경우 (기업 사용자) -->
				<c:when test="${p.userType == 'C'}">
					<a href="companyPage.me">기업 관리 페이지</a>
				</c:when>
			</c:choose>

			<button type="submit">지원</button>
		</div>
	</form>

</body>

</html>