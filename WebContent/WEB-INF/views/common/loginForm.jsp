 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
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
    border: 6px solid #27ae60;
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
    background-color: #27ae60;
    color: #fff;
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
    border: 1px solid #27ae60;
    border-radius: 5px;
    margin: -3px;
}

.large-input:focus{
    outline-color: #27ae60;
}

.naddhapChae>span{
	font-size:xx-large;
	margin-left: 125px; 
}


</style>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<%
		String contextPath = request.getContextPath();
	%>
	<form id="login-form" action="<%=contextPath%>/login.me" method="post">
		<div class="bigBox">
				<div class="naddhapChae">
				<span>로그인</span>
					<div class="hapChae">
						<span class="id">아이디:</span>
							<input type="text" name = "userId" class="large-input" placeholder="이메일 주소">
					</div>
					<div class="hapChae">
						<span class="pwd">비밀번호:</span>
							<input type="password" name = "userPwd" class="large-input" placeholder="비밀번호">
						</div>
						<div class="button">
							<input type="submit" class ="inputButton" value="로그인"> 
						</div>
				</div>
			
		</div>
	</form>

</body>
</html>