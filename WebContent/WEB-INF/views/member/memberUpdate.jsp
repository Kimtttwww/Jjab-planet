<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보 변경</title>
<style>
body {
    box-sizing: border-box;
	margin: 0 auto;
	height: 100%;
}

.update-area {
	width: 800px;
    margin: 0 auto;
}

.update-area h3{
	font-weight: bold;
	font-size: 20px;
	margin-top: 20px;
	margin-bottom: 10px;
	padding-bottom:30px;
}

.container-update input {
	border: 1px solid skyblue;
}

.container-update input:focus{
    outline-color: skyblue;
}

.container-update {
    width: 100%;
    display: flex;
    position: relative;
}

.container-update div { 
    margin-bottom: 8px;
} 

.container-update .update-textL {
    /*입력 정보 길이가 긴 인풋태그*/
    width: 500px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
} 

.container-update .update-phoneBox {
    /*입력 정보 인풋태그 text*/
    width: 500px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
}

.container-update .update-email{
    /*이메일 인풋태그*/
    width: 500px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
}

.container-update .email-direct{
    /*직접입력 누르면 나오는 인풋태그*/
    width: 160px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
}

.container-update .update-selectBox {
    /*셀렉트 박스 css*/
    border-radius: 5px;
    padding: 9px;
    border: 1px solid skyblue;
    outline-color: skyblue;
}

.container-update .update-div{
    /*입력 정보 감싸는 틀*/
    border: 4px solid skyblue;
    padding-left: 20px;
    border-radius: 20px;
    width: 580px;
    padding: 30px 20px 30px 35px;
} 

.container-update .update-btn {
    /*가입 버튼*/
    background-color: skyblue;
    color: #fff;
    border: none;
    padding: 15px 30px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
}

.flex-container{
	display: flex;
	flex-direction: column;
}

.update-btnBox{
    margin-bottom: 20px; 
	margin-left: 37%;
}

.container-update .link-enroll {
    /*개인 & 기업 회원가입 이동 틀*/
    border: none; 
    width: 615px;
    height: 100px;
}

.link-enroll{
	display: flex;
}

.enroll-button {
    /*개인 & 기업 회원가입 이동 앵커태그*/
    height: 100%; 
    width: 100%; 
    text-align: center; 
    line-height: 90px; 
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;
}

.expand-green {
    background-color: skyblue; 
    border: none;
    color: #fff;
    width: 50%;
}

.contract-white {
    background-color: #ffff; 
    border: 3px solid skyblue; 
    color: skyblue;
    width: 50%;
}

.radius-left {
    /*왼쪽 모서리 둥글게*/
    border-radius: 20px 0 0 20px;
}

.radius-right {
    /*오른쪽 모서리 둥글게*/
    border-radius: 0 20px 20px 0;
}

.title-p {
    text-align: center; 
    font-size: x-large;
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="container-update">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		
		<div class="update-area">
			<h3>정보 변경 ></h3>
		
		<form action="update.me" method="post">
			<div class="update-div">
				<p class="title-p">회원 정보 수정</p>
				<div>
					<div>아이디</div>
					<div>
						<input type="text" name="userId" class="update-email" value="${ loginUser.userId}" disabled>
					</div>
				</div>
				<div>
					<div>핸드폰번호</div>
					<input type="text" name="phone" class="update-phoneBox" maxlength="11" placeholder="(-)제외" required="required">
				</div>

				<div id="corporation-mypageUpdate" class="flex-container">
					<input type="hidden" name="userType" value="E">
					<div>
						<div>
							<div>기업명</div>
						</div>
						<div>
							<input type="text" name="corpName" class="update-textL" value="${C.corpName }" minlength="1" maxlength="15">
						</div>
					</div>
					<div>
						<div>
							<div>대표자명</div>
						</div>
						<div>
							<input type="text" name="ceoName" class="update-textL" value="${C.ceoName }" minlength="2" maxlength="12">
						</div>
					</div>
					<div>
						<div>
							<div>사업자등록번호</div>
							<!--(XXX-XXXX-XXXX-XX)-->
						</div>
						<div>
							<input type="text" name="corpBn" class="update-textL" value="${C.corpBn }" minlength="16" maxlength="16" placeholder="(-) 포함">
						</div>
					</div>
					<div>
						<div>
							<div>회사 주소</div>
						</div>
						<div>
							<input type="text" name="address" value="${C.address }" class="update-textL">
						</div>
					</div>
					<div>
						<div>
							<div>회사 홈페이지주소</div>
						</div>
						<div>
							<input type="text" name="homePage" value="${C.homePage }" class="update-textL">
						</div>
					</div>
				</div>
				<div class="update-btnBox">
					<button type="submit" class="update-btn">수정</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	
	<script>
// 	const userType = '${loginUser.userType}';
// 	$(() => {
// 		$("#corporation-mypageUpdate").hide();
// 		if(userType === "C"){
// 			$("#corporation-mypageUpdate").show();
// 		}
// 	});

$(document).ready(function () {
    const userType = '${loginUser.userType}';

    console.log("User Type:", userType);

    $("#corporation-mypageUpdate").hide();

    if (userType === "C") {
        $("#corporation-mypageUpdate").show();
    }
});

// $(".update-btn").click(function(){
// 	const newPhoneValue = $('.update-phoneBox').val();
//  	alert('번호 업데이트 완료' + newPhoneValue);	
// 	$(".update-phoneBox").val(newPhoneValue);
// 	e.preventDefault();
// });

	

	</script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>