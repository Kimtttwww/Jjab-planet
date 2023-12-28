<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            .main {
                display: flex;
                width: 80%;
                margin: 0 auto 0 0 ;
                padding-bottom: 137px;

            }

            .side {
                flex-basis: 20%;
                width: 100%;
                height: 1000px;
                border-right : 1px solid green;
                padding:20px 0;
            }

            .content {
                flex-basis: 80%;
                width: 100%;
                height: 100%;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>

    <body>
        <jsp:include page="/WEB-INF/views/common/topbar.jsp" />
        <div class="main">
            <div class="side">
                <jsp:include page="/WEB-INF/views/common/menubar.jsp" />
            </div>
            <div class="content">
                <!--<jsp:include page="/joayo_corp.jsp" />-->
            </div>
        </div>
        <div style="bottom: 0px; position: relative; transform: translateY(-100%);">
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        </div>
    </body>

    </html>