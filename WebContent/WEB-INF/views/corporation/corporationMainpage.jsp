<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import= "java.util.ArrayList, com.kh.corporation.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 마이페이지</title>
</head>
<style>
div{
	border: 1px solid black;
}
.oneBox{
	display:flex;
}
.leftBox{
	width: 30%;
}
</style>
<body>
	<div class="main">
		<container>
		<section class="list-area">
			<h3>구직자가 제안한 이력서 리스트</h3>
			<hr>
			<article class="notice">
				<span>어쩌구 저쩌구 알림1</span>
				<button type="button" class="">삭제</button>
			</article>
			<hr>
			<article class="notice">
				<span>어쩌구 저쩌구 알림2</span>
				<button type="button" class="">삭제</button>
			</article>
			<hr>
		</section>

		<section class="pagingbar">
			<button type="button">&lt; 이전</button>
			<button type="button">1</button>
			<button type="button">2</button>
			<button type="button">3</button>
			<button type="button">4</button>
			<button type="button">5</button>
			<button type="button">6</button>
			<button type="button">7</button>
			<button type="button">8</button>
			<button type="button">9</button>
			<button type="button">10</button>
			<button type="button">다음 &gt;</button>
		</section>
		</container>
    <c:forEach var="c" items="${cormypage}">
    	${c.formTitle}
    	${c.jobName}
    	${c.workerName}
    </c:forEach>
	</div>
</body>
</html>
    </tbody>
    </div>
</body>
</html>