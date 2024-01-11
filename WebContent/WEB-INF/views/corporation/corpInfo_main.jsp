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

.main {
	max-width: 1000px;
	margin: 0 auto;
}
.content_title {
	font-weight: bold;
	font-size: 20px;
	margin-top: 20px;
	margin-bottom: 10px;
}
.top_banner {
	width: 100%;
	display: flex;
	flex-wrap: wrap;	
}

.top_b3 {
	flex-basis: 20%;
	height: 290px;
	margin: 9px;
	border-radius: 20px;
	justify-content: space-between;
	border: 1px solid skyblue;
}

 .top_b3 img{ 
     width : 230px; 
     height: 120px; 
     border-radius: 20px 20px 0 0;
     margin-bottom: -4px; 
} 
.corp-logo{
	width : 230px; 
    height: 120px; 
}
.corp_maincontent{
	position: relative;
	height: 120px;
	padding: 3px 15px 0 16px;
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
	padding: 10px 15px 15px 0;
	border-radius: 0 0 20px 20px;
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
			기업정보 >
		</div>

		<div class="top_banner">
			<c:forEach var="corp" items="${Corplist}">
			
				<div class="top_b3">
					<div class="corp-logo" align="center">
						<c:choose>
							<c:when test="${empty corp.logo.changeName}">
								<p>등록된 이미지가 없습니다. </p>
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/${Logo.FILE_PATH}${corp.logo.changeName}"
								onclick='location.href="${contextPath}/detail.corp?corpNo=${corp.corpNo}"'>
							</c:otherwise>
						</c:choose>
					</div>	
					<div class="corp_maincontent">
						<p style="font-size: 18px; font-weight: bold;">${corp.corpName}</p>
						<p>${corp.address}</p>
					</div>
					<p class="content_bottom">
						<img id="interest-corp" src="${contextPath}/resources/images/star.png">
							${corp.likeCount}
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>