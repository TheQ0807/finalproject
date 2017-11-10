<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="pragma" content="no-store"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
div.container {
	max-height: 1024px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#sel-cat").change(function(){
			var categoryId = $(this).val();
			console.log(categoryId)
			if(categoryId!=0){
				$.getJSON("/rest/divs/"+categoryId).done(function(divs){
					console.log(divs)
					var html="";
					$.each(divs,function(index, div){
						html += "<option value='"+div.id+"'>"+div.name+"</option>";
					})
					if(categoryId != null){
						$("#sel-div option").remove();
					}
					$("#sel-div").append(html);
				})
			}else{
				$("#sel-div option").remove();
				var html="";
				html += "<option value='0'>선택하시오</option>"
				$("#sel-div").append(html);
			}
		})
	})
</script>
<body>
	<nav class="navbar navbar-static-top navbar-default">
				<div class="container">
					<div class="navbar-header ">
						<a class="navbar-brand" href="#"><strong>물류</strong></a>
					</div>
					<ul class="nav navbar-nav">
						<li class=""><a href="#"><strong>홈</strong></a></li>
						<li class="dropdown active"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"><strong>물품 재고 현황</strong><span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">최근 변동 현황</a></li>
								<li><a href="#">증가품목</a></li>
								<li><a href="#">감소품목</a></li>
							</ul></li>
						<li><a href="#"><strong>물품 구입</strong></a></li>
						<li><a href="#"><strong>전자 결재</strong></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="">프로필 수정</a></li>
						<li><a href=""><span class="glyphicon glyphicon-log-out">로그아웃</span></a></li>
					</ul>
				</div>
			</nav>
	<div class="container">
		<div class="row">
			<table class="table table-condenced" id="part-table">
				<thead>
					<tr>
						<th>물품번호</th>
						<th>물품명</th>
						<th>재고수량</th>
						<th>입고가</th>
						<th>출고가</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아직 없음</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row text-right">
			<a href="" data-toggle="modal" data-target="#part-form-modal" class="btn btn-primary btn-sm" id="btn-addpart">새 부품 등록</a>
		</div>
	</div>
	<div class="modal fade" id="part-form-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>부품 등록</h3>
				</div>	
				<form class="form-horizontal">
					<div class="modal-body">
						<div class="row">
							<div class="col-sm-6">
								<div class="row form-group">
									<label>부 품 명 : </label>
									<input type="text" id="part-name"/>
								</div>
								<div class="row form-group">
									<label>부품정보 : </label>
									<input type="text" id="part-info"/>
								</div>
							</div>
							<div class="col-sm-6">
								<p>부품 종류 선택</p>
								<div class="row form-group">
									<select id="sel-cat">
										<option value="0">선택하시오</option>
										<c:forEach var="category" items="${categories }">
											<option value="${category.id }">${category.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<select id="sel-div">
										<option value="0">선택하시오</option>					
									</select>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-sm-6">
									<label>제품이미지 : </label>
									<input type="file" id="part-img">
								</div>
								<div class="col-sm-6">
									<div class="row form-group">
										<label>재  고 	: </label>
										<input type="text" id="part-qty"/>
									</div>
									<div class="row form-group">
										<label>판매가 : </label>
										<input type="text" id="part-qty"/>
									</div>
									<div class="row form-group">
										<label>원  가 	: </label>
										<input type="text" id="part-qty"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>