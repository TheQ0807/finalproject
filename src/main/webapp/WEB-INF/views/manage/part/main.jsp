<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../commons/jstl.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>물류 메인 페이지</title>
<style type="text/css">
div.container {
    max-height: 1024px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/manage/common/navi.jsp"%>
<div class="container">
	<div class="row">
		<h1>공지 사항</h1>
		<hr/>
	</div>
	<div class="row">
		<div class="col-sm-12" style="height:600px;">
			<div class="row">
				<table class="table table-condensed">
					<colgroup >
						<col width="90%">
						<col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="row" style="height:500px; overflow: auto;">
				<table class="table table-condensed">
					<colgroup >
						<col width="90%">
						<col width="10%">
					</colgroup>
					<tbody>
						
					</tbody>
				</table>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>