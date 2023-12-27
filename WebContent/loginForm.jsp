<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<head>
    <style>
        * {
            margin: 5;
            text-decoration-line: none; /* 밑에 줄 없애기 */
            text-decoration: none; color: black; /* 보라색 흔적 없애기 */
            /* border: solid 1px black; */
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
            border-radius: 20px;
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
            <div class="menu menu-left"><a href = "">기업정보</a></div>
            <div class="menu menu-left"><a href = "">커뮤니티</a></div>
        </div>
        <div class="menu-bar">
            <div class="menu menu-right"><a href = "">로그인</a></div>
            <div class="menu menu-right"><a href = "">회원가입</a></div>
        </div>
    </div>



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "로그인페이지.css">
    <title>로그인페이지</title>
</head>
<body>
    <div class = "bigBox">
        <div class = "loginBox">
            <div class ="login">로그인</div>
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
                </div>
            </div>
            </div>
            </div>
            <div class = "button">
                <input type = "button" value= "로그인">
                <input type = "button" value="회원가입">
            </div>
            </div>

        
        
    </div>
</body>
</html>