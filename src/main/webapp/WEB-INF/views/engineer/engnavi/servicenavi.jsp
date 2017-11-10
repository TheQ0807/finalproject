<%@ page pageEncoding="UTF-8"%>
<style>
	.sidebar {position: fixed; top: 70px; display: block; padding: 20px; background-color: #f5f5f5; border-right: 1px solid #eee; overflow-x: hidden;
				overflow-y: auto; z-index: 1000; bottom:0; left:0; font-size: 20px; font-weight: bold;}
	h1 {padding-left: 11%;}
	#list {font-size: 20px;}
	#blank {height: 50px;}
	.navbar {font-weight: bold; font-size: 25px;}
	.container-fluid {padding-top: 5px;}
	#result, #select {border: 1px solid; height: 500px; border-radius: 12px; border-style: outset; border-color: #cccccc; border-width: 7px; padding-top: 20px;}
	#logo {width: 200px; height: 66px; padding-top: 10px; padding-bottom: 10px;}
</style>
<nav class="navbar navbar-inverse">
		  <div class="col-sm-2"><img id="logo" src="/resources/images/main/image/main log.png"></div>
	  <div class="container-fluid">
	    <ul class="nav navbar-nav">
	      <li class="${innermenu eq 'reserve' ? 'active' :'' }"><a href="#">예약확인</a></li>
	      <li class="${innermenu eq 'visit' ? 'active' :'' }"><a href="#">출장</a></li>
	      <li class="${innermenu eq 'stock' ? 'active' :'' }"><a href="#">재고확인</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 메인으로</a></li>
	    </ul>
	  </div>
	</nav>
	
	<div class="cotainer-fluid">
    	<div class="row">
    		<div class="col-sm-3 col-sm-2 sidebar">
    			<ul class="nav nav-sidebar">
		            <li class="${menu eq 'service' ? 'active' :'' }"><a href="#">서비스 관리</a></li>
		            <li class="${menu eq 'mypage' ? 'active' :'' }"><a href="#">마이 페이지</a></li>
		            <li class="${menu eq 'paystub' ? 'active' :'' }"><a href="#">명세서 출력</a></li>
		          </ul>
    		</div>
    	</div>