<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
    import="java.util.ArrayList, com.kh.corporation.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>이력서 마이페이지</title>
    <style>
        table {
            width: 100%;
            display: inline;
            border-collapse: collapse;
        }
        
        .proposeList section {
        	display: flex;
        	justify-content: space-around;
        	align-items: center;
       	   	margin-top: 30px;
        }
        
        .propose {
        	height: 100px;
       	}
        	
        .proposeList span {
        text-align: center;
        	flex-basis: 30%
        }
        .title{
        border: 5px solid green; /* 지워야함 */
     	font-weight: bold;
     	font-size: 27px;
        height: 60px;
        }
    </style>
</head>
<body>
    <div class="proposeList">
                <section class ="title">
                    <span>이력서제목</span>
                    <span>분류</span>
                    <span>작성자</span>
                </section>
               
                <c:forEach var="c" items="${cormypage}">
                    <section class="propose" onclick = 'location.href = "resumeview.me?bno=${c.workerNo}"'>
                        <span>${c.formTitle}</span>
                        <span>${c.jobName}</span>
                        <span>${c.workerName}</span>
                    </section>
                </c:forEach>
            </tbody>

        <section class="pagingbar">
            <!-- Pagination buttons -->
        </section>
    </div>
</body>
</html>