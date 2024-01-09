<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.member.model.vo.Member,
			java.util.ArrayList,
			com.kh.common.model.vo.PageInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	Member loginUser=(Member) session.getAttribute("loginUser"); 
	PageInfo pi=(PageInfo)request.getAttribute(" pi"); 
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var=" corp" value="${corp}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>기업상세정보</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
html,
body {
	margin: 0;
	height: 100%;
	min-width: 1200px;
	max-width: 1600px;
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
	padding:12px
}

.corp-aTag div{
	margin: 0 10px;
}

.corp-info-all {
	width: 1000px;
	margin: 0 auto;
	padding: 50px 30px;
	background-color: rgb(236, 240, 243);
}

.corp-zone {
	margin: 50px;
}

.corp-info1 {
	margin-right: 20px;
}

.corp-review-area {
	background-color: rgb(158, 120, 120);
}

.corp-review-content {
	background-color: pink;
	height: 120px;
	margin-top: 20px;
	margin: 20px;
}

/*회사명*/
.corp-name{
	margin: 0 20px;
}

/*홈페이지*/
.corp-home {
	margin: 0 20px;
	width: 120px;
	height: 30px;
	border: 1px solid black;
    background-color: rgba(0, 0, 0, 0.7);
    padding: 0 25px 0 17px;
    border-radius: 41px; 
    height: 41px;
    cursor: pointer;
	
	
	/* 
	display: block;
    overflow: hidden;
    position: relative;
	border-radius: 20px;
    */
}

/*관심 별 버튼*/
.corp-interest button {
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 41px; 
	font-size: 20px;
	
}

.corp-home a{
	text-decoration: none;
    color: #fff;
}

.corp-backwhite {
	background-color: white;
	height: 100px;
	display: flex;
	padding: 10px;
}

