<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semi.info.model.vo.*, com.kh.semi.common.*"%>
<%
	StoryFile file = (StoryFile)request.getAttribute("file");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        
        .titlePicture{
        	width : 1000px;
        	height : 500px;
        	border : 1px solid darkgray;
        	margin: auto;
            margin-bottom: 20px;
        }
        
        .titlePicture>img{
            width: 100%;
            height: 100%;
        }

        .photo{
            width: 400px;
            height: 400px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 30px;
        }

        .photo>#nationPhoto{
            width: 100%;
            height: 100%;
            border-radius: 10px;
        }

        .info-area{
            width: 80%;
            height: auto;
            padding : 5px 10px 5px 10px;
            margin: auto;
            margin-top : 10px;
            border : 1px solid darkgray;
            border-radius: 10px;
            margin: auto;
            margin-bottom: 8px;
        }

        input, textarea{
            border : none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
        
       input:focus, textarea:focus{
            border : none;
            outline: none;
            width: 100%;
            background-color: rgba(0, 0, 0, 0);
        }
 

        .btn{
            margin-top: 20px;
            text-align: center;
        }

        button {
            text-decoration: none;
            color : white;
            background-color: #ff595e;
            border : none;
            border-radius: 10px;
            padding : 5px 10px 5px 10px;
        }

        button:hover{
            cursor : pointer;
        }
        
        #backBtn{
        	margin-bottom : 50px;
        }
        
        label{
            font-size: 14px;
            font-weight: bold;
            margin : 0px;
        }
        

    </style>
</head>

<body>
	<%@ include file="adminbar.jsp" %>
	
	    
    <div class="outer">

        <div class="title">
            <h2>여행스토리</h2>
            <h3>여행스토리 상세보기</h3>
        </div>
       
        <div class="titlePicture">
        <% if(file.getFilePath() != null) { %>
            <img id="titlePhoto" src="<%=contextPath %>/<%=file.getFilePath() %>/<%=file.getChangeName() %>">
        <% } else {%>
        	<img id="titlePhoto" src="">
        	<% } %>
        </div>

        <form action="storyUpdate.admin" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="storyNo" value="<%=file.getStoryNo() %>">
        	<input type="hidden" name="board" value="7">
            <div class="info-area"><input type="text" name="title" value="<%=file.getStoryTitle() %>"></div>
            <div class="info-area"><textarea name="storyContent" cols="30" rows="10" style="resize: none;"><%=file.getStoryContent() %></textarea></div>
            <div class="info-area"><input type="text" name="from" value="<%=file.getStoryFrom() %>"></div>
            <div class="info-area"><input type="file" name="newFile" onchange="loadImg(this)" required > </div>
            <div class="btn">
            	<button type="submit" id="updateBtn"> 수정하기 </button>
            </div>

        </form>
        
		<div class="btn">
        	<button id="backBtn"> 목록으로 </button>
        </div>
        
        <script>
        $('#backBtn').click(function(){
        	location.href="<%=contextPath %>/story.admin?currentPage=1";
        })
        
        function loadImg(inputFile){
        	if(inputFile.files.length){
        		const reader = new FileReader();
        		reader.readAsDataURL(inputFile.files[0]);
        		reader.onload = function(e){
        			$('#titlePhoto').attr('src', e.target.result);
        		}
        	}
        	
        }
        
        </script>

    </div>

</body>
</html>