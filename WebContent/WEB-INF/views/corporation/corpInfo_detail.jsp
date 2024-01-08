<%@page import="com.kh.corporation.model.vo.Logo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.member.model.vo.Member,
			java.util.ArrayList" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<% Member loginUser=(Member)session.getAttribute("loginUser"); %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>기업상세정보</title>
				<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
				<style>
					html,
					body {
						margin: 0;
						height: 100%;
					}

					.corp-main {
						width: 60%;
						margin: 0 auto;
					}

					.corp-top-area {
						background-color: gray;
						width: 1800px;
						height: 100px;
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
						margin: 0 20px;
					}

					.corp-aTag {
						display: flex;
						margin: 0 150px;
						margin-top: 10px;
					}

					.corp-info-all {
						width: 60%;
						margin: 0 auto;
						padding: 50px 300px;
						background-color: rgb(206, 206, 223)
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
						height: 80px;
						margin-top: 20px;
						margin: 20px;

					}

					.corp-name,
					.corp-home {
						margin: 0 20px;
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
					<input type="hidden" name="userNo" value="${loginUser.userNo } ">

					<div class="corp-top-area">
						<div class="corp-top">
							<c:forEach var="corp" items="${corpOne}">
								<div class="corp-logo">
									<div class="corp-logoImg">
										<img width="120px" height="60px" onclick="${ pageContext.request.contextPath}/detail.corp?corpNo=${corp.corpNo}"
											src="${ pageContext.request.contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}"
											alt="기업 대표이미지">
									</div>
									<div class="corp-name">${corp.corpName}</div>
								</div>
								<div class="corp-interest">
									<div class="corp-home">
										<button id="likeCorp" value="${loginUserLiked ? '1' : '-1'}" 
											onclick="isCorpLiked(${corp.corpNo}, this)">★</button>
										<span class="likeCount">${corp.likeCount}</span>
									</div>
									<div class="corp-home">
										<a href="${corp.homePage}">홈페이지></a>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="corp-aTag">
							<div class="corp_info_a1">기업정보</div>
							|
							<div class="corp_review_a1">리뷰</div>
						</div>
					</div>
				</header>



<script defer>
let cNo = 0;
<c:forEach var="corp" items="${corpOne }">
	cNo = ${corp.corpNo}
</c:forEach>

// Ajax 통신 등 추가 작업 수행
$.ajax({
    url: 'like.corp',
    type: 'get',
    data: { 'corpNo': corpNo },
    success: (tf) => {
        if (tf) {
            alert(isLiked ? "관심기업 해제했습니다!" : "관심기업으로 설정했습니다!");
        } else {
            alert("오류가 발생하였습니다");
        }
        location.href = "${pageContext.request.contextPath}/detail.corp?corpNo=" + cNo;
    },
    error: () => {
        console.log("통신 실패");
    }
});
} else {
alert("로그인 후 이용 가능합니다");
}
 
