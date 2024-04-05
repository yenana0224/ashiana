<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semi.customer.model.vo.*" %>
<%
	Notice noticeDetail = (Notice)request.getAttribute("noticeDetail");
	NoticeFile noticeFile = (NoticeFile)request.getAttribute("noticeFile");
	String currentPage = (String)request.getAttribute("currentPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="$../../resources/css/customer/noticeDetail.css">
</head>
<body>
	
	<%@ include file="../common/headerbar.jsp" %>
	
			<div id="noticeMark">
                <p>공지사항</p>
            </div>
            
            <div id="noticeBox">

                <div id="titleBox">
                    <p><%= noticeDetail.getNoticeTitle() %></p>
                </div>
                
                <div id="dateBox">
                    <label style="font-size: 12px;">작성일</label>
                    <p><%= noticeDetail.getCdate() %></p>
                </div>
                
                <% if(noticeFile != null) { %>
                
	                <div id="imageBox">
	                    <img src="<%=contextPath + "/" +noticeFile.getFilePath() + "/" + noticeFile.getChangeName()%>" alt="">
	                </div>
	                
	                <div id="noticeText">
	                    <p><%= noticeDetail.getNoticeContent() %></p>
	                </div>
	                
                <% } else{ %>
                
	                <div id="noticeText">
	                    <p><%= noticeDetail.getNoticeContent() %></p>
	                </div>
	                <div id="imageBox" style="border:none;">
	                </div>
	                
                <% } %>
                
                <div id="buttonBox">
	                <% if(loginUser != null) {%>
	                
	                    <% if(loginUser.getUserId().equals("admin")){ %>
	                    
		                    <button class="btn btn-sm btn-danger" onclick="noticeUpdate();">수정</button>
		                    <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
		                    
	                    <% } else { %>
	                    
	                    	<button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
	                    	
	                    <% } %>
	                    
	                <% } else { %>
	                
	                	 <button class="btn btn-sm btn-secondary" onclick="noticeBack();">목록</button>
	                	 
	                <% } %>
	                    
                </div>
                
            </div>
		
		<script>
			function noticeBack(){
				location.href='<%=contextPath%>/notice.customer?currentPage=<%=currentPage%>'
			}
			function noticeUpdate(){
				location.href='<%=contextPath%>/noticeUpdateForm.admin?noticeNo=<%=noticeDetail.getNoticeNo()%>'
			}
			
		
		</script>
		
		
	<%@ include file="../common/footer.jsp" %>


</body>
</html>