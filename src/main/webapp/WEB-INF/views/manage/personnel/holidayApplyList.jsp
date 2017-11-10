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
    $("#sub").on('click', function(){
        $.ajax({
            type:"POST",
            url:"cencle.do",
            data:{reson:"aa" , dept:"aa", empNo:"aaa"},
            dataType:"json",
            complete:function(events){
                $("#myModal").modal("hide");
                $("td").remove();
            }
           
            
        })
    })
    });
</script>
</head>
<body>
   <div class="container">
    <h3>휴가 신청자 현황</h3>
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
                            <th>신청자</th>
                            <th>신청일자</th>
                            <th>신청사유</th>
                            <th>승인/반려</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>김유신</td>
                            <td>1</td>
                            <td>kim@gmail.com</td>
                            <td><button type="submit" class="btn btn-info">승인</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">반려</button>
                            </td>
                        </tr>
                        <tr>
                            <td>강감찬</td>
                            <td>2</td>
                            <td>kang@naver.com</td>
                            <td><button type="submit" class="btn btn-info">승인</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">반려</button>
                            </td>
                        </tr>
                        <tr>
                            <td>홍길동</td>
                            <td>3</td>
                            <td>hong@</td>
                            <td><button type="submit" class="btn btn-info">승인</button>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">반려</button>
                            </td>
                        </tr>
                    </tbody>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title text-center">반려</h4>
                                </div>
                                <div class="modal-body text-center">
                                    <p>반려사유</p>
                                    <textarea cols="70" rows="10" type="text"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button name="cancle" id="cancle" type="text" class="btn btn-danger" data-dismiss="modal">취소</button>
                                    <button name="sub" id="sub" type="text" class="btn btn-info" >확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </table> 
            </div>
    </div>
   </div>
</body>
</html>