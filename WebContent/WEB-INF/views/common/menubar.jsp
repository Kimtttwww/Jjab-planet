<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/menubar.css">
        <style>
            a {
                text-decoration-line: none;
                color: black;
                /* border: 1px solid blue; */
            }

            .menu_li {
                list-style: none;
                margin: 0;
                /* border: 1px solid green; */
                width: 100%;
                text-align: center;
                padding: 10px 0;
            }

            ul {
                text-align: center;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
            }
        </style>
    </head>

    <body>
    <div>
        <ul>
            <li class="menu_li">
                <a class="mypage_btn" href="#">알림 관리</a>
            </li>
            <li class="menu_li">
                <a class="mypage_btn" href="#">이력서 관리</a>
            </li>
            <li class="menu_li">
                <a class="mypage_btn" href="#">관심 기업 리스트</a>
            </li>
            <li class="menu_li">
                <a class="mypage_btn" href="#">정보 수정</a>
            </li>
        </ul>
        </div>
    </body>

    </html>