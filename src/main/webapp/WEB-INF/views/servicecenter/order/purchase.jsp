<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../commons/jstl.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
img {
	width: 100%;
	max-width: 760px;
	vertical-align: middle;
}

div.container {
	max-height: 1024px;
}
</style>
<script type="text/javascript">
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#pick-user").change(function() {
			var check = $(this).prop("checked")
			if(check){
				var addr = ${loginUser.address}.split(',');
				$("input[name=recipient]").val(${loginUser.name})
				$("input[name=email]").val(${loginUser.email})
				$("input[name=phone]").val(${loginUser.phone})
				$("input[name=zipcode]").val(${loginUser.zipcode})
				$("input[name=address1]").val(${loginUser.address[0]})
				$("input[name=address2]").val(${loginUser.address[1]})
			}else{
				$("input[name=recipient]").val("")
				$("input[name=email]").val("")
				$("input[name=phone]").val("")
				$("input[name=zipcode]").val("")
				$("input[name=address1]").val("")
				$("input[name=address2]").val("")
			}
		})
	})
</script>
</head>
<body>
	<%@ include file="../include/headNav.jsp"%>
	<div class="container">
		<form action="/order/addOrder.do" method="get">
		<div class="row">
			<div class="row">
				<p>HOME > 쇼핑 > 음향기기 > 헤드셋</p>
			</div>
			<div class="row">
				<h1>주문하기</h1>
			</div>
		</div>
		<div class="row">
			<a href=""><span class="label label-primary">1. 주문서 작성<span
					class="glyphicon glyphicon-shopping-cart"></span></span></a> > <a href=""><span
				class="label label-default">2. 결제<span
					class="glyphicon glyphicon-usd"></span></span></a> > <a href=""><span
				class="label label-default">3. 주문완료<span
					class="glyphicon glyphicon-gift"></span></span></a>
		</div>
		<div class="row">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>상 품 명</th>
						<th>개수</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="col-sm-4">
								<img alt="" src="/resources/images/part/EO-BG935CWKGKR.jpg">
							</div>
							<div class="col-sm-7 col-sm-offset-1">
								<input type="hidden" name="partNo" value="12">
								<p>Level U Pro ANC(White)</p>
								<p>EO-BG935CWKGKR</p>
							</div>
						</td>
						<td>
							<div>
								<input type="hidden" name="count" value="1">
								<p>1</p>
							</div>
						</td>
						<td>
							<div>
								<input type="hidden" name="purchase" value="119900">
								<p>119,900원</p>
							</div>
						</td>

					</tr>
					<tr>
				</tbody>
			</table>
			<table class="table table-condensed well">
				<tr>
					<th>업체명 :</th>
					<td>ES서비스센터</td>
					<th>배송료 :</th>
					<td>무료</td>
				</tr>
				<tr>
					<th></th>
					<td></td>
					<th>전체 상품 금액 :</th>
					<td>119,900원</td>
				</tr>
			</table>
		</div>
		<div class="row">
				<input type="hidden" name="buyerNo" value="${loginUser.no }">
				<div class="col-sm-6">
					<h3>배송정보 입력</h3>
					<hr class="one">
					<div class="row">
						<input type="checkbox" id="pick-user">회원과 동일
					</div>
					<div class="row">
						<div class="form-group">
							<input type="text" class="form-control" name="recipient"
								placeholder="받는사람을 입력하세요">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="email"
								placeholder="받는 사람의 이메일을 입력하세요">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" name="phone"
								placeholder="받는 사람의 전화번호를 입력하세요">
						</div>
						<div class="form-group">
							<input type="text" id="sample6_postcode" name="zipcode"
								placeholder="우편번호"> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" class="form-control" id="sample6_address"
								name="address1" placeholder="주소"> <input type="text"
								class="form-control" id="sample6_address2" name="address2"
								placeholder="상세주소">
						</div>
						<div class="form-group">
							<textarea rows="3" class="form-control" name="message"
								placeholder="부재시 메세지를 입력하세요"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<h3>결제수단 선택</h3>
					<hr class="one">
					<div class="form-group">
						<input type="radio">카드결제
					</div>
				</div>
				<div class="row text-right">
					<button type="submit" class="btn btn-info btn-sm">결제</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>