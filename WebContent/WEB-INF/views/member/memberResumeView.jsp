<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.main{
display:flex;
}
.sidebar{
width:200px;
}
.outer{
flex-basis:70%;
margin:0 auto;
}
tr td:nth-child(2){
width:500px;
}
td {
padding : 20px;
}
td>input[type=text]{
width:100%;
}
input:focus{
border-width : 0 0 2px;
border-color :green;
outline: none;
}
input{
border-width : 0 0 1px;
border-color:#eee;
padding : 10px;
}
input::value{
color:black;
font-size:14px;}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/topbar.jsp" />
	
	<div class="main">
		<div class="sidebar">
			<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
		</div>
		<div class="outer">
			<br>
			<h1 align="center">이력서</h1>
		
				
				
				${resume.formTitle}
				${resume.formTitle}
				${resume.formTitle}
			
		</div>
	</div>
</body>

</html>