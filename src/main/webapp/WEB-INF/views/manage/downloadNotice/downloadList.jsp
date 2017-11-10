<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
	div.container {max-height: 1024px;}
</style>
<body>
<div class="container">
	<h1>업로드 페이지</h1>
		<div class="row">
			<form>
				<div class="form-group col-sm-3">
					<select class="form-control" name="cat0">
						<option value="" selected="selected">선택하세요</option>
						<option value="z">스마트폰</option>
						<option value="x">노트북</option>
						<option value="c">데스크탑</option>
					</select>
				</div>
			</form>
			<form>
				<div class="form-group col-sm-3">
					<select class="form-control" name="cat1">
						<option value="" selected="selected">선택하세요</option>
						<option value="z">window</option>
						<option value="x">linux/unix</option>
						<option value="c">Android</option>
					</select>
				</div>
			</form>
		</div>
		<table class="table table-condenced">
			<thead>
				<tr>
					<th>글번호</th>
					<th>드라이버명</th>
					<th>OS환경</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="" id="driver" data-toggle="modal" data-target="#upload-form-modal">gn-001</a></td>
					<td>window</td>
					<td>2017-11-03</td>
				</tr>
			</tbody>
		</table>
		<div class="text-right">
			<a href="" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#upload-form-modal">드라이버 업로드</a>
		</div>
		<div class="modal fade" id="upload-form-modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">파일 업로드 등록폼</h4>
				</div>
				<form>
					<input type="hidden" name="no">
					<div class="modal-body">
						<div class="form-group">
							<label>드라이버명</label>
							<input type="text" class="form-control" name="title">
						</div>
						<div class="form-group">
							<select class="form-control" name="os">
								<option value="" selected="selected">선택하세요</option>
								<option value="window">window</option>
								<option value="linux">linux/unix</option>
								<option value="android">Android</option>
							</select>
						</div>
						<div class="form-group">
							<label>업로드 파일</label>
							<input type="file" class="form-control" name="file">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea rows="3" class="form-control" name="description"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-sm"data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary btn-sm" id="btn-addupload">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#driver").click(function(){
			$(":input[name=title]").val("gn-001");
			$(":input[name=os]").val("window");
			$(":input[name=file]").val("");
			$(":input[name=description]").val("description");
		})

		$('#upload-form-modal').on('hidden.bs.modal',function(e){
			$(":input[name=title]").val("");
			$(":input[name=os]").val("");
			$(":input[name=file]").val("");
			$(":input[name=description]").val("");
		})
	})
</script>
</html>