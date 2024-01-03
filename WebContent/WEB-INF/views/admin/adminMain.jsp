<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 메인</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common/adminMain.css">
<body>
<jsp:include page="/WEB-INF/views/common/topbar.jsp"/>
	<div class = "OneBox">
	    
        <div class = "TwoBox">
            <div class ="TopBox">
                <h1 align = "center">신고알림게시판</h1>
            </div>
                신고 알림 내용
            </div>
        
        <div class = "TwoBox">
            <div class ="TopBox">
                기업등록(생성)
            </div>
            <div class ="BottomBox" name = "viewCorporation">
            <input type = "text" name ="keyword" value = "${keyword}">
            <button>검색</button> <br>
                <h1 align ="center">새로운 기업 요청</h1> <br>
                	
            </div>
        </div>
    </div>
</body>


</html>