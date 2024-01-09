<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu bar</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/menubar.css">
</head>

<body>
		<c:if test= "${loginUser.userType eq 'E'}">
		<ul>
			<li class="menu_li"><a class="mypage_btn" href="notice.me">알림 관리</a></li>
			<li class="menu_li"><a class="mypage_btn" href="resume.me">이력서 관리</a></li>
			<li class="menu_li"><a class="mypage_btn" href="list.co">관심 기업 리스트</a></li>
			<li class="menu_li"><a class="mypage_btn" href="update.me">정보 수정</a></li>
		</ul>
	</c:if>
	
	<c:if test="${loginUser.userType eq 'C'}">
		<ul>
			<li class="menu_li"><a class="mypage_btn" href="notice.me">알림 관리</a></li> <!-- 윤비거 받아야함 -->
			<li class="menu_li"><a class="mypage_btn" href="corMyPage.me">지원받은 이력서</a></li>
			<li class="menu_li"><a class="mypage_btn" href="list.job?corpNo=${loginUser.userNo}">공고 관리</a></li> <!-- 윤비거 받아야함 -->
			<li class="menu_li"><a class="mypage_btn" href="update.me">정보 변경</a></li> <!-- 윤비거 받아야함 -->
		</ul>
	</c:if>
	<script>
		window.onload = function(){
			const msg = "${alertMsg}";
			
			if (msg) alert(msg);
		}
	</script>
</body>
</html>