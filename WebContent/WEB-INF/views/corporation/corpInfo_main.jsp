<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import= "java.util.ArrayList, com.kh.corporation.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업정보페이지</title>

<style>
html,
body {
	margin: 0;
	height: 100%;
}

*{
	font-family: 'SOYOMapleBoldTTF';
}

.main {
	max-width: 1000px;
	margin: 0 auto;
}

.content_title {
	text-align: center;
	font-weight: bold;
	font-size: 30px;
    margin: 40px 0 10px 0;
	padding-bottom:30px;
}

.top_banner {
    display: flex;
    margin: 30px auto;
    justify-content: space-between;
    flex-wrap: wrap;
}

.top_b3 {
    flex-basis: 25%;
    cursor: pointer;
    height: 290px;
    margin: 40px;
    border-radius: 20px;
    border: 1px solid skyblue;
    flex-direction: column;
}

 .top_b3 img{ 
    width: 100%;
    height: 100%;
    border-radius: 20px 20px 0 0;
} 
.corp-logo{
    height: 40%;
    display: flex;
    align-items: center;
    justify-content: center;
}
.corp_maincontent{
	position: relative;
	height: 120px;
	padding: 3px 15px 0 16px;
}

.corp_maincontent>:first-child{
	font-size: 30px;
	font-weight: bold;
	color: #656666;
}

.corp_maincontent>:last-child{
	font-size: 15px;
	font-weight: bold;
	color: #656666;
	margin-top:25px;
}

.corp_maincontent::after {
  content: "";
  position: absolute;
  top:0;
  left: 5%; 
  width: 90%; 
  border-top: 1px solid skyblue; 
}

.content_bottom::after {
  content: "";
  position: absolute;
  top: 0;
  left: 5%; 
  width: 90%; 
  border-top: 1px solid skyblue; 
}

.content_bottom {
    position: relative;
    text-align: right;
    margin: 0;
    height: 15%;
    display: flex;
    padding-right: 20px;
    align-items: center;
    justify-content: flex-end;
}

#interest-corp{
	width: 20px;
	height: 20px;
	margin-right: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<div class="main">
		<div class="content_title">
			기업정보
		</div>

		<div class="top_banner">
			<c:forEach var="corp" items="${Corplist}">
			
				<div class="top_b3"
					onclick='location.href="${contextPath}/detail.corp?corpNo=${corp.corpNo}"'>
					<div class="corp-logo">
						<c:choose>
							<c:when test="${empty corp.logo.changeName}">
								<p>등록된 이미지가 없습니다. </p>
							</c:when>
							<c:otherwise>
								<img class="corp-logo-img" 
								src="${contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}">
							</c:otherwise>
						</c:choose>
					</div>	
					<div class="corp_maincontent">
						<p style="font-size: 18px; font-weight: bold;">${corp.corpName}</p>
						<p>${corp.address}</p>
					</div>
					<div class="content_bottom">
						<img id="interest-corp" src="${contextPath}/resources/images/star.png">
							${corp.likeCount}
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>