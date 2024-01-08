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
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="main">
        <table>
            <thead>
                <tr>
                    <th>이력서제목</th>
                    <th>분류</th>
                    <th>작성자</th>
                </tr>
               
            </thead>
            <tbody>
                <c:forEach var="c" items="${cormypage}">
                
                 <tr>
                    <tr onclick = 'location.href = "resumeview.me?bno=${c.workerNo}"'>
                        <td>${c.formTitle}</td>
                        <td>${c.jobName}</td>
                        <td>${c.workerName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <section class="pagingbar">
            <!-- Pagination buttons -->
        </section>
    </div>
</body>
</html>