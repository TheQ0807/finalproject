<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<style>
    #div1,#div2,#div3,#div4{
        
        height: 300px;
        
    }
     #div3,#div4{
        margin-top: -18px;
    }
     #div11{
        
        position: absolute;
        
        margin-top:0.7%;
        width: 40.6%;
        height:63%;
        margin-left: 11%;
        z-index: 100;
        display: none;
    }
    #div22{
        
        position: absolute;
       
        margin-top:0.7%;
        width: 40.6%;
        height:63%;
        margin-left: 11%;
        z-index: 100;
        display: none;
    }
    
    #div11 button{
        margin-top: 75%;
        margin-left: 93%;
    }
    #cancelAndread{
        margin-top: 10%;
        margin-left: 35%;
    }
    #div33{
        
       position: absolute;
       
        margin-top:0.7%;
        width: 40.6%;
        height:63%;
        margin-left: 11%;
        z-index: 100;
        display: none;
    }
    #div33 button{
        margin-top: 26%;
        margin-left: 94%;
    }
    #div44{
        position: absolute;
       
        margin-top:0.7%;
        width: 40.6%;
        height:63%;
        margin-left: 11%;
        z-index: 10;
        display: none;
        background-color: white;
    }
    #div44 button{
        margin-top: -1%;
        margin-left: 94%;
    }
    
    #bookLogo{
        padding-top: 30%;
        padding-left: 10%;
    }
    #absol{
        position: relative;
    }
    #aa{
         position: absolute;
        top:-10px;
        left:17px;
    }
    #tablea{
        position: relative;
    }
    #categoriA{
        position: absolute;
        top:30px;
        left:40px;
    }
    #categoriB{
        position:absolute;
        top:30px;
        left:200px;
        list-style: none;
    }
    #categoriC{
        position:absolute;
        top:30px;
        left:400px;
        list-style: none;
    }
    #categoriD{
        position:absolute;
        top:30px;
        left:600px;
        list-style: none;
    }
    #BB{
        color: blue;
    }
    .pagination{
        margin-top: 20%;
        margin-left: 45%;
    }
    #div10,#div12,#div13{
        z-index: -1;
        display: none;
        float:left;
    }
    
    #searchBtn{
        position: relative;
        top: -20px;
        width: 200%;
        padding-left: 
        
    }
    #startDate{
        margin-left: 10%;
        width: 25%
    }
    #dateForm span{
        padding-left: 2%;
        padding-right: 2%;
    }
    #endDate{
        width:25%
    }
    #table-area { 
        width: 103%; 
        height: 300px; 
        overflow-y: scroll;
        
    }
    #table-area th{
        text-align: center
    }
    #joomoonTable img{
        width: 40%;
        height: 35%;
        padding-right: 5%;
    }
    .td1{
        text-align: center;
     
    }
