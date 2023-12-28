<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.bigBox{
    height: 400px;
    width: 100%;
    display: flex;
    justify-content: center;
}

.loginBox{
    height: 400px;
    width: 50%;
    margin-top: 40px;
    background-color: aliceblue;
    border-radius: 20px;
}

.flexBox{
    display: flex;
}

.login{
    text-align: center;
    font-size: 30px;
    margin-top: 7%;
}

.idPass{
    text-align: center;
}

.flexBox1 {
    width: 70%; 
    height: 80px;
    display: flexbox;
    flex-direction: column;
    justify-content: center;    
    align-items: center; 
}

.hapChae{
    display: flex;
}

.id, .pwd{
    flex-basis: 30%;
    text-align: right;
    padding-right: 10%;
}

.ipInput, pwdInput{
    flex-basis: 70%;
}

.naddhapChae{
    margin-top: 50px;
}

.button{
    margin-top: 50px;
    text-align: center;
}

.large-input{
    height: 30px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/topbar.jsp"/>
	<% String contextPath = request.getContextPath(); %>
	<form id = "login-form" action = "<%= contextPath %>/login.me" method="post">
    <div class = "bigBox">
        <div class = "loginBox">
            <div class ="login"><a href = "loginForm.jsp">로그인</a></div>
            <div class ="naddhapChae">
            <div class ="hapChae">
                <div class ="id">
                    아이디
                </div>
                <div class = "idInput">
                    <input type ="text" class ="large-input">
                </div>
            </div>

            <div class ="hapChae">
                <div class ="pwd">
                    비밀번호
                </div>
                <div class = "pwdInput">
                    <input type ="password" class ="large-input">
            <div class = "button">
                <input type = "submit" name = "userId" value= "로그인">
                <input type = "button" name = "userPwd" value="회원가입">
            </div>
                </div>
            </div>
            </div>
            </div>
            </div>
        </form>
        
    </div>
</body>
</html>