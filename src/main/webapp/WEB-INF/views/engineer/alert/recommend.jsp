<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../commons/jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	 
    <c:set var="menu" value="engMain" />
    <c:set var="innermenu" value="recommend" />
	<%@include file="../engnavi/mainnavi.jsp" %>
    
    	<div class="col-sm-9 col-sm-offset-1 col-md-10 col-md-offset-1 main">
    		<h1>DashBoard</h1>
    		<hr>
    		<div class="container">
    			<div class="row">
    				<div class="col-sm-12" id="blank"></div>
    			</div>
    			<div class="row">
	    			<div class="col-sm-6">
		    			<div class="col-sm-11">
		    			<div id="select" class="col-sm-12">
		    				<div class="col-sm-12" id="list">
			    				<ul>
			    					<li><p>건의 사항</p></li>
			    					<li><p>건의 사항</p></li>
			    					<li><p>모든 공지사항 보기</p></li>
			    				</ul>
		    				</div>
		    			</div>
		    			</div>
	    			</div>
	    			<div class="col-sm-6">
		    				<div class="row">
		    				<div class="col-sm-12" id="result">
			    				<table class="table table-hover">
			    					<thead>
			    						<tr>
			    							<th>no</th>
			    							<th>title</th>
			    							<th>dates</th>    							
			    						</tr>
			    					</thead>
			    					<tbody>
			    						<tr>
			    							<td>1</td>
			    							<td>연습</td>
			    							<td>11.1.1</td>
			    						</tr>
			    						<tr>
			    							<td>2</td>
			    							<td>연습</td>
			    							<td>11.1.1</td>
			    						</tr>
			    					</tbody>
			    				</table>
		    				</div>
	    				</div>
	    	  		</div>
    	  		</div>
    	  	</div>
    	</div>
    </div>
</body>
<script type="text/javascript">
</script>
</html>