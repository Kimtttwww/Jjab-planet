<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.main{
display:flex;
}
/* .sidebar{ */
/* width:200px; */
/* } */
.outer{
flex-basis:70%;
margin:0 auto;
}
tr td:nth-child(2){
width:500px;
}
td {
padding : 20px;
}
td>input[type=text]{
width:100%;
}
input:focus{
border-width : 0 0 2px;
border-color :green;
outline: none;
}
input{
border-width : 0 0 1px;
border-color:#eee;
padding : 10px;
}
input::value{
color:black;
font-size:14px;}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<div class="main">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		<div class="outer">
			<br>
			<h1 align="center">이력서</h1>
			<form action="resume.me" method="get">
				<table align="center">
					<tr>
						<td>이력서 제목</td>
						<td><input type="text" name="formTitle" value="${resume.formTitle}"required></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="workerName" value="${resume.workerName}" required></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="birth" value="${resume.birthday}" placeholder="생년월일(6자리)"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<c:if test="${resume.gender eq 'F'}">여자
							</c:if>
							<c:if test="${resume.gender eq 'M'}">남자
							</c:if>
						</td>
						
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr" value="${resume.address}"></td>
					</tr>
					<tr>
						<td>직종</td>
						<td>
							<input type="radio" name="jobName" value="S"
								<c:if test="${resume.jobName eq '풀스텍'}">checked</c:if>> 풀스텍
							<input type="radio" name="jobName" value="F"
								<c:if test="${resume.jobName eq '프론트엔드'}">checked</c:if>> 프론트엔드
							<input type="radio" name="jobName" value="B"
								<c:if test="${resume.jobName eq '백엔드'}">checked</c:if>> 백엔드
						</td>
					</tr>
					<tr>
						<td>공개 상태</td>
						<td>
							<input type="radio" name="isOpen" value="Y"
								<c:if test="${resume.isOpen eq 'Y'}">checked</c:if>> 공개
							<input type="radio" name="isOpen" value="N"
								<c:if test="${resume.isOpen eq 'N'}">checked</c:if>> 비공개
						</td>
					</tr>
					<tr>
						<td>학력</td>
						<td>
							<input type="radio" name="education" value="1" 
								<c:if test="${resume.education eq '고졸'}">checked</c:if>> 고졸
							<input type="radio" name="education" value="2"
								<c:if test="${resume.education eq '대학재학중'}">checked</c:if>> 대학재학중
							<input type="radio" name="education" value="3"
								<c:if test="${resume.education eq '대학졸업'}">checked</c:if>> 대학졸업
						</td>
					</tr>
					<tr>
						<td>경력</td>
						<td>
							<input type="radio" name="career" value="1"
								<c:if test="${resume.career eq '신입'}">checked</c:if>> 신입
							<input type="radio" name="career" value="2"
								<c:if test="${resume.career eq '3년미만'}">checked</c:if>> 3년미만
							<input type="radio" name="career" value="3"
								<c:if test="${resume.career eq '5년미만'}">checked</c:if>> 5년미만
							<input type="radio" name="career" value="4"
								<c:if test="${resume.career eq '7년미만'}">checked</c:if>> 7년미만
							<input type="radio" name="career" value="5"
								<c:if test="${resume.career eq '7년이상'}">checked</c:if>> 7년이상
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="submit" class="update-btn">수정</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>