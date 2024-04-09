<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Asihana/resources/css/customer/notice.css">
</head>
<body>

	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
	<div id="noticetext">
        <p>공지사항</p>
    </div>
    
    <div id="search">
        <form action="${ path }/notice.customer" method="get">
        
            <select name="select" id="select">
	            <option value="title" selected>제목</option>
	            <option value="content">내용</option>
            </select>
            
            <input type="text" id="searchText" name="searchContent">
            <input type="hidden" name="currentPage" value="1">
            <button type="submit">검색</button>
            
        </form>
    </div>

    <div style="height: 70px;"></div>

    <table class="table">
    	 
        <thead>
            <tr>
                <th class="th noticeNo">번호</th>
                <th class="th title">제목</th>
                <th class="th date">등록일</th>
            </tr>
        </thead>
        
         
        <tbody>
	        <c:choose>
	        
	        	<c:when test="${ (empty noticeList) or ( pi.currentPage > pi.endPage )}">
		        	<tr>
		               <td colspan="3" style="color: #ff52a0;">조회된 게시글이 없습니다.</td>
		            </tr>
	        	</c:when>
	        	
	            <c:when test="${ (!empty noticeList) and ( searchContent eq null )}">
		            	<c:forEach var="notice" items="${ noticeList }">
			            	<c:choose>
			            		<c:when test="${ notice.noticeHold eq 'Y' }" >
					            	<tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
				            			<td class="td noticeNo" style="color:red;"><input type="hidden" class="hiddenNo" value="${ notice.noticeNo }">[공지]</td>
				            			<td class="td title">${ notice.noticeTitle }</td>
						                <td class="td date">${ notice.createDate }</td>
						            </tr>
			            		</c:when>
			            		<c:otherwise>
					            	<tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
					            		<td class="td noticeNo">${ notice.noticeNo }</td>
					            		<td class="td title">${ notice.noticeTitle }</td>
						                <td class="td date">${ notice.createDate }</td>
						            </tr>
			            		</c:otherwise>
				            </c:choose>
		            	</c:forEach>
	            </c:when>
	            
	        	<c:when test="${ (!empty noticeList) and ( searchContent ne null )}">
	        		<c:forEach var="notice" items="${ noticeList }">
		            	<tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
			            		<td class="td noticeNo">${ notice.noticeNo }</td>
			            		<td class="td title">${ notice.noticeTitle }</td>
				                <td class="td date">${ notice.createDate }</td>
			            </tr>
	            	</c:forEach>
	        	</c:when>
	        </c:choose>
        </tbody>
    </table>
		
		
	<!-- 버튼 영역 -->
	<c:choose>
	
		<c:when test="${ searchContent eq null }">
			<c:choose>
				<c:when test="${ pi.currentPage > pi.endPage }">
					<div id="buttonBox">
					</div>
				</c:when>
				<c:otherwise>
					<div id="buttonBox">
						<c:if test="${ pi.currentPage > 1 }">
							<button id="backButton" onclick="location.href='${ path }/notice.customer?currentPage=${ pi.currentPage - 1 }'">이전</button>
						</c:if>
						<c:forEach var="i" begin="${pi.startPage}" end="${ pi.endPage}" step="1" >
							<c:choose>
								<c:when test="${ pi.currentPage eq i }">
									<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke">${ i }</button>
								</c:when>
								<c:otherwise>
									<button class="numButton" onclick="location.href='${ path }/notice.customer?currentPage=${ i }'">${ i }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ pi.currentPage ne pi.getMaxPage()}">
							<button id="nextButton" onclick="location.href='${ path }/notice.customer?currentPage=${ pi.currentPage + 1 }'">다음</button>				
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
		</c:when>
	
		<c:otherwise>
			<c:choose>
				<c:when test="${ pi.currentPage > pi.endPage }">
					<div id="buttonBox">
					</div>
				</c:when>
				
				<c:otherwise>
					<div id="buttonBox">
						<c:if test="${ pi.currentPage > 1 }">
							<button id="backButton" onclick="location.href='${ path }/notice.customer?select=${ select }&searchContent=${ searchContent }&currentPage=${ pi.currentPage - 1 }'">이전</button>
						</c:if>
						<c:forEach var="i" begin="${pi.startPage}" end="${ pi.endPage}" step="1" >
							<c:choose>
								<c:when test="${ pi.currentPage eq i }">
									<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke">${ i }</button>
								</c:when>
								<c:otherwise>
									<button class="numButton" onclick="location.href='${ path }/notice.customer?currentPage=${ i }'">${ i }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ pi.currentPage ne pi.getMaxPage()}">
							<button id="nextButton" onclick="location.href='${ path }/notice.customer?select=${ select }&searchContent=${ searchContent }&currentPage=${ pi.currentPage + 1 }'">다음</button>				
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	
	<script>
		
		function mouseIn(e){
			e.style.backgroundColor = 'lightgray';
		}
		
		function mouseOut(e){
			e.style.backgroundColor = 'rgba(247, 240, 233, 0.253)';
		}
		
		$('.td').click(function(){
			
			let noticeNo;
			
			if($(this).hasClass('noticeNo')){
				noticeNo = $(this).text();
				if(noticeNo === '[공지]'){
					noticeNo = $(this).children('.hiddenNo').val();
				}
			}
			else{
				noticeNo = $(this).siblings().eq(0).text();
				if(noticeNo === '[공지]'){
					noticeNo = $(this).siblings().children('.hiddenNo').val();
				}
			}
			
			location.href='${ path }/noticeDetail.customer?noticeNo=' + noticeNo + '&currentPage=' + ${ pi.currentPage };
		})
		
	</script>

	
	<jsp:include page="../common/footer.jsp"/>




</body>
</html>