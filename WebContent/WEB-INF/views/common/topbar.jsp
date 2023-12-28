<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 5;
        text-decoration-line: none; /* 밑에 줄 없애기 */
        text-decoration: none; color: black; /* 보라색 흔적 없애기 */
    }
    .menu-area {
        display: flex;
        flex-direction: row;
        align-items: center;
        width: 100%;
        height: 80px;
        vertical-align: middle;
        font-size: 19px;
        font-weight: bold;
        justify-content: space-between;
        position: sticky;
        background-color: aquamarine;
    }
    
    .menu {
        width: 100px;
        
    }
    .menu-bar {
        display: flex;
        flex-direction: row;
        margin-right: 30px;
    }
    .menu-right {
        display: flex;
        justify-content: center;
    }
    
    .menu a {
        display: inline-block;
        vertical-align: middle;
    }

    .menu a:hover{
        font-size: 20px;
        transition-duration: 0.3s;
    }
    .menuTwo{
        width: 130px;
    }
</style>
</head>
<body>
<div class="menu-area" align="center">
    <div class="menu-bar">
        <div class="menu menu-left menuTWo"><a href = "">JJOBPLANET</a></div>
        <div class="menu menu-left"><a href = "">채용공고</a></div>
        <div class="menu menu-left"><a href = "${pageContext.request.contextPath}/review.insert">기업정보</a></div>
        <div class="menu menu-left"><a href = "">커뮤니티</a></div>
    </div>
    <div class="menu-bar">
        <div class="menu menu-right"><a href = "">로그인</a></div>
        <div class="menu menu-right"><a href = "">회원가입</a></div>
    </div>
</div>

</body>
</html>