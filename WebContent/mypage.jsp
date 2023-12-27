<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>

            .main {
                display: flex;
                width: 100%;
                height: 100%;
            }

            .side {
                flex-basis: 40%;
                width: 100%;
                height: 100%;
            }

            .content {
                flex-basis: 60%;
                width: 100%;
                height: 100%;
            }
        </style>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    </head>

    <body>
        <div class="top"></div>
        <div class="main">
            <div class="side">

            </div>
            <div class="content"></div>
        </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </body>

    </html>