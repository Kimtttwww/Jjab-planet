<%@page import="com.kh.corporation.model.vo.Logo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.member.model.vo.Member,
			java.util.ArrayList,
			com.kh.common.model.vo.PageInfo" %>
<%@ 
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	Member loginUser=(Member) session.getAttribute("loginUser"); 
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="corp" value="${corp}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업상세정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
.corp-info-main{
	width: 1000px;
	margin: 0 auto;
    background-color: #f1f1f1;
    position: sticky;
    top: 0;
    z-index: 2;
}

.corp-main {
    width: 60%;
    margin: 0 auto;
}

.corp-top-area {
    width: 1000px;
    height: 200px;
    margin: 0 auto;
}

/*제일 상단*/
.corp-top {
    display: flex;
    height:153px;
    background-color: #eee;
    justify-content: space-between;
}

.corp-logo {
    display: flex;
    margin: 0 100px;
    align-items: center;
}

.corp-interest {
    display: flex;
    margin: 0 100px 0 0;
    align-items: center;
}

/*기업정보|리뷰*/
.corp-aTag {
    display: flex;
    border: 1px solid #eee;
    background-color: white;
    padding: 12px;
}

/*기업정보 내용*/
.corp-titleFont{
    font-size: x-large;
    padding-bottom:10px;
    font-weight: bold;
}

.corp-star{
    border: 1px solid black;
    border-radius: 50px;
    width: 80px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

/*진행중인 채용공고 입사지원버튼*/
.apply-btn {
    font-size: 15px;
    font-weight: bold;
    background-color: #666060;
    border-radius: 5px;
    color: #fff;
    border: none;
    cursor: pointer;
    width: 100px;
    height: 35px;
}

.corp_info_a1, .corp_review_a1{
    font-size: 18px;
    font-weight: bold;	
}

/*리뷰작성버튼*/
.review-btn{
    background-color: #666060;
    border-radius: 5px;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 4px 6px 5px 6px;
    margin: 2px;
}
.review-btn-box{
    display: flex;
    align-items: center;
}
.corp-aTag div{
    margin: 0 10px;
}

.corp-info-all {
    width: 1000px;
    margin: 0 auto;
    padding: 0 30px;
    background-color: rgb(236, 240, 243);
    position: relative;
}

.corp-zone {
    padding: 50px 50px;
}

.corp-info1 {
    margin-right: 50px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

/*회사명*/
.corp-name{
    margin: 0 20px;
}

/*홈페이지>*/
.corp-home {
    margin: 0 20px;
    width: 120px;
    height: 35px;
    border: none;
    background-color: #666060;
    border-radius: 41px;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
}

/*관심 별 버튼*/
.corp-interest button {
    border: none;
    width: 44px;
    height: 35px;
    border-radius: 40px;
    font-size: 20px;
    cursor: pointer;
    padding: 0 0 5px 0;
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.corp-home a{
    text-decoration: none;
    color: #fff;
}
.corp-info-area{
	height: 200px;
}
.corp-backwhite {
    background-color: white;
    display: flex;
    padding: 30px;
    border: 1px solid #e4e5e7;
    align-items: stretch;
    flex-direction: row;
}

.corp-uppost-area {
    height: 150px;
    justify-content: space-between;
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


/*기업리뷰 박스*/
.corp-review-area {
    background-color: #fff;
    border: 1px solid #eee;
    padding: 20px;
}
.corp-review-form{
    display: flex;
    justify-content: space-between;
    margin-right: 20px;
}

/*기업리뷰 등록버튼*/
#insert-btn{
    background-color: #666060;
    border-radius: 5px;
    color: #fff;
    border: none;
    width: 10%;
    height: 30px;
    cursor: pointer;
    display: none;
    /* padding: 4px 6px 5px 6px; */
    /* margin-top: 30px; */
}

/*기업리뷰 작성란 틀*/
.corp-review-write{
    display: flex;
    margin: 20px;
    justify-content: flex-start;
    align-items: center;
    /* width: 100%; */
}

/*기업 리뷰 작성 박스*/
#writeBox1 {
    resize: none;
    margin: 20px;
    border: 1px solid #eee;
    width: 85%;
    height: 100px;
    font-size: 20px;
}

#writeBox1:focus{
    outline-color: #98ca98;
}

/*기업 리뷰 보여줄 박스*/
.corp-review-content {
    background-color: #fff;
    border: 1px solid #eee;
    min-height: 100px;
    max-height: 2000px;
    margin-top: 20px;
    margin: 20px;
}

/*댓글 페이징 다른페이지*/
#paging-area a{
    background-color: #666060;
    border-radius: 5px;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 1px 3px 3px 3px;
    margin-top: 30px;
    text-decoration: none;
}

