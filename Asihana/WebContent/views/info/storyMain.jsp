<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, java.util.List, com.kh.semi.pageInfo.model.vo.PageInfo" %>
<%
	List<Story> list = (List<Story>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        .main{
            width : 1000px;
            margin : auto;
        }
        
        .mainTitle{
        	width : 100%;
        	height : 40px;
        	margin : 20px 0px 20px 0px;
        	text-align : center;
        	font-size : 30px;
        	font-weight : bold;
        	
        }

        .story {
            width: 900px;
            height: auto;
            margin : auto;
            padding : 20px 10px 20px 10px;
        }

        .storyphoto{
            width: 900px;
            height: 300px;
            margin : auto;
            background-color : white;
        }

        .storyphoto>img{
            width: 100%;
            height: 100%;
        }

        .content{
            width: 900px;
            height: 150px;
            margin : auto;
            background-color : white;
        }

        .title{
            margin: 0px;
            padding : 0px;
            width: 100%;
            height: 120px;
        }

        .title>p{
            margin-top : 20px;
            padding : 20px 0px 20px 0px;
            width: 100%;
            line-height: 100%;
            font-weight: bold;
            font-size : 25px;
            text-align: center;
        }

        .createDate{
            margin: 0px;
            padding : 0px;
            width: 100%;
            height: 30px;
            text-align: right;
            color : darkgray;
        }

        .createDate>p{
            margin : 0px;
            padding : 5px 20px 0px 0px;
            width: auto;
            line-height: 100%;
            font-size : 16px;
            text-align: right;
        }

        .btn{
            margin: 20px;
            padding : 5px 10px 5px 10px;
            width: auto;
            float : right;
            background-color: #ff595e;
            border-radius: 10px;
        }

        .btn>a{
            display : block;
            text-decoration: none;
            color : white;
        }

</style>
</head>
<body>

<%@ include file="../common/headerbar.jsp" %>
    <div class="outer">

        <div class="main">
        
            <div class="mainTitle"> S T O R Y </div>
            
            <% if(list.isEmpty()){ %>

            <div class="story">
            	<div class="content">
            		<div class="title"><p>등록된 게시글이 없습니다</p></div>
            	</div>
           	</div>
           	
            <% } else { %>
            
	         <% for(Story s : list) { %>
	            <div class="story">
	                <div class="storyphoto">
	                    <img src="" alt="">
	                </div>
	                <div class="content">
	                	<div class="createDate"><p><%=s.getCreateDate() %></p></div>
	                    <div class="title"><p><%=s.getStoryTitle() %></p></div>

	                </div>
            	</div>
	            <% } %>
	        </div>
	      <% } %>
	         

	        
	        
	         
       </div>

   </div>
   <%@ include file="../common/footer.jsp" %>
   
</body>
</html>