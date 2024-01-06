<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/3script/jobPostingList.js"></script>
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/jobPostingDetailCp.css" type="text/css">
	<link rel="stylesheet" href="/JJOB/WebContent/resources/css/jobPostingDetailCp.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
 	
 	<div class="container">
	    <h1>채용 공고 (기업)</h1>
	    <p class="instructions">* 정확한 정보를 입력해 주세요.</p>

	    <!-- 폼 태그 시작 -->
	    <form action="/detail.job2" method="get">
			<!-- 채용제목 입력 필드 -->
			<div class="form-group">
			  <label for="name">채용제목</label>
			  <c:if test="${empty p.postTitle}">
			   <input type="text" id="name" name="name" required placeholder="공고제목을 입력하세요" >
			  </c:if>
			  <input type="text" id="name" name="name" required placeholder="${p.postTitle}">
			</div>
	
			<!-- 대표자명 입력 필드-->
			<div class="form-group">
				<label for="name">대표자명</label>
				<c:if test="${empty p.ceoName}">
					<input type="text" id="name" name="name" required placeholder="대표자명을 입력하세요">
				</c:if>
				<input type="text" id="name" name="name" required placeholder="${p.ceoName}">
			</div>
			
			<!-- 휴대폰 번호 입력 필드 -->
			<div class="form-group">
				<label for="phone">휴대폰</label>
				<c:if test="${empty p.ceoName}">
					<input type="text" id="name" name="name" required placeholder="휴대폰번호를 입력하세요">
				</c:if>
				<input type="tel" id="phone" name="phone" required placeholder="${p.phone}">
			</div>
			
			
			<!-- 학력 필드 value값 고쳐야함-->
			<div class="form-group">
				<label for="position">학력</label>
				<select id="position" name="position">
					<c:if test="${!empty p.education }">
						<option value="${p.education }">${p.education }</option>
					</c:if>
					<option value="junior">고졸</option>
					<option value="senior">초대졸</option>
					<option value="senior">대졸</option>
				</select>
			</div>
			
			<!-- 경력여부 value값 고쳐야함 -->
			<div class="form-group">
				<label for="position">경력여부</label>
				<select id="position" name="position">
					<c:if test="${!empty p.career }">
						<option value="${p.career }">${p.career }</option>
					</c:if>
					<option value="new">신입</option>
					<option value="junior">1~3년</option>
					<option value="senior">3~5년</option>
					<option value="reader">5~7년</option>
					<option value="master">7년 이상</option>
				</select>
			</div>
				      
			<!-- 직종 선택 필드 -->
			<div class="form-group">
				<label for="position"> 직종 </label>
				<select id="position" name="position">
					<c:if test="${!empty p.career }">
						<option value="${p.career }">${p.career }</option>
					</c:if>
				    <option value="back">백엔드</option>
				    <option value="front">프론트엔드</option>
				    <option value="full">풀스택</option>
			  </select>
			</div>
			
			<!-- 지역 선택 필드 value값 고쳐야함-->
			<div class="form-group">
				<label for="position">지역</label>
				<select id="position" name="position">
					<c:if test="${!empty p.location }">
						<option value="${p.location }">${p.location }</option>
					</c:if>
					<option value="seoul">서울</option>
					<option value="gyeonggi">경기</option>
					<option value="Incheon">인천</option>
					<option value="Busan">부산</option>
				</select>
			</div>
			
			<!-- 채용마감일자 필드-->
			<div class="form-group">
				<label for="date">채용 마감일</label>
				<c:if test="${!empty p.endDate}">
					<input type="date">
				</c:if>
			</div>
			
			<!-- 채용세부내용 입력 필드 -->
			<div class="form-group">
				<label for="cover-letter">채용내용</label>
				<textarea id="cover-letter" name="cover-letter" rows="4" required>
				<c:if test="${!empty p.postContent }">${p.postContent }</c:if></textarea>
			</div>
		      
			<!-- 제출 버튼 -->
			<div class="form-group-footer">
				<button type="submit" id="registration">공고수정</button>
	            <button type="submit" id="application">공고등록</button>
	        </div>
	    </form>
    <!-- 폼 태그 종료 -->
	</div>
</body>
</html>