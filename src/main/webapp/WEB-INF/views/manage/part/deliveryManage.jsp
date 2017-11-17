<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
		<h1>소모품 배송 관리</h1>
		<div class="row">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문인</th>
						<th>상품</th>
						<th>배송지</th>
						<th>배송 상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>김기동</td>
						<td>충전기</td>
						<td>몰라</td>
						<td>알게머임</td>
						<td>
							<span class="btn btn-warning btn-sm	">대기</span>
							<span class="btn btn-info btn-sm">배송 중</span>
							<span class="btn btn-success btn-sm">배송 완료</span>
							<span class="btn btn-danger btn-sm">주문 취소</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>