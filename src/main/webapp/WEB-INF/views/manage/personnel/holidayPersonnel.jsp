<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="pragma" content="no-store"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="Expires" content="-1"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Document</title>
<style>
    div.container {
        max-height: 1024px;
    }
</style>
<script>
   $(function(){
    $("li a").click(function(){
        $("li").removeClass("active");
        $(this).closest("li").addClass("active");
    });
   });
</script>
</head>
<body>
   <div class="container">
    <h3>휴가자 현황</h3>
    <div class="row">
        <div class="col-sm-3 well">
            <ul class="nav nav-pills nav-stacked text-center">
                <li class="active"><a href="#">물류</a></li>
                <li><a href="#">인사</a></li>
                <li><a href="#">운영</a></li>
                <li><a href="#">재무</a></li>
                <li><a href="#">서비스</a></li>
            </ul>
        </div>
        <div class="col-sm-1"></div>
        <div>
            <div class="serchBar col-sm-8 text-center well">
               <p>검색할 이름을 입력하세요</p>
                   <input type="text" class="col-sm-6" /><button class="text-right">직원 이름 검색</button>
            </div>
        </div>
        <div class="col-sm-1"></div>
        <div id="bab" class="col-sm-8 well">
            <table class="table">
                <thead>
                    <tr>
                        <th>부서이름</th>
                        <th>이름</th>
                        <th>전화번호</th>
                        <th>이메일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>김유신</td>
                        <td>kim@gmail.com</td>
                        <td>kim@gmail.com</td>
                    </tr>
                </tbody>
            </table> 
        </div>
    </div>
   </div>
</body>
</html>