<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Asihana/resources/css/customer/qna.css">
</head>
<body>
	<jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
	<div id="qaText">
        <p>Q & A</p>
    </div>
    
    <div id="search">
        <form action="${ path }/qa.customer" method="get">
            <select name="select" id="select">
            <option value="title">제목</option>
            <option value="content">내용</option>
            </select>
            <input type="text" id="searchText" name="searchContent">
            <input type="hidden" name="currentPage" value="1">
            <button>검색</button>
        </form>
    </div>

    <div style="height: 80px;"></div>

    <table class="table">
        <thead>
            <tr>
                <th class="th qaNo">번호</th>
                <th class="th status">답변상태</th>
                <th class="th title">제목</th>
                <th class="th date">등록일</th>
            </tr>
        </thead>
        <tbody>
	        <c:choose>
	        	<c:when test="${ (empty qnaList ) or ( pi.currentPage > pi.endPage )}">
		        	<tr>
		               <td colspan="4" style="color: #ff52a0;">조회된 게시글이 없습니다.</td>
		            </tr>
	        	</c:when>
	        	<c:when test="${ !empty qnaList }">
		            <c:forEach var="qna" items="${ qnaList }">
			            <c:choose>
			            	<c:when test="${ qna.qnaStatus eq 'Y' }">
					            <tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
					                <td class="td qaNo">${ qna.qnaNo }</td>
					                <td class="td status" style="color:red;font-weight:bold;">답변완료</td>
					                <td class="td title">${ qna.qnaTitle }</td>
					                <td class="td date">${ qna.createDate }</td>
					            </tr>
			            	</c:when>
			            	
			            	<c:otherwise>
			            		 <tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
					                <td class="td qaNo">${ qna.qnaNo }</td>
					                <td class="td status"></td>
					                <td class="td title">${ qna.qnaTitle }</td>
					                <td class="td date">${ qna.createDate }</td>
					            </tr>
			            	</c:otherwise>
			            </c:choose>
		            </c:forEach>
	        	</c:when>
	        </c:choose>
        </tbody>
    </table>
    
    <c:if test="${ sessionScope.loginUser ne null }">
	    <div id="insertQa">
	        <button>작성</button>
	    </div>
    </c:if>
    
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
							<button id="backButton" onclick="location.href='${ path }/qa.customer?currentPage=${ pi.currentPage - 1 }'">이전</button>
						</c:if>
						<c:forEach var="i" begin="${pi.startPage}" end="${ pi.endPage}" step="1" >
							<c:choose>
								<c:when test="${ pi.currentPage eq i }">
									<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke">${ i }</button>
								</c:when>
								<c:otherwise>
									<button class="numButton" onclick="location.href='${ path }/qa.customer?currentPage=${ i }'">${ i }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ pi.currentPage ne pi.getMaxPage()}">
							<button id="nextButton" onclick="location.href='${ path }/qa.customer?currentPage=${ pi.currentPage + 1 }'">다음</button>				
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
							<button id="backButton" onclick="location.href='${ path }/qa.customer?select=${ select }&searchContent=${ searchContent }&currentPage=${ pi.currentPage - 1 }'">이전</button>
						</c:if>
						<c:forEach var="i" begin="${pi.startPage}" end="${ pi.endPage}" step="1" >
							<c:choose>
								<c:when test="${ pi.currentPage eq i }">
									<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke">${ i }</button>
								</c:when>
								<c:otherwise>
									<button class="numButton" onclick="location.href='${ path }/qa.customer?currentPage=${ i }'">${ i }</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ pi.currentPage ne pi.getMaxPage()}">
							<button id="nextButton" onclick="location.href='${ path }/qa.customer?select=${ select }&searchContent=${ searchContent }&currentPage=${ pi.currentPage + 1 }'">다음</button>				
						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
    
	
	<script>
		$('#insertQa>button').click(function(){
			location.href='${ path }/enrollQa.customer';
		})
		function mouseIn(e){
			e.style.backgroundColor = 'lightgray';
		}
		function mouseOut(e){
			e.style.backgroundColor = 'rgba(247, 240, 233, 0.253)';
		}
		
		$('.td').click(function(){
			
			let qaNo;
			
			if($(this).hasClass('qaNo')){
				qaNo = $(this).text();
			}
			else{
				qaNo = $(this).siblings().eq(0).text();
			}
			
			location.href='${ path }/qnaDetail.customer?qnaNo=' + qaNo + '&currentPage=' + ${ pi.currentPage };
		})
	
	</script>
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>	
	
</body>
</html>