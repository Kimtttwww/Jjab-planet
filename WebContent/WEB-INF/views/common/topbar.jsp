<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
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

            .menu-bar {
                display: flex;
                flex-direction: row;
                margin-right: 30px;
            }

            .menu-right {
                display: flex;
                justify-content: center;
            }

            .menu {
                display: inline-block;
                vertical-align: middle;
                text-decoration-line: none;
                /* 밑에 줄 없애기 */
                text-decoration: none;
                color: black;
                /* 보라색 흔적 없애기 */
                 width: 100px;
            }

            .menu:hover {
                font-size: 20px;
                transition-duration: 0.3s;
            }

            .menuTwo {
                width: 130px;
            }
        </style>
    </head>

    <body>
        <div class="menu-area" align="center">
            <div class="menu-bar">
                <a class="menu menu-left menuTwo"href="">JJOBPLANET</a>
                <a class="menu menu-left"href="">채용공고</a>
                <a class="menu menu-left"
                        href="${pageContext.request.contextPath}/WEB-INF/views/member/corpInsert.jsp">기업정보</a>
               	<a class="menu menu-left" href="list.po">커뮤니티</a>
            </div>
            <div class="menu-bar">
                <a class="menu menu-right" href="${pageContext.request.contextPath}/loginForm.jsp">로그인</a>
                <a class="menu menu-right" href="WEB-INF/views/member/memberInsert.jsp">회원가입</a>
            </div>
        </div>
    </body>

    </html>