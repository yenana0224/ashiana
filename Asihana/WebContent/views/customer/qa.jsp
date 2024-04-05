<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.customer.model.vo.QNA , com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<QNA> qnaList = (ArrayList<QNA>)request.getAttribute("qnaList");
	String select = (String)request.getAttribute("select");
	String searchContent = (String)request.getAttribute("searchContent");
%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="$../../resources/css/customer/qna.css">
</head>
<body>
	<%@ include file="../common/headerbar.jsp" %>
	<div id="qaText">
        <p>Q & A</p>
    </div>
    
    <div id="search">
        <form action="<%=contextPath %>/qa.customer" method="get">
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
        <% if(qnaList.isEmpty()) { %>
        	<tr>
               <td colspan="4" style="color: #ff52a0;">조회된 게시글이 없습니다.</td>
            </tr>
        <% } else { %>
        
        	<% for(QNA qna : qnaList){ %>
	            <tr onmouseover="mouseIn(this);" onmouseout="mouseOut(this);">
	                <td class="td qaNo"><%=qna.getQnaNo() %></td>
	                
	                <% if(qna.getQnaStatus().equals("Y")) {%>
	                	<td class="td status" style="color:red;font-weight:bold;">답변완료</td>
	                <% } else { %>
	                	<td class="td status"></td>
	                <% } %>
	                
	                <td class="td title"><%=qna.getQnaTitle() %></td>
	                <td class="td date"><%=qna.getCreateDate() %></td>
	                
	            </tr>
         	<% } %>
         	
        <% } %> 	
        </tbody>
        
    </table>
    <% if(loginUser != null) { %>
    <div id="insertQa">
        <button>작성</button>
    </div>
	<% } %>
	
	<% if(!qnaList.isEmpty()) {%>
		<% if(searchContent != null) { %>
			<div id="buttonBox">
			<% if(pi.getCurrentPage() > 1){ %>
	        	<button id="backButton" onclick="location.href='<%=contextPath%>/qa.customer?select=<%=select%>&searchContent=<%= searchContent %>&currentPage=<%= pi.getCurrentPage() - 1%>'">이전</button>
	        <% } %>
	        
	        <% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
	        
	        	<% if( pi.getCurrentPage() != i) { %>
	        		<button class="numButton" onclick="location.href='<%=contextPath%>/qa.customer?select=<%=select%>&searchContent=<%= searchContent %>&currentPage=<%=i%>'"><%= i %></button>
	        	<% } else{ %>
	        		<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke"><%= i %></button>
	        	<% } %>
	        	
	        <% } %>
	        
	        <% if(pi.getCurrentPage() != pi.getMaxPage()) {%>
	       	 	<button id="nextButton" onclick="location.href='<%=contextPath%>/qa.customer?select=<%=select%>&searchContent=<%= searchContent %>&currentPage=<%= pi.getCurrentPage() + 1%>'">다음</button>
	        <% } %>
	    	</div>
		<% } else { %>
		
			<div id="buttonBox">
				<% if(pi.getCurrentPage() > 1){ %>
		        	<button id="backButton" onclick="location.href='<%=contextPath%>/qa.customer?currentPage=<%= pi.getCurrentPage() - 1%>'">이전</button>
		        <% } %>
		        
		        <% for(int i = pi.getStartPage(); i <= pi.getEndPage(); i++) { %>
		        	<% if( pi.getCurrentPage() != i) { %>
		        		<button class="numButton" onclick="location.href='<%=contextPath%>/qa.customer?currentPage=<%=i%>'"><%= i %></button>
		        	<% } else{ %>
		        		<button class="numButton" style="background-color: rgba(243, 101, 91, 0.877); color:whitesmoke"><%= i %></button>
		        	<% } %>
		        <% } %>
		        
		        <% if(pi.getCurrentPage() < pi.getMaxPage()) {%>
		       	 	<button id="nextButton" onclick="location.href='<%=contextPath%>/qa.customer?currentPage=<%= pi.getCurrentPage() + 1%>'">다음</button>
		        <% } %>
		        
		    </div>
		<% } %>
		
	<% } else { %>
		<div id="buttonBox">
		</div>
	<% } %>
	
	
	<script>
		$('#insertQa>button').click(function(){
			location.href='<%=contextPath%>/enrollQa.customer';
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
			
			location.href='<%=contextPath%>/qnaDetail.customer?qnaNo=' + qaNo + '&currentPage=' + <%=pi.getCurrentPage()%>;
		})
	
	</script>
	
	
	
	
	
	
	<%@ include file="../common/footer.jsp" %>	
	
</body>
</html>