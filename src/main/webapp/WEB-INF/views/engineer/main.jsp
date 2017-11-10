<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../commons/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>login form</title>
  <style>
      body {background-color: white; margin-top: 5%; color: white; background-color: #F4F4F4;}
      .container {padding-left: 30px; width: 1000px; height: 235px; background-color: white; color: black;  font-family: fantasy; }
      input {width: 10%;}
      img {padding-bottom: 20px;}
      #centerbar { padding-left: 60px;}
      p {font-size: 20px; color: black;}
      .col-sm-3 button {font-size: 20px; font-weight: bold;} 
      #button {display: inline-block;}
      button {height: 83px;} 
      #login {padding-left: 42px; padding-bottom: 5px;}
      #alert {text-align: left;}
      #alert, #login {font-weight: bold;}
  </style>
</head>
<body>


    <div class="row">
              <div class="col-sm-12 text-center">
                  <img src="/resources/images/main/image/main log.png">
              </div>
          </div>
    <div class="container well">
          
          <div class="row">
                <div class="col-sm-4">
                    <h3 id="alert"><span class="glyphicon glyphicon-chevron-right"></span> 공지사항</h3>
                </div>
                <div class="col-sm-1">
                    <img id="centerbar" src="/resources/images/main/image/막는바.png">
                </div>
                <div class="col-sm-7">
                    <div class="row">
                        <h3 id="login"><span class="glyphicon glyphicon-chevron-right"></span>직원 로그인</h3>
                    </div>
                     <form class="form-horizontal" method="post" action="emplogin.do">
                    <div class="row">
                        <div class="col-sm-6">
                           
                          <div class="form-group">
                            <label for="exampleInputName2" class="control-label col-sm-4">아이디</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="id" placeholder="Enter email" name="email">
                              </div>
                          </div>

                          <div class="form-group">
                            <label for="exampleInputName2" class="control-label col-sm-4">비밀번호</label>
                            <div class="col-sm-8">
                              <input type="password" class="form-control" id="pwd" placeholder="Enter Pwd" name="pwd">
                              </div>
                          </div>
                              
                            
                        </div>
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-primary btn-block">로그인</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                               <label class="control-label col-sm-4">
                                <input type="checkbox" />아이디 저장
                                </label>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
                <c:if test="${param.error eq 'fail' }">
					<div class="panel-footer">
						<p class="text-danger">아이디 혹은 비밀번호가 일치하지 않습니다.</p>
					</div>
				</c:if>
				<c:if test="${param.error eq 'deny' }">
					<div class="panel-footer">
						<p class="text-danger">로그인이 필요한 서비스 입니다.</p>
					</div>
				</c:if>
          </div>     
    </div>
</body>
</html>