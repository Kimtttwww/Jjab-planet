 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
</head>
<style>


/* 
* {
	border: 1px solid black;
}	 */

.bigBox {
	height: 400px;
	width: 100%;
	display: flex;
	justify-content: center;
}

.loginBox {
	height: 400px;
	width: 50%;
	margin-top: 40px;
	background-color: aliceblue;
	border-radius: 20px;
}

.flexBox {
	display: flex;
}

.login {
	text-align: center;
	font-size: 30px;
	margin-top: 7%;
}

.hapChae {
	display: flex;
	width: 300px;
	margin-top: 10px;
}

.id, .pwd {
	flex-basis: 30%;
	text-align: center;
	padding-right: 10%;
}

.naddhapChae {
	margin-top: 70px;
	border: 1px solid black;
	background-color: aliceblue;
	border-radius: 20px;
	padding: 30px;
}

.button {
	margin-top: 70px;
	text-align: center;
}

.large-input { 
	height: 30px;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<%
		String contextPath = request.getContextPath();
	%>
	<form id="login-form" action="<%=contextPath%>/login.me" method="post">
		<div class="bigBox">
			<div class="login">
				</div>
				<div class="naddhapChae">
					<div class="hapChae">
						<span class="id">아이디:</span>
							<input type="text" class="large-input">
					</div>
					<div class="hapChae">
						<span class="pwd">비밀번호:</span>
							<input type="password" class="large-input">
						</div>
						<div class="button">
							<input type="submit" name="userId" value="로그인"> 
							<input type="button" name="userPwd" value="회원가입">
						</div>
				</div>
			
		</div>
	</form>

</body>
</html>