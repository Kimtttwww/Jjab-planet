<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/joayo_corp.css">
    <link rel="import" href="./common.footer.jsp">
        <script type="text/javascript">
            $(document).ready(function () {
                $(".footer").load("./common/footer.jsp");  // 추가 인클루드를 원할 경우 이런식으로 추가하면 된다
            });
        </script>
</head>

<body>
    <div class="mypage3">
        <div class="mypage3_title">
            <h3>관심기업 리스트</h3>
        </div>
        <div class="mypage3_content">
            <div class="all_list">
                <ul>
                    <li>번호</li>
                    <li><img class="corp_logo" src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"></li>
                    <li>기업이름</li>
                    <li><img class="star_img" src="${ pageContext.request.contextPath }/resources/images/star.png" alt=""></li>
                </ul>

                <ul>
                    <li>1</li>
                    <li><img class="corp_logo" src="${ pageContext.request.contextPath }/resources/images/kh_logo.jpg"></li>
                    <li>넥슨</li>
                    <li><img class="star_img" src="${ pageContext.request.contextPath }/resources/images/star.png" alt=""></li>
                </ul>
            </div>
            <div class="page-area">
                <div id="page-area">
                    <button class="prev">이전</button>
                    <button class="page">1</button>
                    <button class="page">2</button>
                    <button class="page">3</button>
                    <button class="page">4</button>
                    <button class="page">5</button>
                    <button class="page">다음</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>