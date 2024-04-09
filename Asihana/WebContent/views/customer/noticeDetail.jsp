<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/Asihana/resources/css/customer/noticeDetail.css">
</head>
<body>
	
		<jsp:include page="../common/headerbar.jsp"/>
		<c:set var="path" value="${ pageContext.request.contextPath }"/>
		
			<div id="noticeMark">
                <p>공지사항</p>
            </div>
            
            <div id="noticeBox">

                <div id="titleBox">
                    <p>${ noticeDetail.noticeTitle }</p>
                </div>
                
                <div id="dateBox">
                    <label style="font-size: 12px;">작성일</label>
                    <p>${ noticeDetail.cdate }</p>
                </div>
                <c:choose>
                	<c:when test="${ noticeFile ne null }">
	                	<div id="imageBox">
		                    <img src="${ path + '/' + noticeFile.filePath + '/' + noticeFile.changeName }" alt="공지사항 이미지">
		                </div>
		                
		                <div id="noticeText">
		                    <p>${ noticeDetail.noticeContent }</p>
		                </div>
                	</c:when>
                	<c:otherwise>
                		 <div id="noticeText">
			                    <p>${ noticeDetail.noticeContent }</p>
			             </div>
			             <div id="imageBox" style="border:none;">
			             </div>
                	</c:otherwise>
                </c:choose>
                
                <div id="buttonBox">
	                <c:choose>
	                	<c:when test="${ (sessionScope.loginUser ne null) and (sessionScope.loginUser eq 'admin') }">
	                		<button class="btn btn-sm btn-danger" onclick="noticeUpdate();">수정</button>
		                    <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
	                	</c:when>
	                	<c:otherwise>
	                		<button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
	                	</c:otherwise>
	                </c:choose>
                </div>
            </div>
		
		
		
		<script>
			function noticeBack(){
				location.href='${ path }/notice.customer?currentPage=${ currentPage }';
			}
			function noticeUpdate(){
				location.href='${ path }/noticeUpdateForm.admin?noticeNo=${ noticeDetail.noticeNo }'
			}
			
		
		</script>
		
		
	<%@ include file="../common/footer.jsp" %>


</body>
</html>