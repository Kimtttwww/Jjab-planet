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
			<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/index.css"
				type="text/css">
			<style>
				html,
				body {
					margin: 0;
					height: 100%;
				}

				.main {
					width: 60%;
					margin: 0 auto;
				}

				.top_banner {
					width: 100%;
					display: flex;
					flex-wrap: wrap;
					
					
					
				}

				.top_b3 {
					flex-basis: 30%;
					height: 300px;
					background-color: rgb(231, 248, 170);
					margin: 20px;
					padding: 20px;
					border-radius: 20px;
					justify-content: space-between;
				}


				.content_bottom {
					text-align: right;
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
							<c:if test="${ empty corp.fileNo}">
					    		<p>등록된 이미지가 없습니다.</p>
						    </c:if>
							<div align="center">
							<img width="250px" height="100px" 
								onclick='location.href="${pageContext.request.contextPath}/detail.corp?corpNo=${corp.corpNo}"'
								src="${ pageContext.request.contextPath}/${corp.fileNo.filePath}${corp.fileNo.changeName}" alt="기업 대표이미지">
							</div>	
							<p>${corp.corpName}</p>
							<p>${corp.address}</p>
							<p class="content_bottom">
								 관심 ${corp.likeCount}
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
				
				









			<jsp:include page="/WEB-INF/views/common/footer.jsp" />










		</body>

		</html>