<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.customer.model.vo.Notice, com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	List<Notice> list = (ArrayList<Notice>)request.getAttribute("noticeList");
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

        .noticeList{
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

        .noticeList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .noticeList tbody tr:hover{
            #noticeTitle {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .noticeList tbody td{
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


    </style>
</head>
<body>

	<%@ include file="adminbar.jsp" %>
    <div class="outer">

        <div class="title">
            <h2>공지사항</h2>
            <h3>공지사항목록</h3>
        </div>

        <div class="search">
            <form action="#" method="get">
                <select name="category">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="keyword">
                <button type="submit">검색</button>
            </form>
        </div>

        <form action="#" name="status">
            <table class="noticeList">
                <thead>
                    <tr>
                        <th> <input type="checkbox" name="noticeNo" id="checkAll"></th>
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
                        <% for(Notice n : list) { %>
                            <tr>
                                <td><input type="checkbox" value="<%=n.getNoticeNo() %>"> 
                                
                                </td>
                                <td><%=n.getNoticeNo() %></td>
                                <td class="noticeTitle" id="<%=n.getNoticeNo() %>"><%=n.getNoticeTitle() %></td>
                                <td><%=n.getCreateDate() %></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>
            <script>
            
            $(function(){
            	
            	$('.noticeTitle').click(function(){
            		location.href="<%=contextPath%>/noticeDetail.admin?noticeNo=" + $(this).attr('id');
            		
            	});
            })

        
            </script>
            <div class="btn">
                선택 게시물 
                <button type="submit">고정</button>
                <button type="submit">삭제</button>
            </div>
        </form>

		<div class="btn">
        	<a href="<%=contextPath %>/noticeInsertForm.admin">글작성하기</a>
        </div>

    </div>
</body>
</html>