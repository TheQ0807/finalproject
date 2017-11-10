<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="pragma" content="no-store" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/resources/css/visit.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.bg-primary {
	height:60px;
}
.container {
	width: "600px";
}
.reserve-dt {
	border: 1px solid white;
	border-radius: 5px;
	background-color: #616161;
	height:80px;
	padding:10px;
}
.reserve-dt a{
	font-size: 32px;
	color: white;
	text-decoration: none;
}
dl dd {
	display: none;
}
dd ul li{
	display: inline-block;
	width: 150px;
}
.select {
	background-color : #0BA8FF;
	cursor: pointer;
}
.select-box {
	background-color : #125ab8;
}
dt a {
	user-select: none;
}
</style>
</head>
<body>
	<%@ include file="../include/headNav.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h1>센터방문 예약</h1>
			</div>
			<div class="col-sm-6 text-right">
				<a href="#"><span class="glyphicon glyphicon-home"
					aria-hidden="true"></span><span>홈</span></a> > <a href="#"><span>서비스
						신청/안내</span></a> > <a href="#"><span>센터방문 예약</span></a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-10 col-sm-offset-2 text-center">
				<span class="glyphicon glyphicon-info-sign text-info" aria-hidden="true"></span>
				<span class="text-info">센터방문 전에 콜센터(1588-3366)로 전화주시면 제품별 전문상담사와 상담받으실 수 있습니다.</span>
			</div>
		</div>
		<div class="row">
		<form action="" method="post">
			<input type="hidden" name="product-info" value=""/>
			<input type="hidden" id="center-input" name="center" value=""/>
			<input type="hidden" id="reserve-input" name="reservation" value=""/>
			<input type="hidden" id="emp-input" name="emp" value=""/>
		</form>
		<dl class="col-sm-12">
			<dt class="reserve-dt row" id="reserve-product">
				<a><strong>Step1</strong> <span class="glyphicon glyphicon-phone"></span> 제품 / 증상을 선택하세요</a>
			</dt>
			<dd class="row">
				<div class="row">
					<div id="CAT-COM" class="col-sm-3 inline-block text-center">
						<img alt="컴퓨터" src="/resources/images/main/icon/computer.png">
						<h4><strong>컴퓨터</strong></h4>
					</div>
					<div id="CAT-PH" class="col-sm-3 inline-block text-center">
						<img alt="휴대전화" src="/resources/images/main/icon/phone.png">
						<h4><strong>휴대기기</strong></h4>
					</div>
					<div id="CAT-AP" class="col-sm-3 inline-block text-center">
						<img alt="가전제품" src="/resources/images/main/icon/Laundry.png">
						<h4><strong>생활가전</strong></h4>
					</div>
					<div id="CAT-WE" class="col-sm-3 inline-block text-center">
						<img alt="웨어러블기기" src="/resources/images/main/icon/watch.png">
						<h4><strong>웨어러블 기기</strong></h4>
					</div>
				</div>
				<div class="row">
					<ul id="division">
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
						<li><h4><a class="btn">sadfsdf</a></h4></li>
					</ul>
				</div>
				<div class="row">
					<div class="col-sm-2"><h3><label class="control-label">선택한 제품</label></h3></div>
					<div class="col-sm-offset-1 col-sm-9">
						<h4><label class="control-label">생활가전</label></h4>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-2 text-center">
						<h3><label class="control-label">고장 증상</label></h3>
					</div>
					<div class="col-sm-10">
						<textarea class="form-control" rows="5" name="symptom" placeholder="- 고장 증세를 자세하게 써주시면 더욱 빠른 서비스가 가능합니다."></textarea>
					</div>
				</div>
			</dd>
		</dl>
		<dl class="col-sm-12">
			<dt class="reserve-dt row" id="reserve-center">
				<a><strong>Step2</strong> <span class="glyphicon glyphicon-map-marker"></span> 방문하실 센터를 선택하세요.</a>
			</dt>
			<dd class="row">
				<div class="col-sm-6">
					<div class="row"><h3><label>지역검색</label></h3></div>
					<div class="row">
						<div class="col-sm-5">
							<select id="center-locale" class="form-control">
								<option value="">--광역시/도--</option>
								<c:forEach items="${localeList}" var="locale">
									<option value="${locale.id }">${locale.name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-5">
							<select id="center-city" class="form-control">
								<option value="">--시/구/군--</option>
							</select>
						</div>
						<div class="col-sm-2">
							<button id="locale-btn" class="btn btn-primary">검색</button>
						</div>
					</div>
					<div id="center-name-div" class="row well" style="display: none;">
						<div class="row">
							<table id="center-table" class="table">
								<colgroup>
									<col width="20%">
									<col width="*">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>센터명</th>
										<th>주소</th>
										<th>구분</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div id="map" style="width:100%;height:350px;"></div>
				</div>
				<div class="col-sm-12 well">
					<h3><span>방문하실 센터 : </span> <span id="span-center"></span></h3>
				</div>
			</dd>
		</dl>
		<dl class="col-sm-12">
			<dt class="reserve-dt row" id="reserve-time">
				<a><strong>Step3</strong> <span class="glyphicon glyphicon-calendar"></span> 예약일을 선택하세요.</a>
			</dt>
			<dd>
				<div class="col-sm-5">
					<div class="row bg-primary text-center">
						<h2><span>예약날짜 선택</span></h2>
					</div>
					<div class='wrap' style="border-right:1px solid black">
						<div class='btn-holder'>
							<button id='btnPrev'>&lt;</button>
							 <span id='currentDate'></span> 
							<button id='btnNext'>&gt;</button>
						</div>
						<div id="calendar"></div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="row bg-primary text-center">
						<h4><span>엔지니어 선택</span></h4>
					</div>
					<div>
					<div class="row text-center">
						<span>엔지니어 이름을 클릭하여 선택하세요.</span>
						<img id="emp-img" src="/resources/images/main/image/reserve_noimg.gif" width="80%">
					</div>
					<div id="emplist-div" class="row" style="height:110px;overflow: auto;">
						
					</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="row bg-primary text-center">
						<h2><span>예약시간 선택</span></h2>
					</div>
					<div class="row" style="overflow:auto; height:327px;" >
					<table class="table">
						<thead>
							<tr>
								<th class="text-center" colspan="6">오전</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>09:00</td>
								<td>09:10</td>
								<td>09:20</td>
								<td>09:30</td>
								<td>09:40</td>
								<td>09:50</td>
							</tr>
							<tr>
								<td>10:00</td>
								<td>10:10</td>
								<td>10:20</td>
								<td>10:30</td>
								<td>10:40</td>
								<td>10:50</td>
							</tr>
							<tr>
								<td>11:00</td>
								<td>11:10</td>
								<td>11:20</td>
								<td>11:30</td>
								<td>11:40</td>
								<td>11:50</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th class="text-center" colspan="6">오후</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>12:00</td>
								<td>12:10</td>
								<td>12:20</td>
								<td>12:30</td>
								<td>12:40</td>
								<td>12:50</td>
							</tr>
							<tr>
								<td>13:00</td>
								<td>13:10</td>
								<td>13:20</td>
								<td>13:30</td>
								<td>13:40</td>
								<td>13:50</td>
							</tr>
							<tr>
								<td>14:00</td>
								<td>14:10</td>
								<td>14:20</td>
								<td>14:30</td>
								<td>14:40</td>
								<td>14:50</td>
							</tr>
							<tr>
								<td>15:00</td>
								<td>15:10</td>
								<td>15:20</td>
								<td>15:30</td>
								<td>15:40</td>
								<td>15:50</td>
							</tr>
							<tr>
								<td>16:00</td>
								<td>16:10</td>
								<td>16:20</td>
								<td>16:30</td>
								<td>16:40</td>
								<td>16:50</td>
							</tr>
							<tr>
								<td>17:00</td>
								<td>17:10</td>
								<td>17:20</td>
								<td>17:30</td>
								<td>17:40</td>
								<td>17:50</td>
							</tr>
						</tbody>
					</table>
					</div>
				</div>
			</dd>
		</dl>
	</div>
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78882296b3a732eec5d3099999dc082f&libraries=services"></script>
<script type="text/javascript">
var map;
var marker;
$(".reserve-dt").click(function(e) {
	$(this).toggleClass("select-box");
	console.log($(this));
	$(this).next().toggle(300, function(e){
		
		var geocoder = new daum.maps.services.Geocoder();

		var callback = function(result, status) {
		    if (status === daum.maps.services.Status.OK) {
		    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    		userLocation = new daum.maps.LatLng(result[0].y, result[0].x);
			    mapOption = { 
			        center: userLocation, // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				
			    // 마커를 생성합니다
			    marker = new daum.maps.Marker({
			        position: userLocation
			    });

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				map = new daum.maps.Map(mapContainer, mapOption); 
				// 마커가 지도 위에 표시되도록 설정합니다
			    marker.setMap(map);
		    }
		};

		geocoder.addressSearch('${loginUser.address}', callback);
	});
});
</script>
<script type="text/javascript" src="/resources/js/reservation/reserve.js"></script>
</html>