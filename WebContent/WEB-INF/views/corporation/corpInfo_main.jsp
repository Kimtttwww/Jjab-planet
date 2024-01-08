<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import= "java.util.ArrayList, com.kh.corporation.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<% 
	Corporation corp = (Corporation)request.getAttribute("corp");
%>
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
	height: 300px;
	margin: 20px;
	border-radius: 20px;
	justify-content: space-between;
	border: 2px solid #27ae60;
}

.top_b3 img{
    width : 250px; 
    height: 120px; 
    border-radius: 20px 20px 0 0;
    margin-bottom: -4px;
}

.corp_maincontent{
	position: relative;
	height: 120px;
	padding: 13px 15px 0 16px;
	background-color: #27ae5f05;
}

.corp_maincontent::after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 5%; 
  width: 90%; 
  border-bottom: 1px solid #27ae60; 
}

.content_bottom {
	text-align: right;
	margin: 0;
	padding: 10px 15px 15px 0;
	border-radius: 0 0 20px 20px;
	background-color: #27ae5f05;
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
				<div class="top_b3" style="background: pinkyellow">
					<c:if test="${ empty corp.logo}">
			    		<p>등록된 이미지가 없습니다.</p>
				    </c:if>
					<div align="center">
						<img onclick='location.href="${pageContext.request.contextPath}/detail.corp?corpNo=${corp.corpNo}"' 
								src="${ pageContext.request.contextPath}/${corp.logo.filePath}${corp.logo.changeName}" alt="기업 대표이미지">
					</div>	
					<div class="corp_maincontent">
						<p>${corp.corpName}</p>
						<p>${corp.address}</p>
					</div>
					<p class="content_bottom">
					<img id="interest-corp" src="${pageContext.request.contextPath}/resources/images/star.png">
						  ${corp.likeCount}
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>