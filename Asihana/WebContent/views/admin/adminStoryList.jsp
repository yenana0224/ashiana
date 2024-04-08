<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.info.model.vo.*, com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	List<Story> list = (ArrayList<Story>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int count = (int)request.getAttribute("count");
	String category = (String)request.getAttribute("category");
	String keyword = (String)request.getAttribute("keyword");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>

        .title{
            padding-left: 20px;
            width: 100%;
            height: 100px;
            font-weight: bold;
        }
        
        .title>h3{
        	margin-top : 10px;
        }

        .search{
            margin : 0px 0px 10px 0px;
            display : block;
            width:100%;
            height: auto;
            text-align: center;
        }

        .search select{
            font-size: medium;
        }

        .search button {
            text-align: center;
            padding : 5px 10px 5px 10px;
            border-radius: 10px;
            background-color: #ff595e;
            color : white;
            border : none;
            font-size : 15px;
        }
        
        #countTitle{
        	width: 80%;
        	text-align : center;
            margin : auto;
            margin-bottom : 20px;
            font-size : 14px;
        }

        .storyList{
            border-top : 1px solid lightgray;
            border-collapse: collapse;
            width: 80%;
            margin : auto;
        }

        .btn{
            width: 80%;
            margin: auto;
            margin-top: 10px;
        }

        .storyList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .storyList tbody tr:hover{
            .storyTitle {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .storyList tbody td{
        	text-align : center;
        	border-bottom: 1px solid lightgray;
        	padding : 5px 0px 5px 0px;
        }
        
        .btn>button{
        	border : none;
        	background-color: #ff595e;
        	color : white;
        	padding : 5px 10px 5px 10px;
        	border-radius: 10px;
        }

        .btn>a{
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin-right: 20px;
            float : right;
        }
        
       .paging-area{
      		margin-top : 20px;
      		margin-bottom : 20px;
       }
        
       .paging-area>button{
            text-align: center;
            padding : 5px 10px 5px 10px;
            border-radius: 10px;
            background-color: #ff595e;
            color : white;
            border : none;
            font-size : 15px;
        }
        
        .paging-area>button:hover{
        	cursor : pointer;
        }


    </style>
</head>
<body>

	<%@ include file="adminbar.jsp" %>
    <div class="outer">

        <div class="title">
            <h2>여행스토리</h2>
            <h3>여행스토리목록</h3>
        </div>

        <div class="search">
            <form action="story.admin" method="get">
                <select name="category">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
                <button type="submit">검색</button>
            </form>
        </div>

        <form action="storyDel.admin" name="status">
        	<% if(category != null) { %>
        	<h6 id="countTitle"> 검색결과 : <%=count %>개의 게시글이 조회되었습니다</h6>
        	<% } %>
            <table class="storyList">
                <thead>
                    <tr>
                        <th> <input type="checkbox" name="storyNo" id="checkAll"></th>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="4"> 게시글이 없습니다</td>
                        </tr>
                    <% } else { %>
                        <% for(Story s : list) { %>
                            <tr>
                            <td><input class="ckOne" type="checkbox" name="storyNo" value="<%=s.getStoryNo() %>"></td>
                                <td><%=s.getStoryNo() %></td>
                                <td class="storyTitle" id="<%=s.getStoryNo() %>"><%=s.getStoryTitle() %></td>
                                <td><%=s.getCreateDate() %></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
                        <script>
                    	$(function(){
                    		$('#checkAll').click(function(){
                    			if($('#checkAll').prop('checked')){
	                    			$('.ckOne').prop('checked', true);
                    			} else {
                    				$('.ckOne').prop('checked', false);
                    			}
                    		});
                    		
                    		$('#checkAll').on('change', function(){
	                    		if($(this).prop('checked') == false){
	                    			$('#checkAll').prop('checked', false);
	                    		}
                    		});
                    	})
                    </script>
            </table>
            <div class="btn">
                선택 게시물 
                <input type="hidden" name="boardType" value="7">
                <button type="submit">삭제</button>
            </div>
        </form>
        
       <div class="paging-area" align="center">

        	<% if(category != null) { %>
        	    <% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/story.admin?category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=currentPage -1 %>'">이전</button>
          		<% } %>         		
        		<% for(int i = startPage; i <= endPage; i++){ %>
					<% if(currentPage != i){ %>
					<button onclick="location.href='<%=contextPath%>/story.admin?category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=i%>'"><%= i %></button>
					<%} else {%>
						<button style="background-color : darkgray" disabled><%=i %></button>
					<%} %>
				<%} %>
				<% if(currentPage != maxPage) { %>
			 	 <button onclick="location.href='<%=contextPath%>/story.admin?category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=currentPage + 1%>'">다음</button>
				<% } %>	
							
        	<% } else { %>
        	    <% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/story.admin?currentPage=<%=currentPage -1 %>'">이전</button>
          		<% } %> 
				<% for(int i = startPage; i <= endPage; i++){ %>
					<% if(currentPage != i){ %>
					<button onclick="location.href='<%=contextPath%>/story.admin?currentPage=<%=i%>'"><%= i %></button>
					<%} else {%>
						<button style="background-color : darkgray" disabled><%=i %></button>
					<%} %>
				<%} %>
				<% if(currentPage != maxPage) { %>
			 	 <button onclick="location.href='<%=contextPath%>/story.admin?currentPage=<%=currentPage + 1%>'">다음</button>
				<% } %>
			
			<% } %>

        </div>

		<div class="btn">
        	<a href="<%=contextPath %>/storyInsertForm.admin">글작성하기</a>
        </div>
        
        <script>
        $(function(){

        	$('.storyTitle').click(function(){
        		location.href="<%=contextPath%>/storyDetail.admin?storyNo=" + $(this).attr('id');
        	});
        	
        })
        </script>

    </div>
</body>
</html>