<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.corporation.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>이력서 마이페이지</title>
<style>
.proposeList section {
  	display: flex;
  	justify-content: space-around;
  	align-items: center;
 	margin-top: 40px;
}
  
.propose {
  	height: 100px;
  	cursor: pointer;
  	border: 3px solid black;
    border-color: black;
    border-radius: 30px;
    font-size: larger;
	}
  
.propose:hover {
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.5);
    transition: box-shadow 0.3s ease-in-out;
}
  	
.proposeList span {
  	text-align: center;
  	flex-basis: 30%
}

.propose-title{
    border: 2px solid skyblue;
    border-radius: 10px;
    font-weight: bold;
    font-size: 27px;
    height: 80px;
}
</style>
</head>
<body>
    <div class="proposeList">
	    <section class ="propose-title">
	        <span>이력서제목</span>
	        <span>분류</span>
	        <span>작성자</span>
	    </section>
	   
	    <c:forEach var="c" items="${cormypage}">
	        <section class="propose" 
	        	onclick = 'location.href = "resumeview.me?bno=${c.workerNo}"'>
	            <span>${c.formTitle}</span>
	            <span>${c.jobName}</span>
	            <span>${c.workerName}</span> 
	        </section>
	    </c:forEach>
    </div>
    
    
    <div align="center" id="paging-area">
		<c:url value="${'corMyPage.me?'}" var="url"></c:url>

		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
			<c:choose>
				<c:when test="${p eq pi.currentPage}">
					<b>[${p}]</b>
				</c:when>
				<c:otherwise>
					<a href="${url}currentPage=${p}">[${p}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>