.corp-uppost-area {
	flex-direction: column;
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
	<jsp:include page="../common/topbar.jsp" />

	<header>
		<div class="corp-top-area">
			<div class="corp-top">
				<div class="corp-logo">
					<div class="corp-logoImg">
						<img width="120px" height="60px" alt="기업 대표이미지"
							onclick="${contextPath}/detail.corp?corpNo=${corp.corpNo}"
							src="${contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}" />
					</div>
					<div class="corp-name">${corp.corpName}</div>
				</div>
				<div class="corp-interest">
					<div class="corp-star">
						<button id="likeCorp" onclick="isCorpLiked()">★
						<span class="likeCount">${corp.likeCount}</span>
						</button>
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



	<script>
		let currentLikeCount = parseInt($(".likeCount").text());

		const data = {
			corpCode: "${corp.corpNo}",
			userNo: '${ loginUser.userNo }'
		}

		// 페이지로딩됐을때 DB에서 초기데이터 가져옴
		function initAPI() {

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

		// DB에 데이터를 update하기 위한 api(찜 추가/삭제)
		function updateAPI() {
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
					$("#likeCorp").css('color', 'black');
					$("#likeCorp").css('background', 'white');
					currentLikeCount--;
				}
				// 좋아요 등록하는 경우.
				else {
					console.log("등록됨");
					$(".likeCount").text(currentLikeCount + 1);
					$("#likeCorp").css('color', 'red');
					$("#likeCorp").css('background', 'yellow');
					currentLikeCount++;
				}
			}).catch((error) => { console.log(error) });

		}

		// 찜 설정되어 있다면 상태유지하기 initialize
		function initialize() {
			initAPI().then((result) => {

				// 데이터가 존재함 -> 찜이 되어 있따.
				if (result === 'true') {
					$("#likeCorp").css('color', 'red');
					$("#likeCorp").css('background', 'yellow');
				}
				// 데이터가 존재하지 않는다 -> 찜안되어 있음
				else {
					$("#likeCorp").css('color', 'black');
					$("#likeCorp").css('background', 'white');
				}
			})

		}

		initialize();

	</script>



	<div class="corp-info-all">
		<div class="corp-zone">
			<div class="corp_info_a2">|기업정보</div>
			<div class="corp-info-area corp-backwhite">
				<div class="corp-info1">
					<div>기업명</div>
					<div>대표자명</div>
					<div>주소</div>
					<div>홈페이지</div>
				</div>

				<div class="corp-info2">
					<div>${corp.corpName}</div>
					<div>${corp.ceoName}</div>
					<div>${corp.address}</div>
					<div>${corp.homePage}</div>
				</div>
			</div>
		</div>






		<div class="corp-zone">
			<div>|진행중인 채용공고</div>
			<div class="corp-uppost-area corp-backwhite">
				<c:if test="${empty jobPost}">
					<p>진행중인 공고가 없습니다.</p>
				</c:if>
				<div>
					<span>${jobPost.postTitle}</span>
					<span>직종 : ${jobPost.jobName}</span>
				</div>

				<div align="right">
					<button onclick="">공고보기</button>
					<div>공고등록일 : ${jobPost.createDate}</div>
				</div>
			</div>
		</div>
		<br> <br>






		<div class="corp-zone">
			<div>
				<div class="corp_review_a2">|기업리뷰</div>

				<div align="right">
					<button onclick="popup_btn()">리뷰작성하기</button>
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
					<c:if test="${empty reply}">
						<p>작성된 리뷰가 없습니다.</p>
					</c:if>
			
					<input type="hidden" name="userNo" value="${loginUser.userNo}">
					<div class="corp-review-content">
						<c:forEach var="reply" items="${reply}">
							<div>
								<span>작성자:${reply.userId} / 작성일:${reply.createDate}</span>
								<span>${reply.replyContent}</span>
								<!-- 본인 작성글에만 수정/삭제 가능하게끔   -->
								<c:if test="${loginUser.userNo eq reply.replyWriter}">
									<button class="update-review" onclick="change(this,${reply.replyNo})">수정</button>
									<button class="delete-review" value="${reply.replyNo }" >삭제</button>
								</c:if>
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
								<b>[${p}]</b>
							</c:when>
							<c:otherwise>
								<a href="${url}${corp.corpNo}&currentPage=${p}"
									onclick="goToPage(${p})">[${p}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<div class="corp-review-write">
					<input type="hidden" name="corpNo" value="${corp.corpNo}">
					<input type="hidden" name="rno" id="rnoHidden">
					<textarea name="writeBox" id="writeBox1" cols="50" rows="10" readonly
						style="resize: none; ">리뷰를 작성해주세요.</textarea>

					<button id="insert-btn">등록하기</button>
				</div>
			</div>
		</div>
	</div>


	<script>

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

	//리뷰 등록 & 수정
	$("#insert-btn").click(function () {
		let address;
		let list = {
				corpNo : '${corp.corpNo}',
				replyNo : $("#rnoHidden").val(),
				replyContent: $("#writeBox1").val()
			}
		
		if(!list.replyNo){
			address = 'insertReview.corp';
		}else {
			address = 'updateReview.corp';
		}
		
		if (!$("#writeBox1").val()) {
			alert("내용을 입력해주세요");
			$("#writeBox1").focus();
		}
		
		$.ajax({
			type: 'post',
			url: address,
			data: list,
			success: function (response) {
				alert("리뷰 등록했습니다");
				location.reload();
				$("#writeBox1").val("");
			},
			error: function () {
				alert("리뷰 등록 실패했습니다");
			}
		});
	});


	// 작성된 리뷰 textarea로 가져옴
	function change(ele, rno) {
	   		console.log(ele, rno);
	   		$("#rnoHidden").val(rno);
			$("#writeBox1").val($(ele).next().next().text());
			$("#writeBox1").prop('readonly', false);
	}


	// 리뷰 삭제
	$(".delete-review").click(function (e) {
		$.ajax({
			type: 'get',
			url: 'deleteReview.corp',
			data: {replyNo : e.target.value},
			success: function (response) {
				alert("리뷰 삭제했습니다");
				location.reload();
			},
			error: function () {
				alert("리뷰삭제 실패했습니다");
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
		})

	</script>


</body>

</html>