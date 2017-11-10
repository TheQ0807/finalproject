<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="pragma" content="no-store"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Expires" content="-1"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript" src="/resources/SmartEditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" ></script>
</head>
<style>
	div.container {max-width: 1024px;}
</style>
<body>
<%@ include file="/WEB-INF/views/manage/common/navi(incomplete).jsp" %>
<div class="container">
	<div class="row">
		<table class="table table-condenced">
			<colgroup>
				<col width="15%">
				<col width="*">
				<col width="20%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>글 번호</th>
					<th>글 제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty boards }">
				<tr>
					<td colspan="5" class="text-center">검색된 결과가 없습니다.</td>
				</tr>
			</c:if>
			<tr>
				<td>0</td>
				<td><a href="" id="notice-detail" data-toggle="modal" data-target="#notice-form-modal"><c:out value="공지입니다"></c:out></a></td>
				<td>2017-11-06</td>
				<td>0</td>
			</tr>
			<c:forEach var="board" items="${boards }">
				<c:url var="detailURL" value="detail.do">
					<c:param name="no" value="${board.no }" />
				</c:url>
				<tr>
					<td>${board.no }</td>
					<td><a href="${detailURL }"/><c:out value="${board.title }"/></td>
					<td><fmt:formatDate value="${board.createdate }" pattern="yyyy-MM-dd"/></td>
					<td>${board.count }</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
		<div class="row text-right">
			<a href="addform.do" class="btn btn-primary btn-sm" id="btn-new-notice">새 공지 등록</a>
		</div>
	</div>
	
</div>
</body>
</html>