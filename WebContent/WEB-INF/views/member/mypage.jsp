<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.main {
	display: flex;
	hight: 100%;
	margin: 0;
}

.side {
	width: 100%;
	height: 100%;
	padding-top: 20px;
	borer-right: 1px solid;
}

.content {
	flex-basis: 80%;
	width: 100%;
	height: 100%;
}
</style>
</head>
<%-- <%
    String pagefile=request.getParameter("page");
    //처음 보여주는 페이지는 newitem입니다.
    if(pagefile==null){
            pagefile="newItem";
        }
%> --%>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	<div class="main">
		<div class="side">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
			
		</div>
		
		
		<div class="content">
		<c:choose>
		<c:when test="${loginUser.userType eq 'E'}">
			<jsp:include page="/WEB-INF/views/member/notice.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="/WEB-INF/views/corporation/corporationMainpage.jsp" />
		</c:otherwise>			
		</c:choose>
		</div>
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
</body>

</html>