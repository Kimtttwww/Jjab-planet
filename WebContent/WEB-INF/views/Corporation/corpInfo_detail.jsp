<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.corporation.model.vo.Corporation, 
	com.kh.community.model.vo.Reply,
	com.kh.common.model.vo.PageInfo, 
	java.util.ArrayList"%>

<%
	//Corporation corp = (Corporation) request.getAttribute("corp");
	ArrayList<Reply> list = (ArrayList) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업상세정보</title>
<style>
.corp-top-area {
	background-color: gray;
	width: 1800px;
	height: 90px;
	padding: 0 200px;
}

.corp-top {
	display: flex;
}

.corp-logo {
	display: flex;
	margin: 0 100px;
}

.corp-interest {
	display: flex;
	margin: 0 100px;
}

.corp-aTag {
	display: flex;
	margin: 0 130px;
	margin-top: 30px;
}

.corp-info-all {
	width: 1800px;
	padding: 50px 300px;
	background-color: rgb(206, 206, 223)
}

.corp-zone {
	margin: 50px;
}

.corp-review-area {
	background-color: rgb(158, 120, 120);
	padding: 30px;
}

.corp-review-content {
	background-color: pink;
}

.corp-name, .corp-home {
	margin: 0 20px;
}

.corp-backwhite {
	background-color: white;
}

.corp_hovered {
	color: blue;
	font-weight: bold;
}

#popup_write {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	z-index: 1000;
}

#popup_report {
	display: none;
	position: fixed;
	top: 60%;
	left: 60%;
	transform: translate(-20%, -20%);
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	z-index: 1000;
}
</style>
</head>
<body>

<jsp:include page="../common/topbar.jsp"/>
	<header>
		<div class="corp-top-area">
			<div class="corp-top">
				<div class="corp-logo">
					<div class="corp-name">기업로고</div>
					<div class="corp-name">(주)넥슨코리아</div>
				</div>
				<div class="corp-interest">
					<div class="corp-home">
						<button id="likeCorp" onclick="">★</button>
						<span>찜갯수</span>
					</div>
					<div class="corp-home">
						<a href="">기업홈페이지></a>
					</div>
				</div>
			</div>
			<div class="corp-aTag">
				<div class="corp_info_a1">기업정보</div>
				|
				<div class="corp_review_a1">리뷰</div>
			</div>
		</div>
	</header>


	<div class="corp-info-all">
		<div class="corp-zone">
			<div class="corp_info_a2">|기업정보</div>
			<div class="corp-info-area corp-backwhite">
				<div class="corp-info1">
					<div>기업명</div>
					<div>대표자</div>
					<div>주소</div>
					<div>연락처</div>
				</div>
				<div class="corp-info2">
					<div>넥슨코리아</div>
					<div>이정현</div>
					<div>경기 성남시 분당구</div>
					<div>031-1234-5678</div>
				</div>
			</div>
		</div>


		<div class="corp-zone">
			<div>|진행중인 채용공고</div>
			<div class="corp-uppost-area corp-backwhite">
				<div>
					<div>개발 신입 및 경력 개발자 채용</div>
					<div>프론트엔드</div>
					<div>
						<button onclick="">입사지원</button>
						<div>등록일 : 2023.12.22</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="corp-zone">
			<div>
				<div class="corp_review_a2">|기업리뷰</div>


				<!-- 로그인한 회원만 글작성 버튼이 보이게 조정 -->
				<%-- 		<% if(loginUser != null && loginUser ==  ){ %> --%>
				<div>
					<button
						onclick="open('address','write_review','width=430,height=500,location=no,status=no,scrollbars=yes')">
						리뷰작성하기</button>
				</div>
				<%-- 		<% } %> --%>


			</div>

			<button
				onclick="document.getElementById('popup_write').style.display='block'">팝업
				창 열기</button>

			<!-- 팝업 창 -->
			<div id="popup_write">
				<p>해당 기업의 재직자만 리뷰 작성 가능합니다. 재직자가 맞습니까?</p>

				<button
					onclick="document.getElementById('popup_write').style.display='none'">예</button>
				<button
					onclick="alert('재직자만 작성할 수 있습니다'); document.getElementById('popup_write').style.display='none'">아니오</button>
			</div>



			<div class="corp-review-area">
				<div class="corp-review-content">
					<div>
						<div>작성자명</div>
						<div>작성일</div>
					</div>
					<div>
						<button
							onclick="document.getElementById('popup_report').style.display='block'">신고하기</button>
						<!-- 팝업 창 -->
						<div id="popup_report">
							<p>신고 내용을 작성해주세요</p>
							<textarea rows="10" cols="20" style="resize: none;"></textarea>

							<button
								onclick="document.getElementById('popup_report').style.display='none'">신고</button>
							<button
								onclick="document.getElementById('popup_report').style.display='none'">취소</button>
						</div>
					</div>
					<div>
						<div>리뷰내용~~</div>
						<div>
							<button onclick="">수정</button>
							<button onclick="">삭제</button>
						</div>
					</div>
				</div>
				<div class="corp-review-write">
					<textarea name="" id="" cols="100" rows="10" style="resize: none;">리뷰를 작성하세요..</textarea>
					<button>등록하기</button>
				</div>
			</div>
			
			<!-- 페이징바 -->
			<div align="center" class="paging-area">

			<% if(currentPage != 1) { %>
			<button
				onclick="location.href= 'review.list?currentPage=<%= currentPage -1 %>'">&lt;</button>
			<%} %>

			<% for(int p = startPage; p <= endPage; p++) {%>

			<% if(p != currentPage) { %>
			<button
				onclick="location.href= 'review.list?currentPage=<%= p %>'"><%= p %></button>

			<%} else {%>
			<button disabled><%= p %></button>
			<%} %>
			<%} %>

			<% if(currentPage != maxPage) {%>
			<button
				onclick="location.href= 'review.list?currentPage=<%= currentPage +1%>'">&gt;</button>
			<% } %>
		</div>
<%-- 			${pageContext.request.contextPath} --%>
		</div>
	</div>


	<script>
		// 페이지 위치 이동
		$(function() {

			$(".corp_info_a1").click(function(e) {
				$('html, body').animate({
					scrollTop : $(".corp_info_a2").offset().top
				}, 1000);

			})

			$(".corp_review_a1").click(function(e) {
				$('html, body').animate({
					scrollTop : $(".corp_review_a2").offset().top
				}, 1000);
			});
		});

		// 호버기능
		$(".corp_info_a1").hover(function() {
			$(this).addClass("corp_hovered");
		}, $(".corp_info_a1").hover(function() {
			$(this).removeClass("corp_hovered");
		}));

		$(".corp_review_a1").hover(function() {
			$(this).addClass("corp_hovered");
		}, $(".corp_review_a1").hover(function() {
			$(this).removeClass("corp_hovered");
		}));
		
		
		
		
		
		
		
		
		
	</script>











</body>
</html>