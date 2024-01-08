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
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<!--개인회원 enroll-->
	<div class="container-enroll">
		<form action="sign.bo" method="post" enctype="multipart/form-data">
			<input type="hidden" name="userType" value="E">
			<div class="link-enroll">
				<button type="button" id="mem-btn" class="enroll-button expand-green radius-left">개인회원</button>
				<button type="button" id="co-btn" class="enroll-button contract-white radius-right">기업회원</button>
			</div>

			<div class="enroll-div">
				<p>* 필수 입력 정보입니다.</p>
				<div>
					<div>아이디*</div>
					<input type="text" name="userId" class="enroll-email" placeholder="이메일을 입력하세요."> 
					<span>@</span> 
					<input disabled id="selectText" class="email-selectText" name="email-text" placeholder="이메일을 선택하세요."> 
					<select id="selectId" name="email-selectText" class="enroll-selectBox enroll-selectEmail">
						<option value="" disabled selected>E-Mail 선택</option>
						<option value="naver.com" >naver.com</option>
						<option value="gmail.com" >gmail.com</option>
						<option value="daum.net" >daum.net</option>
						<option value="nate.com" >nate.com</option>
						<option value="directEmail" id="textEmail">직접 입력하기</option>
					</select>
				</div>
				<div>
					<div>비밀번호*</div>
					<input type="password" name="userPwd" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호" required>
				</div>
				<div>
					<div>비밀번호 확인*</div>
					<input type="password" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호" required>
				</div>
				<div>
					<div id="phone">핸드폰 번호*</div>
					<select id="selectPhone" name="pphone" class="enroll-selectBox">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="019">019</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
					</select> 
					<input type="text" name="phone" class="enroll-phoneBox" maxlength="8" placeholder="(-)제외" required>
				</div>

				<div id="corporation-enrollForm" class="flex-container">
					<input type="hidden" name="userType" value="E">
					<div>
						<div>기업명*</div>
						<input type="text" name="corpName" class="enroll-textL" minlength="1" maxlength="15">
					</div>
					<div>
						<div>대표자명*</div>
						<input type="text" name="ceoName" class="enroll-textL" minlength="2" maxlength="12">
					</div>
					<div>
						<div>사업자등록번호*</div>
						<input type="text" name="corpBn" class="enroll-textL" minlength="16" maxlength="16" placeholder="(-) 포함">
					</div>
					<div>
						<div>회사 주소*</div>
						<input type="text" name="address" class="enroll-textL">
					</div>
					<div>
						<div>회사 홈페이지주소*</div>
						<input type="text" name="homePage" class="enroll-textL">
					</div>
					<div>
						<div>회사 대표 로고*</div>
						<input type="file" name="logo" class="enroll-textL">
						<span>	파일은 최대 10MB까지 가능합니다</span>
					</div>
				</div>
				<div class="enroll-btnBox">
					<button type="submit" class="enroll-btn">가입하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$(() => {
			// 초기 상태 기업 숨김
			$("#corporation-enrollForm").hide()

			let msg = ${ alertMsg } + "";
			if (msg) {
				alert(msg);
				<%request.removeAttribute("alertMsg");%>
			}
	    });

        $('#selectId').change(function() {
            if ($('#selectId').val() == 'directEmail') {
                $('#selectText').attr("disabled", false);
                $('#selectText').val("");
                $('#selectText').focus();
            } else {
                $('#selectText').val($('#selectId').val());
                $('#selectText').attr("disabled", true);
            }
        });
		
		// 개인회원가입 상태에서 기업 버튼 클릭 시
		$("#co-btn").click(function() {
			$("#mem-btn").removeClass("expand-green").addClass("contract-white");
			$("#co-btn").removeClass("contract-white").addClass("expand-green");
			$("#corporation-enrollForm").show();
			$("#phone").html("회사 전화번호*");
			$("input[type=hidden]").val("C");
		});

		// 기업회원가입 상태에서 개인 버튼 클릭 시
		$("#mem-btn").click(function() {
			$("#mem-btn").removeClass("contract-white").addClass("expand-green");
			$("#co-btn").removeClass("expand-green").addClass("contract-white");
			$("#corporation-enrollForm").hide();
			$("#phone").html("핸드폰 번호*");
			$("input[type=hidden]").val("E");
		});
	</script>



</body>

</html>