<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
div.container {
	max-height: 1024px;
}
</style>
<script type="text/javascript">
	$(function(){
		$.getJSON("/rest/order/loadpage", {pageNo:1,choice:0}).done(function(result){
			var html="";
			if(result.orders.length != 0){
				$.each(result.orders,function(index,order){
					html += "<tr>";
					html += "<td>"+order.no+"</td>";
					html += "<td>"+order.recipient+"</td>";
					html += "<td>"+order.part.name+"</td>";
					html += "<td>"+order.address+"</td>";
					html += "<td>";
					if(order.statusId.id == 'ORDER-WAIT'){
						html += "<span class='label label-warning'>대기</span>";
					}
					if(order.statusId.id == 'ORDER-DELIVARY'){
						html += "<span class='label label-info'>배송중</span>";
					}
					if(order.statusId.id == 'ORDER-COMPLETE'){
						html += "<span class='label label-success'>배송완료</span>";
					}
					if(order.statusId.id == 'ORDER-CANCEL'){
						html += "<span class='label label-danger'>주문취소</span>";
					}
					html += "</td>";
					html += "<td>";
					if(order.statusId.id == 'ORDER-WAIT'){
						html += "<a class='btn btn-info btn-xs' id='deli-order-"+order.no+"' >배송 중</a>";
						html += "<input type='hidden' id='deli-status' value='ORDER-DELIVARY'>"
						html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
					}
					if(order.statusId.id == 'ORDER-DELIVARY'){
						html += "<a class='btn btn-success btn-xs' id='deli-order-"+order.no+"' >배송 완료</a>";
						html += "<input type='hidden' id='deli-status' value='ORDER-COMPLETE'>"
						html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
					}
					html += "</td>";
					html += "</tr>";
				})
			}else{
				html += "<td>현재 주문내역이 존재하지않습니다</td>";
			}
			$("#deli-table tbody").html(html);
			
			var html2='';
			var navi = result.navi;
			if(result.orders.length!=0){
				html2 += '<li><a href="1">&laquo;</a>';
				if (navi.pageNo >= 2) {
					html2 += '<li><a href="'+(navi.pageNo-1)+'">&lt;</a>';
				} else {
					html2 += '<li class="disabled"><span>&lt;</span></li>';
				}
				for(var i=navi.beginPage; i <=navi.endPage;i++){
					html2 += '<li class="'+((navi.pageNo == i) ? "active" : "")+'"><a href='+i+'>'+i+'</a></li>';
				}
				if (navi.pageNo <navi.totalPages) {
					html2 += '<li><a href="'+(navi.pageNo+1)+'">&gt;</a>';
				} else {
					html2 += '<li class="disabled"><span>&gt;</span></li>';
				}
				html2 += '<li><a href="'+navi.totalPages+'">&raquo;</a>';
			};
			$("#navi-pagination").html(html2);
		})
		$('.pagination').on("click","a",function(event){
		event.preventDefault();	
		var pageNo = $(this).attr("href");
		var orderStatusId = $("#ul-cat li[class=active] a").attr("id").replace("li-cat-","")
		var choice = 0;
		if(orderStatusId != 'all'){
			choice = 1;
		}
		$.getJSON("/rest/order/loadpage", {pageNo:pageNo,orderStatusId:orderStatusId,choice:choice}).done(function(result){
			var html="";
			if(result.orders.length != 0){
				$.each(result.orders,function(index,order){
					html += "<tr>";
					html += "<td>"+order.no+"</td>";
					html += "<td>"+order.recipient+"</td>";
					html += "<td>"+order.part.name+"</td>";
					html += "<td>"+order.address+"</td>";
					html += "<td>";
					if(order.statusId.id == 'ORDER-WAIT'){
						html += "<span class='label label-warning'>대기</span>";
					}
					if(order.statusId.id == 'ORDER-DELIVARY'){
						html += "<span class='label label-info'>배송중</span>";
					}
					if(order.statusId.id == 'ORDER-COMPLETE'){
						html += "<span class='label label-success'>배송완료</span>";
					}
					if(order.statusId.id == 'ORDER-CANCEL'){
						html += "<span class='label label-danger'>주문취소</span>";
					}
					html += "</td>";
					html += "<td>";
					if(order.statusId.id == 'ORDER-WAIT'){
						html += "<a class='btn btn-info btn-xs' id='deli-order-"+order.no+"' >배송 중</a>";
						html += "<input type='hidden' id='deli-status' value='ORDER-DELIVARY'>"
						html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
					}
					if(order.statusId.id == 'ORDER-DELIVARY'){
						html += "<a class='btn btn-success btn-xs' id='deli-order-"+order.no+"' >배송 완료</a>";
						html += "<input type='hidden' id='deli-status' value='ORDER-COMPLETE'>"
						html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
					}
					html += "</td>";
					html += "</tr>";
				})
			}else{
				html += "<td>현재 주문내역이 존재하지않습니다</td>";
			}
			$("#deli-table tbody").html(html);
			
			var html2='';
			var navi = result.navi;
			if(result.orders.length!=0){
				html2 += '<li><a href="1">&laquo;</a>';
				if (navi.pageNo >= 2) {
					html2 += '<li><a href="'+(navi.pageNo-1)+'">&lt;</a>';
				} else {
					html2 += '<li class="disabled"><span>&lt;</span></li>';
				}
				for(var i=navi.beginPage; i <=navi.endPage;i++){
					html2 += '<li class="'+((navi.pageNo == i) ? "active" : "")+'"><a href='+i+'>'+i+'</a></li>';
				}
				if (navi.pageNo <navi.totalPages) {
					html2 += '<li><a href="'+(navi.pageNo+1)+'">&gt;</a>';
				} else {
					html2 += '<li class="disabled"><span>&gt;</span></li>';
				}
				html2 += '<li><a href="'+navi.totalPages+'">&raquo;</a>';
			};
			$("#navi-pagination").html(html2);
		})
	});
		$("a[id^=cancel-order]").click(function(){
			var orderNo = $(this).attr("id").replace("cancel-order-","")
			$("#cancel-orderNo").val(orderNo);
			$("#cancel-modal").modal("show");
			$("#btn-cancel-nope").click(function() {
				$("#cancel-modal").modal("hide");
			})
		})
		$("#deli-table tbody").on("click","a[id^=deli-order]",function(){
			var orderNo = $(this).attr("id").replace("deli-order-","")
			var orderStatusId = $("#deli-status").val()
			$.getJSON("/rest/order/changeDelistatus", {orderNo:orderNo, orderStatusId:orderStatusId, choice:0, pageNo:1}).done(function(result){
				var html="";
				if(result.orders.length != 0){
					$.each(result.orders,function(index,order){
						html += "<tr>";
						html += "<td>"+order.no+"</td>";
						html += "<td>"+order.recipient+"</td>";
						html += "<td>"+order.part.name+"</td>";
						html += "<td>"+order.address+"</td>";
						html += "<td>";
						if(order.statusId.id == 'ORDER-WAIT'){
							html += "<span class='label label-warning'>대기</span>";
						}
						if(order.statusId.id == 'ORDER-DELIVARY'){
							html += "<span class='label label-info'>배송중</span>";
						}
						if(order.statusId.id == 'ORDER-COMPLETE'){
							html += "<span class='label label-success'>배송완료</span>";
						}
						if(order.statusId.id == 'ORDER-CANCEL'){
							html += "<span class='label label-danger'>주문취소</span>";
						}
						html += "</td>";
						html += "<td>";
						if(order.statusId.id == 'ORDER-WAIT'){
							html += "<a class='btn btn-info btn-xs' id='deli-order-"+order.no+"' >배송 중</a>";
							html += "<input type='hidden' id='deli-status' value='ORDER-DELIVARY'>"
							html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
						}
						if(order.statusId.id == 'ORDER-DELIVARY'){
							html += "<a class='btn btn-success btn-xs' id='deli-order-"+order.no+"' >배송 완료</a>";
							html += "<input type='hidden' id='deli-status' value='ORDER-COMPLETE'>"
							html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
						}
						html += "</td>";
						html += "</tr>";
					})
				}else{
					html += "<td>현재 주문내역이 존재하지않습니다</td>";
				}
				$("#deli-table tbody").html(html);
				
				var html2='';
				var navi = result.navi;
				if(result.orders.length!=0){
					html2 += '<li><a href="1">&laquo;</a>';
					if (navi.pageNo >= 2) {
						html2 += '<li><a href="'+(navi.pageNo-1)+'">&lt;</a>';
					} else {
						html2 += '<li class="disabled"><span>&lt;</span></li>';
					}
					for(var i=navi.beginPage; i <=navi.endPage;i++){
						html2 += '<li class="'+((navi.pageNo == i) ? "active" : "")+'"><a href='+i+'>'+i+'</a></li>';
					}
					if (navi.pageNo <navi.totalPages) {
						html2 += '<li><a href="'+(navi.pageNo+1)+'">&gt;</a>';
					} else {
						html2 += '<li class="disabled"><span>&gt;</span></li>';
					}
					html2 += '<li><a href="'+navi.totalPages+'">&raquo;</a>';
				};
				$("#navi-pagination").html(html2);
			})
		})
		$("a[id^=li-cat]").click(function(){
			var orderStatusId = $(this).attr("id").replace("li-cat-","");
			var choice = 1;
			if(orderStatusId == 'all'){
				choice = 0;
			}
			$(this).parents("li").siblings().removeClass("active");
			$(this).parents("li").addClass("active");
			$.getJSON("/rest/order/loadpage", {orderStatusId:orderStatusId, choice:choice, pageNo:1}).done(function(result){
				var html="";
				if(result.orders.length != 0){
					$.each(result.orders,function(index,order){
						html += "<tr>";
						html += "<td>"+order.no+"</td>";
						html += "<td>"+order.recipient+"</td>";
						html += "<td>"+order.part.name+"</td>";
						html += "<td>"+order.address+"</td>";
						html += "<td>";
						if(order.statusId.id == 'ORDER-WAIT'){
							html += "<span class='label label-warning'>대기</span>";
						}
						if(order.statusId.id == 'ORDER-DELIVARY'){
								html += "<span class='label label-info'>배송중</span>";
						}
						if(order.statusId.id == 'ORDER-COMPLETE'){
							html += "<span class='label label-success'>배송완료</span>";
						}
						if(order.statusId.id == 'ORDER-CANCEL'){
							html += "<span class='label label-danger'>주문취소</span>";
						}
						html += "</td>";
						html += "<td>";
						if(order.statusId.id == 'ORDER-WAIT'){
							html += "<a class='btn btn-info btn-xs' id='deli-order-"+order.no+"' >배송 중</a>";
							html += "<input type='hidden' id='deli-status' value='ORDER-DELIVARY'>"
							html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
						}
						if(order.statusId.id == 'ORDER-DELIVARY'){
							html += "<a class='btn btn-success btn-xs' id='deli-order-"+order.no+"' >배송 완료</a>";
							html += "<input type='hidden' id='deli-status' value='ORDER-COMPLETE'>"
							html += "<a class='btn btn-danger btn-xs' id='cancel-order-"+order.no+"'>주문 취소</a>"
						}
						html += "</td>";
						html += "</tr>";
					})
				}else{
					html += "<td>현재 주문내역이 존재하지않습니다</td>";
				}
				$("#deli-table tbody").html(html);
				
				var html2='';
				var navi = result.navi;
				if(result.orders.length!=0){
					html2 += '<li><a href="1">&laquo;</a>';
					if (navi.pageNo >= 2) {
						html2 += '<li><a href="'+(navi.pageNo-1)+'">&lt;</a>';
					} else {
						html2 += '<li class="disabled"><span>&lt;</span></li>';
					}
					for(var i=navi.beginPage; i <=navi.endPage;i++){
						html2 += '<li class="'+((navi.pageNo == i) ? "active" : "")+'"><a href='+i+'>'+i+'</a></li>';
					}
					if (navi.pageNo <navi.totalPages) {
						html2 += '<li><a href="'+(navi.pageNo+1)+'">&gt;</a>';
					} else {
						html2 += '<li class="disabled"><span>&gt;</span></li>';
					}
					html2 += '<li><a href="'+navi.totalPages+'">&raquo;</a>';
				};
				$("#navi-pagination").html(html2);
			})
		})
	})
