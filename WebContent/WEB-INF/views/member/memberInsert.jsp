<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert</title>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<style>
body {
    margin: 0;
    padding: 0;
}
#container-enroll {
 
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
} 
#container-enroll div { 
    margin-bottom: 8px;
} 
#container-enroll input[type="password"] {
    /*입력 정보 인풋태그 email,password*/
    width: 540px;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #27ae60;
    border-radius: 5px;
} 
.enroll-phoneBox {
    /*입력 정보 인풋태그 text*/
    width: 470px;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #27ae60;
    border-radius: 5px;
}
#enroll-email{
    /*이메일 인풋태그*/
    width: 200px;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #27ae60;
    border-radius: 5px;
}
#email-direct{
    /*직접입력 누르면 나오는 인풋태그*/
    width: 200px;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #27ae60;
    border-radius: 5px;
}

.enroll-selectBox {
    /*셀렉트 박스 css*/
    border-radius: 5px;
    padding: 9px;
    border: 1px solid #27ae60;
    outline-color: #27ae60;
}
.enroll-div {
    /*입력 정보 감싸는 틀*/
    border: 10px solid #27ae60;
    padding-left: 20px;
    border-radius: 20px;
    width: 580px;
} 
.enroll-btn {
    /*가입 버튼*/
    background-color: #27ae60;
    color: #fff;
    border: none;
    padding: 15px 30px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
}
#link-enroll {
    /*개인 & 기업 회원가입 이동 틀*/
    display: flex; 
    border: none; 
    width: 615px;
    height: 100px;
}

.radius-left {
    /*왼쪽 모서리 둥글게*/
    border-radius: 20px 0 0 20px;
}
.radius-right {
    /*오른쪽 모서리 둥글게*/
    border-radius: 0 20px 20px 0;
}

.expand-green {
    /*해당 페이지 확장 효과*/
    background-color: #27ae60; 
    width: 55%;
}
.contract-white {
    /*다른 페이지 축소 효과*/
    background-color: #ffff; 
    border: 3px solid #27ae60; 
    width: 45%;
}

.enroll-a {
    /*개인 & 기업 회원가입 이동 앵커태그*/
    text-decoration: none; 
    display: inline-block; 
    height: 100%; 
    width: 100%; 
    text-align: center; 
    line-height: 90px; 
    font-size: 22px;
    font-weight: bold;
    
}
.expand-color {
    /*해당 페이지 확장 효과(글씨)*/
    color: #fff;
}
.contract-color {
    /*다른 페이지 축소 효과(글씨)*/
    color: #27ae60;
}
.enroll-div>div:last-of-type{
    display: flex;
}
.enroll-btnBox{
    margin-bottom: 20px; 
    margin: 0 auto;
}
input:focus{
    outline-color: #27ae60;
}
</style>

<body>
<jsp:include page="../common/topbar.jsp"/>
    <!--개인회원 enroll-->
    <div class="container-enroll">
        <form action="sign.bo" method="post">

            <div class="link-enroll">
                <div class="expand-green radius-left">
                    <a href="" class="enroll-a expand-color">개인회원</a>
                </div>
                <div class="contract-white radius-right">
                    <a href="corpInsert.jsp" class="enroll-a contract-color">기업회원</a>
                </div>
            </div>

            <div class="enroll-div">
                <p>* 필수 입력 정보입니다.</p>
                <div>
                    <div>
                        <div>아이디*</div>
                    </div>
                    <div>
                        <input type="email" name = "userId" class="enroll-email" placeholder="이메일을 입력하세요.">
                        <select name="enroll-selectEmail" class="enroll-selectBox enroll-selectEmail">
                            <option value="" selected>naver.com</option>
                            <option value="">gmail.com</option>
                            <option value="">daum.net</option>
                            <option value="">nate.com</option>
                            <option value="direct">직접입력</option>
                        </select>
                        <input type="text" name="email-direct" class="email-direct"/>
                    </div>
                </div>
                <div>
                    <div>
                        <div>비밀번호*</div>
                    </div>
                    <div>
                        <input type="password" name = "userPwd" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">
                        
                    </div>
                </div>
                <div>
                    <div>
                        <div>비밀번호 확인*</div>
                    </div>
                    <div>
                        <input type="password" class="enroll-textL" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">
                    </div>
                </div>
                <div>
                    <div>
                        <div>핸드폰번호</div>
                    </div>
                    <div>
                        <select id="phonePrefix" name = "pphone"  class="enroll-selectBox">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="019">019</option>
                        </select>
                        <input type="text" name = "phone" class="enroll-phoneBox" maxlength="8" placeholder="(-)제외">
                    </div>
                </div>
                <div>
                    <div class="enroll-btnBox">
                        <button type="submit" class="enroll-btn">가입하기</button>
                    </div>
                </div>
            </div>
           <input type ="hidden" name = "userType" value = "E"> 
        </form> 
    </div>
<script>
    $(function(){
        //직접입력박스 숨김
        $(".email-direct").hide();

        $(".enroll-selectEmail").change(function(){
            //직접입력 누르면 나타남
            if($(".enroll-selectEmail").val() == "direct"){
                $(".email-direct").show();
            }else{
                $(".email-direct").hide();
            }

        })
    });
    
   
</script>




</body>
</html>