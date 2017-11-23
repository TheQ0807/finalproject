<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../commons/jstl.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:['corechart', 'bar']});
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.19.2/moment.min.js"></script>
<title>재무 메인 페이지</title>
<style type="text/css">
div.container {
    max-height: 1024px;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h1>수입/지출 분석</h1>
		<hr/>
	</div>
	<div class="row">
		<div class="form-group col-sm-offset-2 col-sm-2">
		</div>
		<div class="form-group col-sm-2">
			<input type="date" id="start-date" class="form-control"/>
		</div>
		<div class="form-group col-sm-2">
			<input type="date" id="end-date" class="form-control"/>
		</div>
		<div class="form-group col-sm-2">
			<select id="type-select" class="form-control">
				<option value="all" selected="selected">--전체--</option>
				<c:forEach items="${CTList}" var="type">
					<option value="${type.id}">${type.info }</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group col-sm-2">
			<select id="order-select" class="form-control">
				<option value="all" selected="selected">수입/지출</option>
				<option value="수입">수입</option>
				<option value="지출">지출</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-6" style="height:600px;">
			<div class="row">
				<table class="table table-condensed table-striped">
					<colgroup >
						<col width="20%">
						<col width="*">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>일시</th>
							<th>내역</th>
							<th>수입/지출</th>
							<th>금액</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="row" style="height:500px; overflow: auto;">
				<table class="table table-condensed table-striped">
					<colgroup >
						<col width="20%">
						<col width="*">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<tbody id="table-body">
						<tr>
							<td>일시</td>
							<td>내역</td>
							<td>수입/지출</td>
							<td>금액</td>
						</tr>
					</tbody>
				</table>
				<div>
					
				</div>
			</div>
		</div>
		<div class="col-sm-6" id="chart-div" style="height:600px;">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function() {
	
	$("#end-date").click(function(e) {
		if(!$("#start-date").val()) {
			alert("시작일을 선택해 주세요!");
			return false;
		}
	});
	
	$("#start-date").change(function(e){
		var startDate = new Date($(this).val());
		var today = new Date(moment().format("YYYY-MM-DD"))
		
		if(startDate > today) {
			alert("금일 이후의 값은 가져올 수 없습니다.");
			$(this).val("");
			return false;
		}
		
		getSalesAnalysis($("#start-date").val(), $("#end-date").val(), $("#order-select").val(), $("#type-select").val());
	});
	
	$("#end-date").change(function(e){
		var endDate = new Date($(this).val());
		var startDate = new Date($("#start-date").val());
		var today = new Date(moment().format("YYYY-MM-DD"))
		
		if(endDate > today) {
			alert("금일 이후의 값은 가져올 수 없습니다.");
			$(this).val("");
			return false;
		}
		if(startDate > endDate) {
			alert("시작일보다 큰 날짜를 선택해주세요.");
			$(this).val("");
			return false;
		}
		
		getSalesAnalysis($("#start-date").val(), $("#end-date").val(), $("#order-select").val(), $("#type-select").val());
	});
	
	$("#order-select").change(function(e){
		var type = $(this).val();
		
		getSalesAnalysis($("#start-date").val(), $("#end-date").val(), $("#order-select").val(), $("#type-select").val());
	});
	
	$("#type-select").change(function(e) {
		getSalesAnalysis($("#start-date").val(), $("#end-date").val(), $("#order-select").val(), $("#type-select").val());
	});
	
	function getSalesAnalysis(startDate, endDate, type, changeType) {
		$.ajax({
			type:"get",
			url:"/manage/finance/payChange/getAnalysis.do",
			data: {
				startDate: startDate,
				endDate: endDate,
				type: type,
				changeType: changeType
			},
			dataType:"json",
			success: function(result) {
				var htmlContents = "";
				console.log(result);
				$.each(result, function(index, change) {
					htmlContents += "<tr>";
					htmlContents += "<td>"+moment(change.changedate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
					htmlContents += "<td>"+((change.changeType.id=="PC-OTHER-PAY")? (change.changeType.info+" ("+change.reason+")") : change.changeType.info)+"</td>";
					htmlContents += "<td>"+change.type+"</td>";
					htmlContents += "<td>"+change.money+"</td>";
					htmlContents += "</tr>";
				});
				$("#table-body").html(htmlContents);
				drawChart(startDate, endDate, result);
			}
		});
	}
	
	function drawChart(startDate, endDate, result) {
		console.log(startDate, endDate, result);
		if(!result) {
			
			return;
		}
		var day = parseInt(moment(moment(endDate) - moment(startDate)).date());
		var data = new google.visualization.DataTable();
		data.addColumn("string", "날짜");
		data.addColumn("number", "수입");
		data.addColumn("number", "지출");
		var chartData = [];
		
		for(var i = 1; i <= day; ++i) {
			var date = moment(endDate).add(-(day-i), 'days').format("YY-MM-DD");
			var inMoney = 0, outMoney = 0;
			$.each(result, function(index, change) {
				if(date == moment(change.changedate).format("YY-MM-DD")) {
					if(change.type == "수입") {
						inMoney += parseInt(change.money);
					} else {
						outMoney += parseInt(change.money);
					}
				}
			});
			
			chartData.push([
				date,
				inMoney,
				outMoney
			]);
		}
		data.addRows(chartData);
		
		var title = startDate;
		title += "~ " + endDate;
		title += " 까지 " + $("#order-select option:selected").text();
		title += " " + $("#type-select option:selected").text().replace("--전체--","전체") + " 현황";
		
	    var options = {
	      title: title,
	      width: 800,
	      height:600,
	      bar: {groupWidth: "95%"},
	      legend: { position: "none" },
	    };
	    var chart = new google.visualization.ColumnChart(document.getElementById("chart-div"));
	    chart.draw(data, options);
	}
	
	$("#start-date").val(moment().add(-7, 'days').format("YYYY-MM-DD"))
	$("#end-date").val(moment().format("YYYY-MM-DD"));
	google.charts.setOnLoadCallback(getSalesAnalysis(moment().add(-7, 'days').format("YYYY-MM-DD"), moment().format("YYYY-MM-DD"), "all", "all"));
});
</script>
</html>