<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.corporation.model.vo.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관심 기업 리스트</title>
<style>
body {
	box-sizing: border-box;
	margin: 0 auto;
	height: 100%;
}
.list-content{
    display: flex;
    justify-content: space-around;
    height: 60px;
    align-items: center;
}
.joayo-area{
    width: 800px;
    margin: 0 auto;
}
.mypage3_title-box{
    margin-top: 40px;
    font-size: 25px;
}
/*관심기업 star이미지*/
.joayo-star_img {
    width: 30px;
}

/*기업 로고 이미지*/
.joayo-corp_logo{
    width: 80px;
}

.mypage3_content{
	height: 400px;
}


/*페이지네이션 버튼*/
.joayo-page-area{
    text-align: center;
    width: 100%;
    margin-top:50px;
}

</style>
<link rel="stylesheet"
	href="${contextPath}/resources/css/joayo_corp.css"
	type="text/css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<section style="display: flex;">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		
		<div class="joayo-area">
			<div class="mypage3_title-box">
				<p class="joayo-title">관심기업 리스트</p>
			</div>
			<div class="mypage3_content">
					<input type="hidden" name="corpNo" value="${p.corpNo}" />
				<div class="all_list" onclick = "location.href = ">
					<c:if test="${empty list}">
						<p align="center">관심기업이 없습니다.</p>
					</c:if>
					<c:forEach var="p" items="${list}">
					
					<div class="list-content">
						<div style="width: 50% padding-left:20px ;">
							<img class="joayo-corp_logo"
								src="${contextPath}/${ Logo.FILE_PATH }${ p.corp.logo.changeName }">
						</div>
						<div style="width: 40%;" align="center">
							<p style="font-size: 18px;">${p.corpName}</p>
						</div>
						<div style="width: 10%;">
							<img class="joayo-star_img"
							src="${contextPath}/resources/images/star.png">
						</div>
					</div>
					<hr>
					</c:forEach>
				</div>
				<div class="joayo-page-area">
					<button class="page">1</button>
					<button class="page">2</button>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
