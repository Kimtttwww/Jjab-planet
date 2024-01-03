<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/common/memberInsert.css">
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<!--개인회원 enroll-->
	<div class="container-enroll">
		<form action="sign.bo" method="post">
			<div id="member-enrollForm">
				<input type="hidden" name="userType" value="E">
				<div class="link-enroll">
					<button type="button" id="mem-btn"
						class="enroll-button expand-green radius-left">개인회원</button>
					<button type="button" id="co-btn"
						class="enroll-button contract-white radius-right">기업회원</button>
				</div>

				<div class="enroll-div">
					<p>* 필수 입력 정보입니다.</p>
					<div>

						<div>아이디*</div>

						<div>
							<input type="email" name="userId" class="enroll-email"
								placeholder="이메일을 입력하세요."> <select
								name="enroll-selectEmail"
								class="enroll-selectBox enroll-selectEmail">
								<option value="" selected>naver.com</option>
								<option value="">gmail.com</option>
								<option value="">daum.net</option>
								<option value="">nate.com</option>
								<option value="direct">직접입력</option>
							</select> <input type="text" name="email-direct" class="email-direct" />
						</div>
					</div>
					<div>

						<div>비밀번호*</div>

						<div>
							<input type="password" name="userPwd" class="enroll-textL"
								minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">

						</div>
					</div>
					<div>

						<div>비밀번호 확인*</div>

						<div>
							<input type="password" class="enroll-textL" minlength="8"
								maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">
						</div>
					</div>
					<div>

						<div>핸드폰번호</div>

						<div>
							<select name="pphone" class="enroll-selectBox">
								<option value="">010</option>
								<option value="">011</option>
								<option value="">016</option>
								<option value="">017</option>
								<option value="">019</option>
							</select> <input type="text" name="phone" class="enroll-phoneBox"
								maxlength="8" placeholder="(-)제외">
						</div>
					</div>


					<div id="corporation-enrollForm" class = "flex-container">
						<input type="hidden" name="userType" value="E">
						<div>
							<div>
								<div>기업명*</div>
							</div>
							<div>
								<input type="text" name="corpName" class="enroll-textL"
									minlength="1" maxlength="15">
							</div>
						</div>
						<div>
							<div>
								<div>대표자명*</div>
							</div>
							<div>
								<input type="text" name="ceoName" class="enroll-textL"
									minlength="2" maxlength="12">
							</div>
						</div>
						<div>
							<div>
								<div>사업자등록번호*</div>
								<!--(XXX-XXXX-XXXX-XX)-->
							</div>
							<div>
								<input type="text" name="corpBn" class="enroll-textL"
									minlength="16" maxlength="16" placeholder="(-) 포함">
							</div>
						</div>
						<div>
							<div>
								<div>회사 주소*</div>
							</div>
							<div>
								<input type="text" name="address" class="enroll-textL">
								<input type="text" class="enroll-textL" placeholder="상세 주소">
							</div>
						</div>
						<div>
							<div>
								<div>회사 홈페이지주소*</div>
							</div>
							<div>
								<input type="text" name="homePage" class="enroll-textL">
							</div>
						</div>
						<div>
							<div>
								<div>회사전화번호*</div>
							</div>
							<div>
								<input type="text" name="pphone" class="enroll-textL"
									maxlength="17" placeholder="(-) 포함">
							</div>
						</div>
							<div>
							<div>
								<div>회사전화번호*</div>
							</div>
							<div>
								<input type="text" name="jobNo" class="enroll-textL"
									maxlength="17" placeholder="(-) 직종">
							</div>
						</div>
						</div>
						<div class="enroll-btnBox">
							<button type="submit" class="enroll-btn">가입하기</button>
					</div>
				</div>

			</div>

		</form>
	</div>
	<script>

		$(function() {
			//직접입력박스 숨김
			$(".email-direct").hide();

			$(".enroll-selectEmail").change(function() {
				//직접입력 누르면 나타남
				if ($(".enroll-selectEmail").val() == "direct") {
					$(".email-direct").show();
				} else {
					$(".email-direct").hide();
				}

			})
		});

		$(document).ready(function() {
			// 초기 상태 기업 숨김
			$("#corporation-enrollForm").hide()

			let msg = ${ alertMsg } + "";
			if (msg) {
				alert(msg);
				<%request.removeAttribute("alertMsg");%>
			}

			// 개인회원가입 상태에서 기업 버튼 클릭 시
			$("#co-btn").click(function() {
				$("#mem-btn").removeClass("expand-green").addClass("contract-white");
				$("#co-btn").removeClass("contract-white").addClass("expand-green");
				
				$("#corporation-enrollForm").show();
				
				
			});

			// 기업회원가입 상태에서 개인 버튼 클릭 시
			$("#mem-btn").click(function() {
				$("#mem-btn").removeClass("contract-white").addClass("expand-green");
				$("#co-btn").removeClass("expand-green").addClass("contract-white");
				$("#corporation-enrollForm").hide();
				
			});
		});

		$('#mem-btn').click(function() {
			$("input[type=hidden]").val("E");
		});

		$('#co-btn').click(function() {
			$("input[type=hidden]").val("C");
		});
		
		
	
	</script>
	
	

</body>

</html>