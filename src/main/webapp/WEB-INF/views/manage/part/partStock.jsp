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
img {
	width: 100%;
	max-width: 760px;
	vertical-align: middle
}
#part-form-modal {
	display: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.list-cat').siblings().hide();
		$('.list-cat').on('click', function() {
		    $('.glyphicon', this)
		      .toggleClass('glyphicon-chevron-right')
		      .toggleClass('glyphicon-chevron-down');
		    $(this).parents("li").siblings().removeClass("active");
		    $(this).parents("li").addClass("active");
		    $(this).siblings().toggle("slow");
		    var categoryId = $(this).attr("id");
		    $.getJSON("/rest/parts/"+categoryId).done(function(parts){
				var html="";
				$.each(parts, function(index, part){
					html += "<tr>"
					html += "<td>"+part.no+"</td>"
					html += "<td><a href='' data-toggle='modal' data-target='#part-form-modal' id='part-no-"+part.no+"'>"+part.name+"</a></td>"
					html += "<td>"+part.qty+"</td>"
					html += "<td>"+part.cost+"</td>"
					html += "<td>"+part.price+"</td>"
					html += "</tr>"
				})
				$("#part-table tbody tr").remove();
				$("#part-table tbody").append(html);
			})
		});
		$("a[id^=list-div]").click(function(e){
			e.preventDefault();
			var divisionId = $(this).attr("id").replace("list-div-","");
			var categoryId = $(this).parents("ul[id^=list]").attr("id").replace("list-","");
			$.getJSON("/rest/parts/"+divisionId+"/"+categoryId).done(function(parts){
				var html="";
				$.each(parts, function(index, part){
					html += "<tr>"
					html += "<td>"+part.no+"</td>"
					html += "<td><a href='' data-toggle='modal' data-target='#part-form-modal' id='part-no-"+part.no+"'>"+part.name+"</a></td>"
					html += "<td>"+part.qty+"</td>"
					html += "<td>"+part.cost+"</td>"
					html += "<td>"+part.price+"</td>"
					html += "</tr>"
				})
				$("#part-table tbody tr").remove();
				$("#part-table tbody").append(html);
			})	
		})
		$("#part-table tbody").on("click","a[id^=part-no]",function(){
			var partNo = $(this).attr("id").replace("part-no-","");
			$.getJSON("/rest/part/"+partNo).done(function(part){
				$("#part-no").text(part.no);
				$("#part-name").text(part.name);
				$("#part-info").text(part.info);
				$("#part-qty").text(part.qty);
			})
		})
		$("#btn-modify").click(function(){
			var categoryId = $("select[name=categoryId]").val();
			var divisionId = $("select[name=divisionId]").val();
			var partNo = $("#part-no").text();
			var increasePart = $("#part-increase").val();
			var path = "/rest/modifypart/"+categoryId+"/"+divisionId+"/"+partNo+"/"+increasePart;
			$.ajax({
				type:"PUT",
				url:path,
				dataType:"JSON",
				success:function(parts){
					var html="";
					$.each(parts, function(index, part){
						html += "<tr>"
						html += "<td>"+part.no+"</td>"
						html += "<td><a href='' data-toggle='modal' data-target='#part-form-modal' id='part-no-"+part.no+"'>"+part.name+"</a></td>"
						html += "<td>"+part.qty+"</td>"
						html += "<td>"+part.cost+"</td>"
						html += "<td>"+part.price+"</td>"
						html += "</tr>"
					})
					$("#part-table tbody tr").remove();
					$("#part-table tbody").append(html);
				},
				complete:function(){
					$("#part-form-modal").modal("hide");
				}
			})
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
		<div class="col-sm-3">
			<div class="row">
				<ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="#" class="list-cat" id="0">전체</a></li>
                    <c:forEach var="category" items="${categories}">
						<li>
							<a href="" class="list-cat" data-toggle="collapse" id="${category.id }"><i class="glyphicon glyphicon-chevron-right"></i>${category.name }</a>
							<ul id="list-${category.id }">
							<c:if test="${category.id eq 'CAT-PH'}">
								<c:forEach var="division" items="${phoneDivisions }">
									<li><a href="" id="list-div-${division.id }">${division.name }</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${category.id eq 'CAT-COM'}">
								<c:forEach var="division" items="${computerDivisions }">
									<li><a href="" id="list-div-${division.id }">${division.name }</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${category.id eq 'CAT-AP'}">
								<c:forEach var="division" items="${appliancesDivisions }">
									<li><a href="" id="list-div-${division.id }">${division.name }</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${category.id eq 'CAT-WE'}">
								<c:forEach var="division" items="${wearableDivisions }">
									<li><a href="" id="list-div-${division.id }">${division.name }</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${category.id eq 'CAT-SD'}">
								<c:forEach var="division" items="${soundDiviceDivisions }">
									<li><a href="" id="list-div-${division.id }">${division.name }</a></li>
								</c:forEach>
							</c:if>
							</ul>
						</li>
					</c:forEach>
                </ul>
			</div>
		</div>
		<div class="col-sm-8 col-sm-offset-1">
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
				<c:forEach var="part" items="${parts}">
					<tr>
						<td>${part.no }</td>
						<td><a href="" data-toggle="modal" data-target="#part-form-modal" id="part-no-${part.no }">${part.name }</a></td>
						<td>${part.qty }</td>
						<td>${part.cost }</td>
						<td>${part.price }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	<div class="modal fade" id="part-form-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>물품 상세정보</h3>
				</div>	
				<form class="form-horizontal">
					<div class="modal-body">
						<div class="form-group">
							<label>물품번호 : </label> <label id="part-no"></label>
						</div>
						<div class="form-group">
							<label>제품명 : </label> <label id="part-name"></label>
						</div>
						<div class="form-group">
							<label>제품정보 : </label> <label id="part-info"></label>
						</div>
						<div class="form-group">
							<div class="col-sm-6" style="width: 100px; height: 100px">
								<img alt="" src="/resources/img/a.jpg">
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>재고 현황</label> <label id="part-qty"></label>
								</div>
								<div class="form-group">
									<label>입고 수량</label>
									<input type="text" class="form-control" id="part-increase"/>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-danger btn-sm" id="btn-modify">입고</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>