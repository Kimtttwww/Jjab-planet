<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/index.css" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </head>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".footer").load("./common/footer.jsp");  // 추가 인클루드를 원할 경우 이런식으로 추가하면 된다
            });
        </script>

    <body>
    <jsp:include page="/WEB-INF/topbar.jsp"/>
        <div class="main">
            <h3 class="content_title"><a href="${pageContext.request.contextPath}/corpInsert.jsp">인기 많은 공고 ></a></h3>
            <div class="top_banner">
                <!--최다 조회수 배너-->
                <div id="top_b1">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 조회수</p>
                    </div>
                </div>
                <div id="top_b2">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 조회수</p>
                    </div>
                </div>
                <div id="top_b3">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 조회수</p>
                    </div>
                </div>
            </div>
            <br>
            <h3 class="content_title"><a href="">최신 공고 ></a></h3>
            <div class="new_banner"><!--최신 공고 배너-->
                <div class="new_b1">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
                <div class="new_b2">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
                <div class="new_b3">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
                <div class="new_b4">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
                <div class="new_b5">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
                <div class="new_b6">
                    <div class="content_top">
                        <img src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg" alt="">
                    </div>
                    <div class="content_middle">
                        <p>넥슨</p>
                        <p>공고제목</p>
                    </div>
                    <div class="content_bottom">
                        <p>직종 / 작성일</p>
                    </div>
                </div>
            </div>

            <h3 class="content_title"><a href="">전체 공고> </a></h3>
            <div class="all_list">
                <ul>
                    <li>기업명</li>
                    <li id="list_title">공고 제목</li>
                    <li>
                        <div class="s_info">
                            <ul>
                                <li>간단정보 1 지역</li>
                                <li>간단정보 2 경력</li>
                                <li>간단정보 3 학력</li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <div class="btn">
                            <a href="#">입사지원</a>
                        </div>
                    </li>
                </ul>
            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        </div>
    </body>

    </html>
