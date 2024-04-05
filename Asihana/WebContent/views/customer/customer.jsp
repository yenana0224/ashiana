<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.customer.model.vo.Notice" %>
<%
   Notice[] notice = (Notice[])request.getAttribute("notice");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="$../../resources/css/customer/customer.css">
</head>
<body>
   
   <%@ include file="../common/headerbar.jsp" %>
   
   <div id="content">
        <p>고객센터</p>
        
        <div id="noticeBoard">
        
            <div id="noticeAll" class="notice">
                <p>공지사항</p>
                <a href="<%=contextPath%>/notice.customer?currentPage=1">더보기</a>
            </div>
            
            
            <div id="first" class="notice">
                <% if(notice[0] != null) { %>
	                <div id="firstNotice">
	                    <label>아시하나 소식</label>
	                    <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[0].getNoticeNo()%>" class="noticeContent detail"><%= notice[0].getNoticeTitle() %></a>
	                </div>
	                    <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[0].getNoticeNo()%>" class="noticePlus detailPlus">+</a>
                <% } else {%>
                	<label>공지사항이 존재하지 않습니다.</label>
                <% } %>
            </div>
            <div id="second" class="notice">
             	<% if(notice[1] != null) { %>
	                <div id="secondNotice">
	                    <label>아시하나 소식</label>
	                    <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[1].getNoticeNo()%>" class="noticeContent detail"><%= notice[1].getNoticeTitle() %></a>
	                </div>
	                <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[1].getNoticeNo()%>" class="noticePlus detailPlus">+</a>
                <% } else {%>
                	<label>공지사항이 존재하지 않습니다.</label>
                <% } %>
            </div>
            <div id="third" class="notice">
            	<% if(notice[2] != null) { %>
	                <div id="thirdNotice">
	                    <label>아시하나 소식</label>
	                    <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[2].getNoticeNo()%>" class="noticeContent detail"><%= notice[2].getNoticeTitle() %></a>
	                </div>
	                <a href="<%=contextPath%>/noticeDetail.customer?noticeNo=<%=notice[2].getNoticeNo()%>" class="noticePlus detailPlus">+</a>
                <% } else {%>
                	<label>공지사항이 존재하지 않습니다.</label>
                <% } %>
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
	      		location.href = "<%=contextPath%>/faq.customer";
	      	}
	      	function qa(){
	      		location.href = "<%=contextPath%>/qa.customer?currentPage=1";
	      	}
      	
      </script>
      
      
      
      
   <%@ include file="../common/footer.jsp" %>




</body>
</html>