</style>
<body>
    <div class="container">
        <div class="row rowMan">
            <div id="div1" class="col-md-offset-2 col-md-4 well">
               <p>
                   
               </p>
           </div>
          
           <div id="div2" class="col-md-4 well">
               <p>정보수정</p>
           </div>
           <div class="well" id="div22">
              <h2 style="text-align: center">회원정보 수정</h2>
              <h3 id="singleInfo">아이디정보</h3>
              <div class="row">
                  <form class="form-horizontal" action="/user/userMyPage.do" method="post">
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="email">아이디</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="userId" name="id" value="${user.getId()}" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
                      <div class="col-sm-8">          
                        <input type="password" class="form-control"id="pwd" placeholder="변경할 비밀번호를 입력해주세요." name="pw">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="pwd">비밀번호 확인</label>
                      <div class="col-sm-8">          
                        <input type="password" class="form-control" id="pwdCheck" placeholder="변경할 비밀번호를 다시 입력해주세요." name="pwdCheck">
                      </div>
                    </div>
                    <h3>개인정보</h3>
                    <div class="form-group">
                      <label class="control-label col-sm-2">이름</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="userName" name="userNmae" value="${user.getName() }" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="pwd">휴대폰번호</label>
                      <div class="col-sm-8">          
                        <input type="text" class="form-control" id="phone" placeholder="-없이 입력해주세요" name="phone">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="control-label col-sm-2" for="email">이메일</label>
                      <div class="col-sm-8">          
                        <input type="email" class="form-control" id="email" placeholder="이메일을 작성해주세요" name="email">
                      </div>
                    </div>
                    
                    <div class="form-group" id="cancelAndread">        
                      <div>
                        <button type="button" class="btn btn-md" style="width:20%" id="cancel">취소</button>
                        <button type="submit" class="btn btn-primary btn-md" style="width: 20%">확인</button>
                      </div>
                    </div>
                  </form>
              </div> 
                   
            </div>
           <div id="div3" class="col-md-offset-2 col-md-4 well">
               <p>주문확인</p>
           </div>
            <div class="well" id="div33">
                   <div class="row">
                    <form action="" class="form-inline" id="dateForm">
                           
                            <input type="date" class="form-control" id="startDate" name="startDate" />
                            <span> ~ </span>
                            <input type="date" class="form-control" id="endDate"  name="endDate" />
                   
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" id="searchBtn">조회</button>
                        </div>
                    </form>
                </div>
                  <div class="row" id="table-area">
                    <table class="table table-hover" id="joomoonTable">
                        <colgroup>
                            <col width="20%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>상품명</th>
                                <th>주문 수량</th>
                                <th>가 격</th>
                                <th>주문 날짜</th>
                                <th>주문 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="../images/0.jpg"/>ES이어폰(black)</td>
                                <td class="td1">1</td>
                                <td class="td1">20000</td>
                                <td class="td1">2017.11.09</td>
                                <td class="td1">배송완료</td>
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                  
                   <button>접기</button>
            </div>
           <div id="div4" class="col-md-4 well">
               <h2 style="text-align: center">서비스 이력</h2>   
           </div>
           <div class="well" id="div44">
                  <div class="row">
                      <div class="col-md-offset-1 col-md-4 "><h2>서비스 이력</h2></div>
                      <div class="col-md-offset-4 col-md-3" style="font-style: italic; margin-top: 5%"><h5>마이페이지 -> 서비스이력</h5></div>
                  </div>
                  <div class="row">
                      <div id="serviceUse" class="col-md-12 well">
                          <div class="col-md-2">
                              `<img src="../images/bookLogo.png" id="bookLogo">
                          </div>
                          <div class="col-md-10">
                              <h3>서비스 이용현황</h3>
                              <li>홈페이지에서 예약하신 건에 대해 고객냄의 전화번호 기준으로 이력이 조회됨.</li>
                              <li>전화번호 기준으로 조회되기 때문에 사실과 다른 경우 삭제해 주시기 바랍니다.</li>
                              <li>휴대폰의 S/W, 펌웨어, 업그레이드 등의 간단한 이력은 최근 3개월, 나머지는 최근 2년간 이력만 조회됩니다 헤헷</li>
                          </div>                
                      </div>
                  </div>
                  <div class="row">
                      <div id="absol">
                          <input type="checkbox" id="checkBox"/> 
                          <span id="aa">전체선택/해제</span>           
                      </div>
                  </div>
                  <div class="row" id="tablea">
                     <hr>
                     
                    <c:forEach var="category" items="">
                      <div class="col-md-1">       
                          <input type="checkbox"/>
                      </div>
                      <div class="col-md-3" id="categoriA">
                          <li>제품</li>
                          <li>예약취소일</li>
                      </div>
                      <div class="col-md-3" id="categoriB">
                          <li id="BB">스마트폰</li>
                          <li>2016-10-14</li>
                      </div>
                      <div class="col-md-3" id="categoriC">
                          <li>수리비용</li>
                          <li>수리형태</li>
                      </div>
                      <div class="col-md-3" id="categoriD">
                          <li>0</li>
                          <li>예약 취소</li>
                      </div>
                      </c:forEach>
                  </div>
                  <div class="row">
                        <ul class="pagination">
                          <li><a href="#">1</a></li>
                        </ul>
                  </div>
    
                   <button>접기</button>
            </div>
        </div>
        
            
                   <p id="div10">
                       회원정보수정 입니다.
                   </p>
           
           
                   <p id="div12">
                       주문확인 입니다.
                   </p>
          
          
                   <p id="div13">
                       서비스 이력입니다.
                   </p>
          
    </div>
</body>
<script>
$(function(){
    $("#div2").hover(function(){
        var i = $("#div10").html();
        $("#div1 p").html("<p>"+i+"</p>");
        }, function(){
        $("#div1 p").html("<p></p>");
    })
     $("#div3").hover(function(){
        var i = $("#div12").html();
        $("#div1 p").html("<p>"+i+"</p>");
        }, function(){
        $("#div1 p").html("<p></p>");
    })
     $("#div4").hover(function(){
        var i = $("#div13").html();
        $("#div1 p").html("<p>"+i+"</p>");
        }, function(){
        $("#div1 p").html("<p></p>");
    })
      
    
//    $("#div1").click(function(){
//        $("#div11").show().animate({
//        });
//        $("#div1").animate({
//            opacity: '0.4'
//        })
//        $("#div2").animate({
//            opacity: '0.4'
//        })
//        $("#div3").animate({
//            opacity: '0.4'
//        })
//        $("#div4").animate({
//            opacity: '0.4'
//        })
//    })
//    
//    $("#div11 button").click(function(){
//        $("#div11").animate({
//
//            height:'toggle',
//            width:'toggle'
//        }).hide();
//        $("#div1").animate({
//            opacity: '1'
//        })
//        $("#div2").animate({
//            opacity: '1'
//        })
//        $("#div3").animate({
//            opacity: '1'
//        })
//        $("#div4").animate({
//            opacity: '1'
//        })
//    })
    $("#div2").click(function(){
        $("#div22").show().animate({
        });
        $("#div1").animate({
            opacity: '0.4'
        })
        $("#div2").animate({
            opacity: '0.4'
        })
        $("#div3").animate({
            opacity: '0.4'
        })
        $("#div4").animate({
            opacity: '0.4'
        })
    })
    
    $("#cancel").click(function(){
        $("#div22").animate({

            height:'toggle',
            width:'toggle'
        }).hide();
        $("#div1").animate({
            opacity: '1'
        })
        $("#div2").animate({
            opacity: '1'
        })
        $("#div3").animate({
            opacity: '1'
        })
        $("#div4").animate({
            opacity: '1'
        })
    })
    $("#div3").click(function(){
        $("#div33").show().animate({
        });
        $("#div1").animate({
            opacity: '0.4'
        })
        $("#div2").animate({
            opacity: '0.4'
        })
        $("#div3").animate({
            opacity: '0.4'
        })
        $("#div4").animate({
            opacity: '0.4'
        })
    })
    
    $("#div33 button").click(function(){
        $("#div33").animate({

            height:'toggle',
            width:'toggle'
        }).hide();
        $("#div1").animate({
            opacity: '1'
        })
        $("#div2").animate({
            opacity: '1'
        })
        $("#div3").animate({
            opacity: '1'
        })
        $("#div4").animate({
            opacity: '1'
        })
    })
    
     $("#div4").click(function(){
        $("#div44").show().animate({
        });
        $("#div1").animate({
            opacity: '0.4'
        })
        $("#div2").animate({
            opacity: '0.4'
        })
        $("#div3").animate({
            opacity: '0.4'
        })
        $("#div4").animate({
            opacity: '0.4'
        })
    })
    
    $("#div44 button").click(function(){
        $("#div44").animate({

            height:'toggle',
            width:'toggle'
        }).hide();
        $("#div1").animate({
            opacity: '1'
        })
        $("#div2").animate({
            opacity: '1'
        })
        $("#div3").animate({
            opacity: '1'
        })
        $("#div4").animate({
            opacity: '1'
        })
    })
})
</script>
</html>