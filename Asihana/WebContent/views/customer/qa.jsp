<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.customer.model.vo.QNA , com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>
<%
	List<QNA> qnaList = (ArrayList<QNA>)request.getAttribute("qnaList");
	String select = (String)request.getAttribute("select");
	String searchContent = (String)request.getAttribute("searchContent");
%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	   #qaText{
            margin: auto;
            width: 1000px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            margin-top: 50px;
            border-bottom: 1px solid rgba(75, 70, 70, 0.692);
        }
        #qaText>p{
            margin: 0;
            margin-bottom: 40px;
        }


        #search{
            margin: auto;
            width: 800px;
            height: 100px;
            text-align: center;
            margin-top: 15px;
            background-color: rgb(247, 240, 233);
            border-radius: 15px;
        }
        #search>form{
            position: relative;
            top: 33%;
            height: 32px;
        }
        #select{
            height: 100%;
            width: 60px;
            text-align: center;
            border: 1px solid rgb(180, 108, 108);
            border-radius: 5px;
        }
        #select:focus{outline: none;}
        #searchText{
            height: 100%;
            width: 300px;
            border: 1px solid rgb(180, 108, 108);
            border-radius: 5px;
            box-sizing: border-box;
        }
        #searchText:focus{outline: none;}
        #search button{
            position: relative;
            top: 2px;
            right: 5px;
            height: 100%;
            width: 50px;
            border-radius: 5px;
            border: none;
            background-color: red;
            color: white;
            font-weight: bold;
        }
        #search button:active{
            box-shadow: 3px 3px 3px rgba(204, 96, 96, 0.5);
            position: relative;
            top:2px
        }

        
        .table{
            width: 1000px;
            margin: auto;
            text-align: center;
        }
        .noticeNo{
            width: 30%;
            border-left: none;
            border-right: none;
        }
        .title{
            width: 50%;
            border-left: none;
            border-right: none;
            padding-right: 120px;
        }
        .date{
            width: 20%;
            border-left: none;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th{
            border-bottom: 1px solid #b182827a;
            padding: 20px;
            background-color: rgb(247, 240, 233);
            border-radius: 5px;
            font-size: 15px;
        }
        td{
            border-bottom: 1px solid #b18282c4;
            padding: 15px;
            background-color: rgba(247, 240, 233, 0.253);
            font-size: 15px;
        }
        #insertQa{
            margin: auto;
            margin-top: 30px;
            width: 1000px;
            height: 40px;
            text-align: right;
        }
        #insertQa>button{
            border: none;
            background-color: red;
            width: 45px;
            height: 30px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }
        #buttonBox{
            width: 1000px;
            text-align: center;
            margin: auto;
            margin-top: 30px;
        }
        #backButton, #nextButton{
            width: 45px;
            height: 30px;
            background-color: red;
            border: none;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }
        .numButton{
            width: 30px;
            height: 30px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
        }
        tbody:hover{
            background-color:rgb(247, 240, 233); ;
        }

</style>

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