function isCorpLiked(corpNo, likeCorpElement ) {
    if ('${loginUser}') {
        // 클릭 여부 확인
        let isLiked = $("#likeCorp").val() === '1';

        // 버튼 클릭 시 상태 변경
        if ($("#likeCorp").val('-1');
        	$("#likeCorp").css('color', 'black');
        	$("#likeCorp").css('background', 'white');
        } else {
        	$("#likeCorp").val('1');
        	$("#likeCorp").css('color', 'red');
        	$("#likeCorp").css('background', 'yellow');
        }

        // .likeCount 갱신
        let currentLikeCount = parseInt($(".likeCount").text());
        if (isLiked) {
            $(".likeCount").text(currentLikeCount - 1);
        } else {
            $(".likeCount").text(currentLikeCount + 1);
        }


}








// function isCorpLiked(corpNo) {
// 	if ('${loginUser}' && $("#likeCorp").val() == "-1" ) {

// 		$.ajax({
// 			url: 'like.corp', type: 'get',
// 			data: { 'corpNo': corpNo},
// 			success: (tf) => {
// 				if (tf) {
// 					let currentLikeCount = parseInt($(".likeCount").text());
// 					$("#likeCorp").css('color', 'red');
// 					$("#likeCorp").css('background', 'yellow');
//                     $(".likeCount").text(currentLikeCount + 1);
// 					$("#likeCorp").val() = "1";
// 					alert("관심기업으로 설정했습니다!" + $("#likeCorp").val() +$(".likeCount").text());
// 				}
					
// 				location.href = "${pageContext.request.contextPath}/detail.corp?corpNo=" + cNo;
// 			}, error: () => {
// 				console.log("통신 실패");
// 			}
// 		});
// 	} else {
// 		$.ajax({
// 			url: 'like.corp', type: 'get',
// 			data: { 'corpNo': corpNo},
// 			success: (tf) => {
// 				if (tf) {
// 					let currentLikeCount = parseInt($(".likeCount").text());
//                     $(".likeCount").text(currentLikeCount -1);
// 					$("#likeCorp").val() = "-1";
// 					$("#likeCorp").css('color', 'black');
// 					$("#likeCorp").css('background', 'white');
// 					alert("관심기업 해제했습니다!" +$("#likeCorp").text());
// 				} 
// // 				location.href = "${pageContext.request.contextPath}/detail.corp?corpNo=" + cNo;
// 			}, error: () => {
// 				console.log("통신 실패");
// 			}
// 		});
// 	}
	
// }
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
								<c:forEach var="corp" items="${corpOne}">
									<div>${corp.corpName}</div>
									<div>${corp.ceoName}</div>
									<div>${corp.address}</div>
									<div>${corp.homePage}</div>
								</c:forEach>
							</div>
						</div>
					</div>






					<div class="corp-zone">
						<div>|진행중인 채용공고</div>
						<div class="corp-uppost-area corp-backwhite">
							<c:if test="${empty jobPostList}">
								<p>진행중인 공고가 없습니다.</p>
							</c:if>
							<c:forEach var="jobPost" items="${jobPostList}">
								<div>${jobPost.postTitle}</div>
								<div>모집직종 : ${jobPost.jobName }</div>

								<div align="right">
									<button onclick="">입사지원</button>
									<div>공고등록일 : ${jobPost.createDate}</div>
								</div>
							</c:forEach>
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

							<%-- <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %> "> --%>

								<!-- 로그인한 개인회원만 글작성 버튼이 보이게 조정 -->
								<% if(loginUser !=null){ %>
									<div>
										<button
											onclick="${ pageContext.request.contextPath}/write.review?userNo=${loginUser.userNo } , 
													open('address','write_review','width=430,height=500,location=no,status=no,scrollbars=yes')">리뷰작성하기</button>
									</div>
									<% } %>
						</div>

						<button onclick="document.getElementById('popup_write').style.display='block'">팝업창 열기</button>

						<!-- 팝업 창 -->
						<div id="popup_write">
							<p>해당 기업의 재직자만 리뷰 작성 가능합니다. 재직자가 맞습니까?</p>

							<button onclick="document.getElementById('popup_write').style.display='none'">예</button>
							<button
								onclick="alert('재직자만 작성할 수 있습니다'); document.getElementById('popup_write').style.display='none'">아니오</button>
						</div>

						<div class="corp-review-area">
							<div>
								<c:if test="${empty replyList}">
									<p>작성된 리뷰가 없습니다.</p>
								</c:if>

								<c:forEach var="item" items="${replyList}">
									<div class="corp-review-content">
										<div>
											작성자:${loginUser.userId} / 작성일:${item.createDate }
										</div>
										<div class="other-reviews">
											${item.replyContent}


											<!-- 로그인한 유저만 신고버튼 보이게..   -->
											<%-- <% if(loginUser !=null){ %> --%>
												<!-- 								<div align="right"> -->
												<!-- 									<button  -->
												<!-- 										onclick="document.getElementById('popup_report').style.display='block'">신고하기</button> -->
												<!-- 									팝업 창 -->
												<!-- 									<div id="popup_report"> -->
												<!-- 										<p>신고 내용을 작성해주세요</p> -->
												<!-- 										<textarea rows="10" cols="20" style="resize: none;"></textarea> -->


												<%-- <% if(loginUser !=null ){ %> --%>
													<!-- 										<button	onclick="document.getElementById('popup_report').style.display='none'">신고</button> -->
													<!-- 										<button	onclick="document.getElementById('popup_report').style.display='none'">취소</button> -->
													<%-- <% } %> --%>
														<!-- 									</div> -->
														<!-- 								</div> -->
														<%-- <% } %> --%>


															<!-- 본인 작성글에만 수정/삭제 가능하게끔   -->
															<c:if test="${loginUser.userNo eq item.replyWriter}">
																<div align="right">
																	<button onclick="">수정</button>
																	<button onclick="">삭제</button>
																</div>
															</c:if>

										</div>
									</div>
								</c:forEach>
							</div>

							<!-- 기업리뷰 페이징바 -->
							<div align="center" class="paging-area">

								<c:if test="${pi.currentPage ne 1}">
									<a href="${url}&currentPage=${pi.currentPage - 1}">[이전]</a>
								</c:if>

								<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
									<a href="${url}&currentPage=${p}">[${p}]</a>
								</c:forEach>

								<c:if test="${pi.currentPage ne pi.maxPage}">
									<a href="${url}&currentPage=${pi.currentPage + 1}">[다음]</a>
								</c:if>
							</div>


							<!-- 로그인 유저만 작성하게끔   -->
							<% if(loginUser==null){ %>
								<div class="corp-review-write">
									<textarea name="" id="" cols="50" rows="10" style="resize: none;"
										readonly>로그인 후 작성가능합니다.</textarea>
								</div>
								<% } else { %>
									<div class="corp-review-write">
										<textarea name="" id="" cols="50" rows="10"
											style="resize: none;">리뷰를 작성해주세요.</textarea>
										<button>등록하기</button>
									</div>
									<% } %>
						</div>
					</div>
				</div>


				<script>
					// 페이지 위치 이동
					$(function () {

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
				</script>


			</body>

			</html>