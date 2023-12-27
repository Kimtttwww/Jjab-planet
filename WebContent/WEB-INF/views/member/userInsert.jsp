<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/form/enroll.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>

    <body>
        <!--개인회원 enroll-->
        <div id="container-enroll">
            <form action="" method="">

                <div id="link-enroll">
                    <div class="expand-green radius-left">
                        <a href="개인회원가입.html" class="enroll-a expand-color">개인회원</a>
                    </div>
                    <div class="contract-white radius-right">
                        <a href="기업회원가입.html" class="enroll-a contract-color">기업회원</a>
                    </div>
                </div>

                <div class="enroll-div">
                    <p>* 필수 입력 정보입니다.</p>
                    <div>
                        <div>
                            <div>아이디*</div>
                        </div>
                        <div>
                            <input type="email" id="enroll-email" placeholder="이메일을 입력하세요.">
                            <select name="enroll-selectEmail" class="enroll-selectBox enroll-selectEmail">
                                <option value="" selected>naver.com</option>
                                <option value="">gmail.com</option>
                                <option value="">daum.net</option>
                                <option value="">nate.com</option>
                                <option value="direct">직접입력</option>
                            </select>
                            <input type="text" name="email-direct" class="email-direct" />
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>비밀번호*</div>
                        </div>
                        <div>
                            <input type="password" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">

                        </div>
                    </div>
                    <div>
                        <div>
                            <div>비밀번호 확인*</div>
                        </div>
                        <div>
                            <input type="password" minlength="8" maxlength="16" placeholder="8~16자의 영문, 숫자, 특수기호">
                        </div>
                    </div>
                    <div>
                        <div>
                            <div>핸드폰번호</div>
                        </div>
                        <div>
                            <select name="enroll-phone" id="enroll-phone" class="enroll-selectBox">
                                <option value="">010</option>
                                <option value="">011</option>
                                <option value="">016</option>
                                <option value="">017</option>
                                <option value="">019</option>
                            </select>
                            <input type="text" class="enroll-phoneBox" maxlength="8" placeholder="(-)제외">
                        </div>
                    </div>
                    <div>
                        <div class="enroll-btnBox">
                            <button type="submit" class="enroll-btn">가입하기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script>
            $(function () {
                //직접입력박스 숨김
                $(".email-direct").hide();

                $(".enroll-selectEmail").change(function () {
                    //직접입력 누르면 나타남
                    if ($(".enroll-selectEmail").val() == "direct") {
                        $(".email-direct").show();
                    } else {
                        $(".email-direct").hide();
                    }

                })
            });
        </script>

    </body>

    </html>