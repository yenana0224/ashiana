<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Asihana/resources/css/customer/customer.css">
</head>
<body>
   
    <jsp:include page="../common/headerbar.jsp"/>
	<c:set var="path" value="${ pageContext.request.contextPath }"/>
   
   <div id="content">
        <p>고객센터</p>
        
        <div id="noticeBoard">
        
            <div id="noticeAll" class="notice">
                <p>공지사항</p>
                <a href="${ path }/notice.customer?currentPage=1">더보기</a>
            </div>
            
            
            <div id="first" class="notice">
                <c:choose>
                	<c:when test="${ notice[0] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[0].noticeNo }&currentPage=1" class="noticeContent detail">${ notice[0].noticeTitle }</a>
		                </div>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[0].noticeNo }&currentPage=1" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            <div id="second" class="notice">
             	<c:choose>
                	<c:when test="${ notice[1] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[1].noticeNo }&currentPage=1" class="noticeContent detail">${ notice[1].noticeTitle }</a>
		                </div>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[1].noticeNo }&currentPage=1" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            <div id="third" class="notice">
            	<c:choose>
                	<c:when test="${ notice[2] ne null }">
		                <div id="firstNotice">
		                    <label>아시하나 소식</label>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[2].noticeNo }&currentPage=1" class="noticeContent detail">${ notice[2].noticeTitle }</a>
		                </div>
		                    <a href="${ path }/noticeDetail.customer?noticeNo=${ notice[2].noticeNo }&currentPage=1" class="noticePlus detailPlus">+</a>
                	</c:when>
                	<c:otherwise>
	                	<label>공지사항이 존재하지 않습니다.</label>
                	</c:otherwise>
                </c:choose>
            </div>
            
        </div>
        
        <div id="contentLine"></div>
        
        <div id="boardAll">
            <div id="faq">
                <button onclick="faq();">GO</button>
            </div>
            
            <div id="qa">
                <button onclick="qa();">GO</button>
            </div>
        </div>
        
    </div>
      
      <script>
      
		    $('.detail').click(function(){
		  		
		  		let noticeNo = $(this).text();
		  		
		  	})
	      
	      
	      	function faq(){
	      		location.href = "${ path }/faq.customer";
	      	}
	      	function qa(){
	      		location.href = "${ path }/qa.customer?currentPage=1";
	      	}
      	
      </script>
      
      
      
      
	<jsp:include page="../common/footer.jsp"/>




</body>
</html>