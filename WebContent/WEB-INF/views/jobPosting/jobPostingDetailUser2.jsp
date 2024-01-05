<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


.content-container{
    display: flex;
    flex-direction: column;
    
}

body {
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    max-width: 1200px;
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
}

header, main, footer {
    margin: 10px;
    padding: 15px;
}

header {
    background-color: #e9ecef;
    text-align: center;
}

h1 {
    color: #333;
}

.job-detail, .application-guide, .application-form {
    background-color: #fff;
    border: 1px solid #ddd;
    margin-bottom: 10px;
    padding: 20px;
}
.job-detail h2{
    width: 85%;
    margin: 0 auto;

    padding-bottom: 10px;
    border-bottom: solid 1px black;
}
.job-detail h3{
    margin: 0 auto;
    width: 80%;
    padding-top: 25px;
}

.application-guide h2{
    width: 85%;
    margin: 0 auto;
    margin-top: 20px;
    margin-bottom: 20px;
}

.application-guide ul {
    list-style: none;
    padding: 0;
}

.application-guide li {
    margin:  0 auto;
    background-color: #e9ecef;
    margin-bottom: 20px;
    padding: 10px;
    height: 37px;
    font-size: 20px;
    width: 80%;
}

.application-guide li:hover{
    background-color: #c3e6cb;
    transition: 0.7s;

}

.cotent-footer {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
}

.cotent-footer button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
}

.cotent-footer button[type="button"] {
    background-color: #f8d7da;
    color: #721c24;
}

.cotent-footer button[type="button"]:hover{
    background-color: #ca8d92 ;
    color: #fff;
}

.cotent-footer button[type="submit"] {
    background-color: #c3e6cb;
    color: #155724;
}
.cotent-footer button[type="submit"]:hover{
    background-color: #8bbb97;
    color: #fff;

}


</style>
</head>

<body>

	<form action="/detail.job" method="get">
    <div class="content-container">
        <header>
            <h1>기업명들어간다 ${p.corpName}</h1>
        </header>
        
        <main>
            <section class="job-detail">
                <h2>${p.postTitle }</h2>
                <h3> ${p.postContent }</h3>
            </section>
            
            <section class="application-guide">
                <h2> * 지원안내</h2>
                <ul>	
                    <li>경력 : ${p.career}</li>
                    <li>직종 : ${p.jobNo}</li>
                    <li>학력 : ${p.education}</li>
                    <li>지역 : ${p.location}</li>
                    <li>마감일 : ${p.endDate}</li>   
                    <li>대표 : ${p.ceoName} (${p.phone}) </li>   

                </ul>
            </section>
            
            <section class="application-form">
                <h2>어떤걸 넣어야 좋을까</h2>
                <form>
                    <!-- 지원서 양식 필드 -->
                    
                </form>
            </section>
        </main>

    </div>
    
    <div class="cotent-footer">
        <button type="button">등록/수정 </button>
        <button type="submit">지원</button>
    </div>
    </form>



</body>




</html>





