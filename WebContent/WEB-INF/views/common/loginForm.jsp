<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<!-- sha256 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
</head>
<style>

.bigBox {
    height: 500px;
    display: flex;
    margin-top: 150px;
    margin-bottom: 300px;
    justify-content: center;
}

.hapChae {
    display: flex;
    width: 350px;
    margin-top: 15px;
    justify-content: center;
    align-content: center;
}

.id, .pwd {
    flex-basis: 30%;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
}

.naddhapChae {
    margin-top: 70px;
    padding: 30px;
    border: 6px solid skyblue;
    border-radius: 20px;
}

.naddhapChae > div:first-of-type {
    margin-top: 60px;
    font-size: 18px;
}

.button {
    margin-top: 60px;
    text-align: center;
}

.inputButton{
    background-color: skyblue;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    width: 350px;
    height: 50px;
}

.large-input {
    width: 230px;
    height: 43px;
    border: 1px solid skyblue;
    border-radius: 5px;
    mar: ;
    /* margin: -3px; */
}

.large-input:focus{
    outline-color: skyblue;
}

.naddhapChae>span{
    font-size: 40px;
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<form id="login-form" action="login.me" method="post">
		<div class="bigBox">
			<div class="naddhapChae">
				<span>로그인</span>
				<div class="loginform-input">
					<div class="hapChae">
						<span class="id">아이디:</span>
						<input type="text" name="userId" class="large-input" placeholder="이메일을 입력해주세요">
					</div>
					<div class="hapChae">
						<span class="pwd">비밀번호:</span>
						<input type="password" name="userPwd" class="large-input" placeholder="비밀번호를 입력해주세요">
					</div>
				</div>
				<div class="button">
					<button type="button" class="inputButton">로그인</button> 
				</div>
			</div>
		</div>
	</form>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script type="text/javascript">
		$(() => {
			$(".large-input").eq(0).focus();
		});
		
// 		enter로 로그인 시도
		$(".large-input").keyup((key) => {
			if(key.keyCode == 13) {
				$("button").click();
			}
		});
		
// 		로그인 시도
		$("button").click(() => {
			let list = {userId: $(".large-input").eq(0).val(), userPwd: sha256($(".large-input").eq(1).val())};
			$.ajax({
				url: 'login.me', type: 'post',
				data: list,
				success: (tf) => {
					if(tf == 'true') {
						location.href = "index.co";
		    		} else {
		    			alert("로그인에 실패했습니다");
		    			
		    			$(".large-input").each(function() {
							$(this).val("");
						});
		    			
		    			$(".large-input").eq(0).focus();
		    		}
				}, error: () => {
					console.log("통신 실패");
				}
			});
		});
	</script>
</body>
</html>