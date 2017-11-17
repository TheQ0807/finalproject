<%@ page pageEncoding="UTF-8"%>
		<!-- pagination -->
		<div class="text-center">
			<ul class="pagination">
			<!--  
				<li><a href="1">1</a></li>
				<li><a href="2">2</a></li>
				<li><a href="3">3</a></li>
				<li><a href="4">4</a></li>
				<li><a href="5">5</a></li>
			-->
			<c:if test="${navi.totalRows gt 0 }"><!-- 얜 무슨설정인지 못들었다. -->
			
				<c:choose>
					<c:when test="${navi.pageNo gt 1 }">
						<li><a href="${navi.pageNo - 1 }">&lt;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><span>&lt;</span></li>
					</c:otherwise>
				</c:choose>
				<!--  
				<c:if test="${navi.pageNo gt 1 }">
					<li><a href="${navi.pageNo - 1 }">&lt;</a></li>
				</c:if>
				-->
				<c:forEach var="num" begin="${navi.beginPage }" end="${navi.endPage }">
					<li class="${navi.pageNo eq num ? 'active' : '' }"><a href="${num }">${num }</a></li>
				</c:forEach>
				
				<c:choose>
					<c:when test="${navi.pageNo lt navi.totalPages }">
						<li><a href="${navi.pageNo + 1 }">&gt;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><span>&gt;</span></li>
					</c:otherwise>
				</c:choose>
			</c:if>
			</ul>
		</div>