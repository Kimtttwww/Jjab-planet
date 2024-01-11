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
    height: 410px;
    width: 100%;
    display: flex;
    justify-content: center;
}

.hapChae {
    display: flex;
    width: 350px;
    margin-top: 15px;
}

.id, .pwd {
    flex-basis: 30%;
    text-align: center;
    padding-right: 10%;
}

.naddhapChae {
    margin-top: 70px;
    border: 1px solid black;
    border-radius: 20px;
    padding: 30px;
    border: 6px solid skyblue;
    border-radius: 20px;
}

.naddhapChae > div:first-of-type {
    margin-top: 35px;
}

.button {
    margin-top: 60px;
    text-align: center;
}

.inputButton{
    background-color: skyblue;
    color: black;
    border: none;
    padding: 15px 30px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 20px;
    width: 100%;
}

.large-input {
	width: 200px;
    height: 30px;
    border: 1px solid skyblue;
    border-radius: 5px;
    margin: -3px;
}

.large-input:focus{
    outline-color: skyblue;
}

.naddhapChae>span{
	font-size:xx-large;
	margin-left: 125px; 
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<form id="login-form" action="login.me" method="post">
		<div class="bigBox">
			<div class="naddhapChae">
				<span>로그인</span>
				<div class="hapChae">
					<span class="id">아이디:</span>
					<input type="text" name="userId" class="large-input" placeholder="이메일 주소">
				</div>
				<div class="hapChae">
					<span class="pwd">비밀번호:</span>
					<input type="password" name="userPwd" class="large-input" placeholder="비밀번호">
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