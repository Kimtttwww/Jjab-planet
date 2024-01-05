<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
	import= "java.util.ArrayList, com.kh.corporation.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
    border: solid 1px black;
}
.bigBox{
    display: flex;
    height: 900px;
}
.leftBox{
    width: 20%;
}
.rightBox{
    width:100%;
}
.leftBox{
    width: 20%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* Add this line */
    padding-top: 20px;
}
.leftBox ul{
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.leftBox li{
    margin-bottom: 10px;
}
</style>
</head>
<body>
<jsp:include page="../common/topbar.jsp"/>
    <div class = "bigBox">
        <div class = "leftBox">
            <ul>
                <li>지원받은 이력서 리스트</li>
                <li>알림 관리</li>
                <li>공고 관리</li>
                <li>정보 변경</li>
            </ul>
        </div>
        <div class = "rightBox">
            <div class ="outer" align="center">
                <br>
                <h1 align = "left">지원받은 이력서 리스트</h1>
                <br>
            <div id = "search-area">
                    <form action ="search.bo" method = "get">
                    <input type = "hidden" name = "currentPage" value = "1"/>
                    <select name ="condition">
                        <option value = "writer">풀스택</option>
                        <option value = "writer">프론트엔드</option>
                        <option value = "writer">백엔드</option>
                    </select>
                    <input type = "text" name = "keyword" value="${keyword}" placeholder="특수문자를 제외한 키워드를 입력하세요.">
                    <button>검색</button>
                    <table id = "list-area">
                        <thead>
                            <tr>
                                <th>분류</th>
                                <th width ="400">이력서 제목</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var ="b" items ="${list }">
                            <tr onclick = 'location.href="detail.bo?bno=${b.boardNo}"'>
                                <td>${b.boardNo}</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
            </form>
            <div id = "paging-area">
                <c:url value = "${empty condition ? 'list.bo' : 'search.bo'}" var ="url">
                    <c:param name ='condition' value  ='${condition }'/>
                </c:url>
                <c:if test = "${pi.currentPage ne 1}">
                    <a href="${url }&currentPage=${pi.currentPage - 1}">[이전]</a>
                </c:if>
                <c:forEach var = "p" begin = "${pi.startPage }" end = "${pi.endPage }">
                    <a href = "${url }&currentPage=${p}">[${p}]</a>
                </c:forEach>
                <c:if test = "${pi.currentPage ne pi.maxPage }">
                    <a href ="${url }&currentPage=${pi.currentPage + 1}">다음</a>
                </c:if>
            </div>
            <br><br>
                </div>
            </div>
        </div>
    </div>
<script>
    $(function(){
        const condition = '${condition}';
        if(condition){
            $("#search-area option[value = ${condition}]").attr("selected",true);
        }
    })
</script>
</body>
</html>