</script>
</head>
<body>
	<div class="container">
	<div class="col-sm-3">
		<ul class="nav nav-pills nav-stacked" id="ul-cat">
			<li class="active"><a id="li-cat-all">전체목록</a></li>
			<li><a id="li-cat-ORDER-WAIT">대기목록</a></li>
			<li><a id="li-cat-ORDER-DELIVARY">배송 중인 목록</a></li>
			<li><a id="li-cat-ORDER-COMPLETE">배송 완료 목록</a></li>
			<li><a id="li-cat-ORDER-CANCEL">주문 취소 목록</a></li>
		</ul>
	</div>
	<div class="col-sm-9">
		<h1>소모품 배송 관리</h1>
		<div class="row">
			<table class="table table-condensed" id="deli-table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문인</th>
						<th>상품</th>
						<th>배송지</th>
						<th>배송 상태</th>
						<th>배송 상태 변경</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="row text-center">
				<ul class="pagination" id="navi-pagination">
				</ul>
			</div>
		</div>
	</div>
	</div>
	<div class="modal fade" id="cancel-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3>배송 취소</h3>
				</div>
				<form action="/manage/part/cancel.do">
					<input type="hidden" id="cancel-orderNo" name="orderNo">
					<div>
						<div class="text-center">
							<label>배송을 취소하겠습니까?</label>
						</div>
						<div class="text-right">
							<button class="btn btn-danger btn-sm" id="btn-cancel-accept" type="submit">예</button>
							<button class="btn btn-info btn-sm" id="btn-cancel-nope">아니오</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>