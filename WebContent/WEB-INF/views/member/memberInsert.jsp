<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/memberInsert.css">
<!-- sha256 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/topbar.jsp" />

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
				<input type="password" name="userPwd" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호(!@#$%^&*_ 사용가능)" required>
			</div>
			<div>
				<div>비밀번호 확인*</div>
				<input type="password" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호(!@#$%^&*_ 사용가능)" required>
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
					<div>파일은 최대 10MB까지 가능합니다</div>
				</div>
			</div>
		</div>
		<div class="enroll-btnBox">
			<button class="enroll-btn">가입하기</button>
		</div>
	</form>
</div>
<script>
	$(() => {
//		초기 상태 기업 숨김
		$("#mem-btn").click()
	});

//	이메일 selectBox 처리
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
	
//	개인회원가입 상태에서 기업 버튼 클릭 시
	$("#co-btn").click(function() {
		$("#mem-btn").removeClass("expand-green").addClass("contract-white");
		$("#co-btn").removeClass("contract-white").addClass("expand-green");
		$("#corporation-enrollForm").show();
		$("#phone").html("회사 전화번호*");
		$("input[type=hidden]").val("C");
		$("#corporation-enrollForm input").each((i, ele) => {
			$(ele).prop("required", true);
		});
	});

//	기업회원가입 상태에서 개인 버튼 클릭 시
	$("#mem-btn").click(function() {
		$("#mem-btn").removeClass("contract-white").addClass("expand-green");
		$("#co-btn").removeClass("expand-green").addClass("contract-white");
		$("#corporation-enrollForm").hide();
		$("#phone").html("핸드폰 번호*");
		$("input[type=hidden]").val("E");
		$("#corporation-enrollForm input").each((i, ele) => {
			$(ele).prop("required", false);
		});
	});
	
//	정규식
	$(".enroll-btn").click(function() {
		let able = true;
		$("input").each(function (i, ele) {
			if (able) {
				let regExp;
				switch (i) {
					case 1:
						regExp = /^[a-zA-Z0-9\_\-]{1,14}$/;
						able = clear(regExp, this, '해당 아이디는 사용할 수 없습니다', i);
						break;
					case 2:
						regExp = /^[a-zA-Z0-9.\_\-]{1,15}$/;
						able = clear(regExp, this, '해당 메일 주소는 사용할 수 없습니다', i);
						break;
					case 3:
						regExp = /^[a-zA-Z0-9!@#$%^&*\_]{8,16}$/;
						able = clear(regExp, this, '올바른 비밀번호가 아닙니다', i);
						break;
					case 4:
						if ($(this).val() != $("input").eq(4).val()) {
							alert('비밀번호가 일치하지 않습니다');
							$(e).val('');
							$(e).focus();
							able = false;
						}
						break;
					case 5:
						regExp = /^[0-9]{6,8}$/;
						able = clear(regExp, this, '해당 연락처는 올바르지 않습니다', i);
						break;
					case 6:
						regExp = /^[a-zA-Z가-힣()\_\-]$/;
						able = clear(regExp, this, '해당 기업명는 사용할 수 없습니다', i);
						break;
					case 7:
						regExp = /^[a-zA-Z가-힣]$/;
						able = clear(regExp, this, '해당 대표자명은 사용할 수 없습니다', i);
						break;
					case 8:
						regExp = /^[0-9()\_\-]$/;
						able = clear(regExp, this, '해당 사업자 등록번호는 사용할 수 없습니다', i);
						break;
					case 9:
						regExp = /^[a-zA-Z가-힣()\_\-]{1,50}$/;
						able = clear(regExp, this, '해당 회사 주소는 사용할 수 없습니다', i);
						break;
					case 10:
						regExp = /^[a-zA-Z가-힣0-9()\_\-:/]{1,100}$/;
						able = clear(regExp, this, '해당 회사 홈페이지 주소는 사용할 수 없습니다', i);
						break;
				}
			} else {	// 반복 강제 종료
				return;
			}
		});
		if (able) { $("input").eq(3).val(sha256($("input").eq(3).val())) }
		return able;
	});
	
	function clear(Exp, e, msg, i) {
		let regExp = new RegExp(Exp);
		if (($("input").eq(0).val() == "C" || i < 6) && !regExp.test($(e).val())) {
			alert(msg);
			$(e).val('');
			$(e).focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</body>

</html>