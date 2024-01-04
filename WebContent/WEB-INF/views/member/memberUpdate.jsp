<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
body {
    margin: 0;
    padding: 0;
}


.container-update input {
	border: 1px solid #27ae60;
}

.container-update input:focus{
    outline-color: #27ae60;
}

.container-update {
    /*회원가입 박스 전체 틀*/
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
} 

.container-update div { 
    margin-bottom: 8px;
} 
.container-update .update-textL {
    /*입력 정보 길이가 긴 인풋태그*/
    width: 540px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
} 
.container-update .update-phoneBox {
    /*입력 정보 인풋태그 text*/
    width: 470px;
    padding: 10px;
    margin-bottom: 5px;
    border-radius: 5px;
}

.container-update .update-email{
    /*이메일 인풋태그*/
    width: 540px;
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
    border: 1px solid #27ae60;
    outline-color: #27ae60;
}
.container-update .update-div{
    /*입력 정보 감싸는 틀*/
    border: 10px solid #27ae60;
    padding-left: 20px;
    border-radius: 20px;
    width: 580px;
} 
.container-update .update-btn {
    /*가입 버튼*/
    background-color: #27ae60;
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
    background-color: #27ae60; 
    border: none;
    color: #fff;
    width: 50%;
}
.contract-white {
    background-color: #ffff; 
    border: 3px solid #27ae60; 
    color: #27ae60;
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
		<form action="myPage.me" method="post">
			<div>
				<div class="update-div">
					<p class="title-p">회원 정보 수정</p>
					<div>
						<div>아이디</div>
						<div>
							<input type="text" name="userId" class="update-email" disabled>
						</div>
					</div>
					<div>
						<div>핸드폰번호</div>
						<div>
							<select name="pphone" class="update-selectBox">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
                                <option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
							</select> <input type="text" name="phone" class="update-phoneBox" maxlength="8" placeholder="(-)제외">
						</div>
					</div>

					<div id="corporation-enrollForm" class = "flex-container">
						<input type="hidden" name="userType" value="E">
						<div>
							<div>
								<div>기업명</div>
							</div>
							<div>
								<input type="text" name="corpName" class="update-textL" minlength="1" maxlength="15">
							</div>
						</div>
						<div>
							<div>
								<div>대표자명</div>
							</div>
							<div>
								<input type="text" name="ceoName" class="update-textL" minlength="2" maxlength="12">
							</div>
						</div>
						<div>
							<div>
								<div>사업자등록번호</div>
								<!--(XXX-XXXX-XXXX-XX)-->
							</div>
							<div>
								<input type="text" name="corpBn" class="update-textL" minlength="16" maxlength="16" placeholder="(-) 포함">
							</div>
						</div>
						<div>
							<div>
								<div>회사 주소</div>
							</div>
							<div>
								<input type="text" name="address" class="update-textL">
								<input type="text" class="update-textL" placeholder="상세 주소">
							</div>
						</div>
						<div>
							<div>
								<div>회사 홈페이지주소</div>
							</div>
							<div>
								<input type="text" name="homePage" class="update-textL">
							</div>
						</div>
						<div>
							<div>
								<div>회사전화번호</div>
							</div>
							<div>
								<input type="text" name="pphone" class="update-textL" maxlength="17" placeholder="(-) 포함">
							</div>
						</div>
						<div>
							<div>
								<div>회사전화번호</div>
							</div>
							<div>
								<input type="text" name="jobNo" class="update-textL" maxlength="17" placeholder="(-) 직종">
							</div>
						</div>
					</div>
					<div class="update-btnBox">
						<button type="submit" class="update-btn">수정</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>

</html>