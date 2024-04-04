<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.customer.model.vo.Notice, com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	List<Member> list = (List<Member>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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

        .memberList{
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

        .memberList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }


         .memberTitle:hover {
             text-decoration: underline;
             cursor : pointer;
         }

        
        .memberList tbody td{
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
        
        button:hover{
        	cursor : pointer;
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


    </style>
</head>
<body>

	<%@ include file="adminbar.jsp" %>
    <div class="outer">

        <div class="title">
            <h2>회원조회</h2>
            <h3>전체회원목록</h3>
        </div>

        <div class="search">
            <form action="#" method="get">
                <select name="category">
                    <option value="Id">아이디</option>
                    <option value="nickName">닉네임</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
                <button type="submit">검색</button>
            </form>
        </div>

        <form action="<%=contextPath %>/memberDelete.admin" method="get">
            <table class="memberList">
                <thead>
                    <tr>
                        <th> <input type="checkbox" name="memberNo" id="checkAll"></th>
                        <th>아이디</th>
                        <th>닉네임</th>
                        <th>회원가입일</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="4"> 회원이 없습니다</td>
                        </tr>
                    <% } else { %>
                        <% for(Member m : list) { %>
                        	<% if(!m.getUserId().equals("admin")){ %>
                            <tr>
                                <td>
                                	<input class="ckOne" type="checkbox" name="userNo" value="<%=m.getUserNo() %>"> 
                                </td>
                                <td><%=m.getUserId() %></td>
                                <td class="memberTitle" id="<%=m.getUserNo() %>"><%=m.getNickName() %></td>
                                <td><%=m.geteDate() %></td>
                            </tr>
                            <% } else {%>
                            <tr>
                                <td>
                                </td>
                                <td><%=m.getUserId() %></td>
                                <td class="memberTitle" id="<%=m.getUserNo() %>"><%=m.getNickName() %></td>
                                <td><%=m.geteDate() %></td>
                            </tr>
                            <%} %>
                        <% } %>
                    <% } %>
                    
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
                </tbody>
            </table>
            <div class="btn">
                선택 회원
                <button type="submit">탈퇴</button>
            </div>
        </form>
        
        <div class="paging-area" align="center">
        
        	<% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/member.admin?currentPage=<%=currentPage -1 %>'">이전</button>
          	<% } %>   
        	
			<% for(int i = startPage; i <= endPage; i++){ %>
			
				<% if(currentPage != i){ %>
				<button class="pagebtn" onclick="location.href='<%=contextPath%>/member.admin?currentPage=<%=i%>'"><%= i %></button>
				<%} else {%>
				<button style="background-color : darkgray" disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<% if(currentPage != maxPage) { %>
			  <button onclick="; location.href='<%=contextPath%>/member.admin?currentPage=<%=currentPage + 1%>'">다음</button>
			<% } %>
        </div>

           <script>
            
            $(function(){
            	
            	$('.memberTitle').click(function(){
            		location.href="<%=contextPath%>/memberDetail.admin?memberNo=" + $(this).attr('id');
            	});
            });
            </script>

    </div>
</body>
</html>