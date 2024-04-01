<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList , com.kh.semi.info.model.vo.*, com.kh.semi.pageInfo.model.vo.PageInfo
				 , java.util.List" %>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	List<City> list = (ArrayList<City>)request.getAttribute("list");
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

        .cityList{
            border-top : 1px solid lightgray;
            border-collapse: collapse;
            width: 80%;
            margin : auto;
            margin-top : 20px;
            
        }

        .cityList th{
            background-color: lightgray;
            border-bottom: 1px solid lightgray;
        }

        .cityList tbody tr:hover{
            .cityName {
                text-decoration: underline;
                cursor : pointer;
            }
        }
        
        .cityList tbody td{
        	text-align : center;
        	border-bottom: 1px solid lightgray;
        	padding : 5px 0px 5px 0px;
        }
        
        .btn{
            width: 100%;
            margin: auto;
        }
        
        .btn>button{
        	display : block;
        	border : non;
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


    </style>
</head>
<body>

	<%@ include file="adminbar.jsp" %>
    <div class="outer">

        <div class="title">
            <h2>국가/도시정보</h2>
            <h3>도시목록 </h3>
        </div>

        <div class="search">
            <form action="searchInfo.admin" method="get">
                <select name="category">
                    <option value="nation">국가</option>
                    <option value="city">도시</option>
                </select>
                <input type="text" name="keyword">
                <input type="hidden" name="currentPage" value="<%=pi.getCurrentPage() %>">
                <button type="submit">검색</button>
            </form>
        </div>
 
            <table class="cityList">
                <thead>
                    <tr>
                        <th>국가이름</th>
                        <th>도시이름</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="2"> 게시글이 없습니다</td>
                        </tr>
                    <% } else { %>
                        <% for(City c : list) { %>
                            <tr class="cityOne">
                                <td class="nationNo" id="<%=c.getNationNo()%>"><%=c.getNationName() %></td>
                                <td class="cityName" id="<%=c.getCityNo() %>"><%=c.getCityName() %></td>
                                <td><%=c.getCount() %></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>

        
        <script>
        
        $(function(){

        	$('.cityOne').click(function(){
        		location.href="<%=contextPath%>/cityinfo.admin?nationNo=" + $(this).children('.nationNo').attr('id') + "&cityNo=" + $(this).children('.cityName').attr('id');
        	});
        	
        })
        
        </script>
        
         <div class="paging-area" align="center">
        
        	<% if(currentPage > 1) { %>
        		<button onclick="location.href='<%=contextPath%>/nationCityList.admin?currentPage=<%=currentPage -1 %>'">이전</button>
          	<% } %>   
        	
			<% for(int i = startPage; i <= endPage; i++){ %>
			
				<% if(currentPage != i){ %>
				<button onclick="location.href='<%=contextPath%>/nationCityList.admin?currentPage=<%=i%>'"><%= i %></button>
				<%} else {%>
					<button disabled><%=i %></button>
				<%} %>
			<%} %>
			
			<% if(currentPage != maxPage) { %>
			  <button onclick="location.href='<%=contextPath%>/nationCityList.admin?currentPage=<%=currentPage + 1%>'">다음</button>
			<% } %>
        </div>
        

    </div>
</body>
</html>