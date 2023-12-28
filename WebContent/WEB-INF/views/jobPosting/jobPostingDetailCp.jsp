<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="container">
    <h1>채용 공고 (기업)</h1>
    <p class="instructions">* 정확한 정보를 입력해 주세요.</p>
    
    <!-- 폼 태그 시작 -->
    <form action="/submit-registration" method="POST">



      <!-- 채용제목 입력 필드 -->
      <div class="form-group">
        <label for="name">채용제목</label>
        <input type="text" id="name" name="name" required placeholder="공고제목을 입력하세요">
      </div>

      <!-- 대표자명 입력 필드-->
      <div class="form-group">
        <label for="name">대표자명</label>
        <input type="text" id="name" name="name" required placeholder="대표자명을 입력하세요">
      </div>
      
      <!-- 휴대폰 번호 입력 필드 -->
      <div class="form-group">
        <label for="phone">휴대폰</label>
        <input type="tel" id="phone" name="phone" required placeholder="휴대폰 번호를 입력하세요">
      </div>
      
      
      <!-- 학력 필드 value값 고쳐야함-->
      <div class="form-group">
        <label for="position">학력</label>
        <select id="position" name="position">
          <option value="junior">고졸</option>
          <option value="senior">대학재학중</option>
          <option value="senior">대학졸업</option>
          
        </select>
      </div>
      
      <!-- 경력여부 value값 고쳐야함 -->
      <div class="form-group">
        <label for="position">경력여부</label>
        <select id="position" name="position">
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
          <option value="back">백엔드</option>
          <option value="front">프론트엔드</option>
          <option value="full">풀스택</option>
        </select>
      </div>

      <!-- 지역 선택 필드 value값 고쳐야함-->
      <div class="form-group">
        <label for="position">지역</label>
        <select id="position" name="position">
          <option value="seoul">서울</option>
          <option value="gyeonggi">경기도</option>
          <option value="chungcheongS">충청남도</option>
          <option value="chungcheongN">충청북도</option>
          <option value="gangwon">강원도</option>
          <option value="jeollaS">전라남도</option>
          <option value="jeollaN">전라북도</option>
          <option value="gyeongsangS">경상남도</option>
          <option value="gyeongsangN">경상북도</option>
          <option value="jeju">제주도</option>
          <option value="dokdo">독도</option>
        </select>
      </div>

      <!-- 채용마감일자 필드-->
      <div class="form-group">
        <label for="date">채용 마감일</label>
        <input type="date"> 
      </div>
      
      <!-- 채용세부내용 입력 필드 -->
      <div class="form-group">
        <label for="cover-letter">채용내용</label>
        <textarea id="cover-letter" name="cover-letter" rows="4" required></textarea>
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