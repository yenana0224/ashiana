<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.info.model.vo.*, com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	List<Nation> list = (ArrayList<Nation>)request.getAttribute("list");
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

        .nationList{
            border-top : 1px solid lightgray;
            border-collapse: collapse;
            width: 80%;
            margin : auto;
            margin-top : 20px;
            
        }

        .btn{
            width: 80%;
            margin: auto;
            margin-top: 10px;
        }

        .nationList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .nationList tbody tr:hover{
            .nationName {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .nationList tbody td{
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
        	display : block;
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin: 0px 5px 10px 0px;
            float : left;
        }
        
       .paging-area{
      		margin-top : 20px;
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
            <h2>국가/도시정보</h2>
            <h3>국가목록</h3>
        </div>

        <div class="search">
            <form action="info.admin" method="get">
                <select name="category">
                    <option value="nation">국가</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
                <button type="submit">검색</button>
            </form>
        </div>

            <table class="nationList">
                <thead>
                    <tr>
                        <th>국가번호</th>
                        <th>국가이름</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="2"> 게시글이 없습니다</td>
                        </tr>
                    <% } else { %>
                        <% for(Nation n : list) { %>
                            <tr>
                                <td><%=n.getNationNo() %></td>
                                <td class="nationName" id="<%=n.getNationNo() %>"><%=n.getNationName() %></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>

        <script>
        
        $(function(){

        	$('.nationName').click(function(){
        		location.href="<%=contextPath%>/nationInfo.admin?nationNo=" + $(this).attr('id');
        	});
        	
        })
        
        </script>
        
               <div class="paging-area" align="center">

        	<% if(category != null) { %>
        	    <% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/info.admin??category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=currentPage -1 %>'">이전</button>
          		<% } %>         		
        		<% for(int i = startPage; i <= endPage; i++){ %>
					<% if(currentPage != i){ %>
					<button onclick="location.href='<%=contextPath%>/info.admin??category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=i%>'"><%= i %></button>
					<%} else {%>
						<button style="background-color : darkgray" disabled><%=i %></button>
					<%} %>
				<%} %>
				<% if(currentPage != maxPage) { %>
			 	 <button onclick="location.href='<%=contextPath%>/info.admin??category=<%=category%>&keyword=<%=keyword%>&currentPage=<%=currentPage + 1%>'">다음</button>
				<% } %>	
							
        	<% } else { %>
        	    <% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/info.admin??currentPage=<%=currentPage -1 %>'">이전</button>
          		<% } %> 
				<% for(int i = startPage; i <= endPage; i++){ %>
					<% if(currentPage != i){ %>
					<button onclick="location.href='<%=contextPath%>/info.admin??currentPage=<%=i%>'"><%= i %></button>
					<%} else {%>
						<button style="background-color : darkgray" disabled><%=i %></button>
					<%} %>
				<%} %>
				<% if(currentPage != maxPage) { %>
			 	 <button onclick="location.href='<%=contextPath%>/info.admin??currentPage=<%=currentPage + 1%>'">다음</button>
				<% } %>
			
			<% } %>

        </div>

    </div>
</body>
</html>