/*댓글 페이징 해당페이지*/
#paging-area b{
    background-color: #666060;
    border-radius: 5px;
    color: #98ca98;
    border: none;
    cursor: pointer;
    padding: 1px 3px 3px 3px;
    margin-top: 30px;
}

/* 댓글 수정 삭제 버튼*/
.review-line button {
    background-color: #666060;
    border-radius: 5px;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 1px 3px 2px 3px;
    margin-right: 5px;
}

/*리뷰 한줄 박스*/
.review-line{
    display: flex;
    flex-direction: column;
    margin: 20px;
    position: relative;

}

/*리뷰 쪽 작성자 버튼2개 묶는 박스*/
.review-line .review-info {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/*리뷰 작성자*/
.review-Writer{
	margin-left: 30px;
	padding-bottom:5px;
	border-bottom: 1px solid #eee;
}

/*리뷰 내용*/
.review-detail{
	margin: 10px 30px 40px 30px;
	overflow: auto;
	overflow-wrap: break-word;
}

.corp-post-area{
	display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
.corp-post-area2{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: flex-end;
	
}


.review-detail::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 2%; 
  width: 96%; 
  border-bottom: 1px solid #666060; 
}
    </style>
</head>

<body>
	<jsp:include page="../common/topbar.jsp" />

	<header class="corp-info-main">
		<div class="corp-top-area">
			<div class="corp-top">
				<div class="corp-logo">
					<div class="corp-logoImg">
						<img width="180px" height="80px" alt="기업 대표이미지"
							onclick="${contextPath}/detail.corp?corpNo=${corp.corpNo}"
							src="${contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}" />
					</div>
					<div class="corp-name" style="font-size: 30px; font-weight: bold;" >${corp.corpName}</div>
				</div>
				<div class="corp-interest">
					<div class="corp-star">
						<button id="likeCorp" style="font-size: larger;" onclick="isCorpLiked()">★</button>
						<span class="likeCount">${corp.likeCount}</span>
					</div>
					<div class="corp-home">
						<a href="${corp.homePage}">홈페이지></a>
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

	<div class="corp_info_a2" style="height: 150px; display: none;"></div>

	<div class="corp-info-all">
		<div class="corp-zone">
			<div class="corp-titleFont" >| 기업정보</div>
			<div class="corp-info-area corp-backwhite">
				<div class="corp-info1">
					<div>기업명</div>
					<div>대표자명</div>
					<div>주소</div>
					<div>홈페이지</div>
				</div>

				<div class="corp-info1">
					<div>${corp.corpName}</div>
					<div>${corp.ceoName}</div>
					<div>${corp.address}</div>
					<div>${corp.homePage}</div>
				</div>
			</div>
		</div>

		<div class="corp-zone">
			<div class="corp-titleFont" >| 진행중인 채용공고</div>
			<div class="corp-uppost-area corp-backwhite">
				<c:choose>
					<c:when test="${empty jobPost}">
						<p>진행중인 공고가 없습니다.</p>
					</c:when>
					<c:otherwise>
						<div class="corp-post-area">
							<span>${jobPost.postTitle}</span>
							<span>직종 : ${jobPost.jobName}</span>
						</div>
						<div class="corp-post-area2" >
						<form action="detail.job?corpNo=${corp.corpNo}" method="post">
							<input type="hidden" name="bno" value="${jobPost.jobpostNo}" >
						
							<button class="apply-btn" onclick='location.href="${contextPath}/detail.job?corpNo=${corp.corpNo}"'>공고보기</button>
						</form>
							<div>공고등록일 : ${jobPost.createDate}</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="corp-zone">
			<div class="corp-review-form">
				<div class="corp_review_a2 corp-titleFont">| 기업리뷰</div>

				<div class="review-btn-box" >
					<button class="review-btn" onclick="popup_btn()">리뷰작성하기</button>
				</div>
			</div>

			<!-- 팝업 창 -->
			<div id="popup_write">
				<p>"해당 기업의 재직자만 리뷰 작성 가능합니다. 재직자가 맞습니까?"</p>

				<button id="popup_yes">예</button>
				<button id="popup_no">아니오</button>
			</div>

			<div class="corp-review-area">
				<div align="right">리뷰수 : ${pi.objCount}</div>
				<div>
			
					<input type="hidden" name="userNo" value="${loginUser.userNo}">
					<div class="corp-review-content">
						<c:if test="${empty reply}">
							<p>작성된 리뷰가 없습니다.</p> 
						</c:if>
						<c:forEach var="reply" items="${reply}">
							<div class="review-line">
								<div class="review-info">
									<!-- 본인 작성글에만 수정/삭제 가능하게끔   -->
									<span class="review-Writer">${reply.userId} / ${reply.createDate}</span>
									<div class="review-info-a">
										<c:if test="${loginUser.userNo eq reply.replyWriter}">
											<button class="update-review" onclick="change(this,${reply.replyNo})">수정</button>
											<button class="delete-review" value="${reply.replyNo }" >삭제</button>
										</c:if>
									</div>
								</div>
								<span class="review-detail">${reply.replyContent}</span>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- 기업리뷰 페이징바 -->
				<div align="center" id="paging-area">
					<c:url value="${'detail.corp?corpNo='}" var="url"></c:url>

					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
						<c:choose>
							<c:when test="${p eq pi.currentPage}">
								<b>${p}</b>
							</c:when>
							<c:otherwise>
								<a href="${url}${corp.corpNo}&currentPage=${p}"
									onclick="goToPage(${p})">${p}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<div class="corp-review-write">
					<input type="hidden" name="corpNo" value="${corp.corpNo}">
					<input type="hidden" name="rno" id="rnoHidden">
					<textarea name="writeBox" id="writeBox1" readonly
						style="resize: none; ">리뷰를 작성해주세요.</textarea>
					<button id="insert-btn">등록하기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>


	<script>
	let currentLikeCount = parseInt($(".likeCount").text());

	const data = {
		corpCode: "${corp.corpNo}",
		userNo: '${loginUser.userNo}'
	}

	// 페이지로딩됐을때 DB에서 초기데이터 가져옴
	function initAPI() {
		
		if (${loginUser.userNo} == null) {
		return new Promise((resolve, reject) => {
			$.ajax({
				url: 'init.like.corp',
				type: 'get',
				data: data,
				success: function (result, status, xhr) {
					resolve(result); 
				},
				error: function () {
					reject("요청실패");
				}
			});
		});
		}
	}

	// DB에 데이터를 update하기 위한 api(찜 추가/삭제)
	function updateAPI() {
		if (${loginUser.userNo} == null) {
			alert("로그인 후에 가능합니다");
		}
		return new Promise((resolve, reject) => {
			$.ajax({
				url: 'update.like.corp',
				type: 'get',
				data: data,
				success: function (result, status, xhr) {
					resolve(result); 
				},
				error: function () {
					reject("요청실패"); 
				}
			});
		});
	}

	// db에서 즐겨찾기가 되어 있는 상태 인지 먼저 체크
	// 즐겨찾기가 되어 있으면 삭제하고
	// 안되어 있으면 등록하면 됨.
	function isCorpLiked() {

		updateAPI().then((result) => {
			if (result === 'true') {
				console.log("취소됨");
				$(".likeCount").text(currentLikeCount - 1);
				$(".corp-star").css('color', 'black');
				$(".corp-star").css('background', 'white');
				$("#likeCorp").css('color', 'black');
				$("#likeCorp").css('background', 'white');
				currentLikeCount--;
			}
			// 좋아요 등록하는 경우.
			else {
				console.log("등록됨");
				$(".likeCount").text(currentLikeCount + 1);
				$(".corp-star").css('color', 'red');
				$(".corp-star").css('background', 'yellow');
				$("#likeCorp").css('color', 'red');
				$("#likeCorp").css('background', 'yellow');
				currentLikeCount++;
			}
		}).catch(error => {
			console.log(error);
		});
	}

	// 찜 설정되어 있다면 상태유지하기 initialize
	function initialize() {
		initAPI().then((result) => {
			console.log(result);
			// 데이터가 존재함 -> 찜이 되어 있따.
			if (result === 'true') {
				$(".corp-star").css('color', 'red');
				$(".corp-star").css('background', 'yellow');
			}
			// 데이터가 존재하지 않는다 -> 찜안되어 있음
			else {
				$(".corp-star").css('color', 'black');
				$(".corp-star").css('background', 'white');
			}
		}).catch(error => {
			console.log(error);
		});
		initialize();
	}

		let loginNo = '${loginUser.userNo}' ? '${loginUser.userNo}' : null;
		let userType = loginNo ? '${loginUser.userType}' : null;
		// alert(loginNo);
		// alert(userType);

		//리뷰작성하기 btn 클릭하면 팝업창 나와야함
		//yes -> userType 확인 후 textarea로 pointer
		//no -> 
		function popup_btn() {
			$("#popup_write").css('display', 'block') ;

			$("#popup_yes").click( function () {

			if (loginNo == null) {
				alert("로그인 후 작성가능합니다!");
				
			}else if (userType === 'E'){
				$("#writeBox1").prop('readonly', false);
				alert("리뷰를 작성해주세요!");
				$("#insert-btn").css('display', 'block');
				$("#writeBox1").val("");
				$("#writeBox1").focus();
			}else{
				alert("리뷰 작성 권한이 없어요");
			}
			$("#popup_write").css('display', 'none') ;
		});

			$("#popup_no").click( function () {
				$("#popup_write").css('display', 'none') ;
			});
		}
		
		
		// 리뷰 수정버튼 클릭시 등록하기버튼 활성화
		
		
		// 작성된 리뷰 textarea로 가져옴
		function change(ele, rno) {
				console.log(ele, rno);
				$("#rnoHidden").val(rno);
				$("#writeBox1").val($(ele).parent().parent().next().text());
				$("#writeBox1").prop('readonly', false);
				$("#writeBox1").focus();
				$("#insert-btn").css('display', 'block');
		
		}
		
				
		//리뷰 등록 & 수정
		$("#insert-btn").click(function () {
			let address;
			let list = {
					corpNo : '${corp.corpNo}',
					replyNo : $("#rnoHidden").val(),
					replyContent: $("#writeBox1").val()
				}
				
			if ( $("#review-btn").data("clicked")) {
				$("#insert-btn").css('display', 'block');
				$("#writeBox1").focus();
			}
			

			
			if(!list.replyNo){
				address = 'insertReview.corp';
			}else {
				address = 'updateReview.corp';
			}
				
			$.ajax({
				type: 'post',
				url: address,
				data: list,
				success: function (response) {
					alert("리뷰를 등록했습니다");
					location.reload();
					$("#writeBox1").val("");
				},
				error: function () {
					alert("리뷰 등록에 실패했습니다");
				}
			});
		});



		// 리뷰 삭제
		$(".delete-review").click(function (e) {
			$.ajax({
				type: 'get',
				url: 'deleteReview.corp',
				data: {replyNo : e.target.value},
				success: function (response) {
					alert("리뷰를 삭제했습니다");
					location.reload();
				},
				error: function () {
					alert("리뷰삭제에 실패했습니다");
				}
			})
		})

		
		$(function () {
			// 페이지 위치 이동
			$(".corp_info_a1").click(function (e) {
				$('html, body').animate({
					scrollTop: $(".corp_info_a2").offset().top
				}, 1000);
			})

			$(".corp_review_a1").click(function (e) {
				$('html, body').animate({
					scrollTop: $(".corp_review_a2").offset().top
				}, 1000);
			});

			// 호버기능
			$(".corp_info_a1").hover(function () {
				$(this).addClass("corp_hovered");
			}, $(".corp_info_a1").hover(function () {
				$(this).removeClass("corp_hovered");
			}));

			$(".corp_review_a1").hover(function () {
				$(this).addClass("corp_hovered");
			}, $(".corp_review_a1").hover(function () {
				$(this).removeClass("corp_hovered");
			}));

			
			// 페이징버튼 클릭시 리뷰영역으로 이동
			document.addEventListener('DOMContentLoaded', function () {
				function goToPage(page) {
					location.href = '${url}${corp.corpNo}&currentPage' + page;

					// 스크롤 이동
					var pagingArea = document.getElementsById('paging-area');
					pagingArea.scrollIntoView({ behavior: 'smooth' });
				}
			})
		});
	</script>

</body>

</html>