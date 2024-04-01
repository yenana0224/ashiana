<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*"%>
<%
	StoryFile s = (StoryFile)request.getAttribute("story");
	int pageNo = (int)request.getAttribute("pageNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .outer{
            width: 1200px;
            margin : auto;
            margin-bottom : 100px;
        }

        .main{
            width : 1000px;
            margin : auto;
        }
        
        .title{
        	width : 1000px;
        	height : auto;
        	margin-top : 60px;
        }

        .title>p{
            font-size : 25px;
            font-weight: bold;
            text-align: center;
        }

        .createDate>p{
            color : darkgray;
            font-size : 15px;
            text-align: right;
            padding-right: 20px;
        }

        .photo{
            width: 100%;
            height : 400px;
        }

        .photo>img{
            width: 100%;
            height: 100%;
        }

        .content-area{
            width: 100%;
            height: auto;
        }

        .content-area>pre{
            padding : 0px;
            font-size : 18px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;

        }

        .from-area{
            width: 100%;
            height: 20px;
            text-align: right;
        }

        .btn{
            width: 100%;
            height: auto;
            text-align: center;
            margin : 50px 0px 20px 0px;
        }

        .btn>a{
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
            margin-right: 20px;
        }

    </style>
</head>
<body>
    <%@ include file="../common/headerbar.jsp" %>
    <div class="outer">
        <div class="main">

            <div class="title">
                <p><%= s.getStoryTitle() %></p>
            </div>
            <div class="createDate">
                <p><%= s.getCreateDate() %></p>
            </div>

            <div class="photo">
                <img src="<%=contextPath %>/<%=s.getFilePath() %>/<%=s.getChangeName() %>">
            </div>

            <div class="content-area">
                <pre>
    <%= s.getStoryContent() %> 
                </pre>
            </div>

            <div class="from-area">
            	<% if(s.getStoryFrom() != null) { %>
                <p>출처 : <%= s.getStoryFrom() %> </p>
                <% } %>
            </div>

            <div class="btn">

    		<% if(loginUser == null || !loginUser.getUserId().equals("admin")) {%>
    		    <a href="<%=contextPath%>/story.info?currentPage=<%=pageNo%>">목록으로</a>
    		<% } else {%>
    			<a href="<%=contextPath%>/story.info?currentPage=<%=pageNo%>">목록으로</a>
    			<a href="#">수정하기</a>
    		<% } %>
            </div>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>